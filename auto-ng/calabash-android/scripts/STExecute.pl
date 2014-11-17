#!/usr/bin/perl

#----------------------------------------------------------------------------------------#

# Use Files:

#----------------------------------------------------------------------------------------#

use File::Copy;

use File::Path;

use Net::FTP;

use IO::Socket;

use Sys::Hostname;

use Switch;

use Cwd;

use File::Basename;

use POSIX qw/strftime/;



#----------------------------------------------------------------------------------------#

# Functions:

#----------------------------------------------------------------------------------------#

#

#----------------------------------------------------------------------------------------#

sub ConstructExecutionLine {

	my $stexe=shift;

	my $vtp=shift;

	my $plan=shift;

	my $agentip=shift;

	my $args=shift;

	my $query=shift;

	my $optfile=shift;

	
	print "Plaform is: $platform";

	$cmd = '';
	if ($platform eq "Windows") {
		if ($agentip ne '') {
			$cmd = $cmd."$stexe -m  $agentip -q ";
		}else{
			$cmd = $cmd."$stexe -q ";
		}
		$cmd = $cmd.' -resextract ';
		
		if ($vtp ne '') {$cmd = $cmd." -proj  $vtp ";}
		
		if ($plan eq '') {
			print "******* ERROR: Unable to run Test Plan File is not provided \n";
			exit;
		}

		if ($query ne '') {$cmd = $cmd." -query  $query";}

		$cmd = $cmd." -r $plan";

		if ($args ne '') {$cmd = $cmd." $args";}

	}

	elsif ($platform eq "iUnix") {

		$cmd = "/opt/auto-ng/calabash/scripts/ExecuteComponent.sh";

		if ($query ne ''){

			print "******* ERROR: Unable to run Test Plan File is not provided \n";

			exit;

		}

		$cmd = $cmd." $query";

	}
	
	elsif ($platform eq "aUnix") {

		print "Starting android tests";	
	
		$cmd = "/opt/auto-ng/calabash-android/scripts/ExecuteComponent.sh";

		if ($query ne ''){

			print "******* ERROR: Unable to run Test Plan File is not provided \n";

			exit;

		}

		$cmd = $cmd." $query";

	}

	return $cmd;

}

#----------------------------------------------------------------------------------------#

#

#----------------------------------------------------------------------------------------#

sub RemoveExtFromFileName {

	my $file_name=shift;



	@filesplit = split(/\./, $file_name);

	$name = @filesplit[0];



	return $name;

}

#----------------------------------------------------------------------------------------#

sub ChangeAdrFileStatus {

	my $adr_dir=shift;

	my $file_name1=shift;

	my $status=shift;



	$file_without_ext = RemoveExtFromFileName($file_name1);

	$file_name2 = "$file_without_ext.$status";



	if ($platform eq "Windows") {

		$adr_file1 = "$adr_dir\\$file_name1";

		$adr_file2 = "$adr_dir\\$file_name2";

	}

	elsif ($platform eq "iUnix") {

		$adr_file1 = "$adr_dir/$file_name1";

		$adr_file2 = "$adr_dir/$file_name2";

	}

	elsif ($platform eq "aUnix") {

		$adr_file1 = "$adr_dir/$file_name1";

		$adr_file2 = "$adr_dir/$file_name2";

	}



	move($adr_file1,$adr_file2);



	return $file_name2;

}



#----------------------------------------------------------------------------------------#

sub byTime{

	($host1 ,$product1, $testhost1, $build1, $adr1, $time1)= split(/_/,$a);

	($host2 ,$product2, $testhost2, $build2, $adr2, $time2)= split(/_/,$b);

	return ($time1<$time2);

}





#----------------------------------------------------------------------------------------#

sub GetListOfAdrFiles {

	my $dirtoget=shift;

	my $hostname=shift;

	my $status=shift;



	opendir(IMD, $dirtoget) || die("Cannot open directory");



	@thefiles= readdir(IMD);



	closedir(IMD);



	@thefiles = sort @thefiles;



	my @adrs = qw();



	foreach $f (@thefiles) {

		unless ( ($f eq ".") || ($f eq "..") ) {



			if (($f =~ /$hostname/) && ($f =~ /$status/)){

				push(@adrs,$f);

			}



 		}

	}
	
	print @adrs;
	return @adrs;

}

#----------------------------------------------------------------------------------------#

#

#----------------------------------------------------------------------------------------#

sub GetHostName {

	$hostname = hostname;



	return $hostname;

}

#----------------------------------------------------------------------------------------#

#

#----------------------------------------------------------------------------------------#

sub chomp_plus {

	my $string=shift;

	$string =~ s/^\s+//;

	chomp $string;

	return $string;

}

sub PrintOutputMessage {

	my $MessageTYpe=shift;

	my $Header=shift;

	my $Message=shift;

	my $Exit=shift;



	print "******************************************************************************\n";

	print "*\n";

	print "*	$MessageTYpe: $Header \n";

	print "*\n";

	print "*	$Message \n";

	print "*\n";

	print "*****************************************************************************\n";



	if ($Exit eq TRUE){

		exit;

	}

}

sub PrintToLog {

	my $LogFile=shift;

	my $Message=shift;



	#open(LOG,">>$LogFile") || die("Cannot Open File");



	#$datatime = strftime('%d-%b-%Y %H:%M',localtime);

	#print LOG "$datatime: $Message \n";

	#print "LOG: $Message \n";



	#close(LOG);





}

#----------------------------------------------------------------------------------------#

#

#

###############################   START OF STExecute	##################################

#

#

#----------------------------------------------------------------------------------------#

# Check for Arguments:

#----------------------------------------------------------------------------------------#



#bacK:

$numArgs = $#ARGV + 1;
$partner = "partner";
$runtime = "runtime";
$calabash = "calabash";
$calabashandroid = "calabash-android";


$stlog = "LOG_STEXECUTE.log";



#----------------------------------------------------------------------------------------#

# Check for Platform:

#----------------------------------------------------------------------------------------#

$platform = "Windows";



if ($ARGV[0] eq $calabash) {

	$platform = "iUnix";

}

if ($ARGV[0] eq $calabashandroid) {


	$platform = "aUnix";

}





if (($numArgs eq 0)||($numArgs eq 1)){

	PrintOutputMessage("ERROR","Unable to Start STExecute.pl","Arguments: arg1 -> [partner] or [runtime], arg2 -> [root_adr_dir]",TRUE);

}else{

	if (($ARGV[0] ne $partner) and ($ARGV[0] ne $runtime) and ($ARGV[0] ne $calabash) and ($ARGV[0] ne $calabashandroid)){

		PrintOutputMessage("ERROR","Invalid $ARGV[0] ST (.exe) name","Valid Names: [partner.exe] or [runtime.exe]",TRUE);

	}else{

		print "Im here now\n";
		$strunner = $ARGV[0];
		$adr_root_dir = $ARGV[1];
		$ngc_adr_dir = $adr_root_dir;	

		print $strunner;

		PrintOutputMessage("STARTING","STExecute","with SilkTest set to [$strunner] & directory path [$ngc_adr_dir]",false);

		PrintToLog($stlog,"STARTING: STExecute","with SilkTest set to [$strunner] & directory path [$ngc_adr_dir]");

	}

}





#----------------------------------------------------------------------------------------#



print "\n";
back:



$Product = "Product";
$BuildNumber = "BuildNumber";
$InstallType = "InstallType";
$Profile = "Profile";
$RuntimeMachine = "RuntimeMachine";
$TestMachine = "TestMachine";
$TestLanguage = "TestLanguage";
$Device3G = "Device3G";
$Arguments = "Arguments";
$EmailList = "EmailList";
$UpdateSource = "UpdateSource";
$TestAreas = "TestAreas";
$Date = "Date";
$ADR_File = "ADR_File";
$PlanFile = "PlanFile";
$VptFile = "VptFile";
$ResultDir = "ResultDir";
$Setup= "Setup";
$ResExport = "ResExport";
$ResExtract = "ResExtract";
$CompLog = "CompLog";
$SourceDir = "SourceDir";
$NgcSourceDir = "NgcSourceDir";
$BuildMode = "BuildMode";

$ValueProduct = "";
$ValueBuildNumber = "";
$ValueInstallType = "";
$ValueProfile = "";
$ValueRuntimeMachine = "";
$ValueTestMachine = "";
$ValueTestLanguage = "";
$ValueDevice3G = "";
$ValueArguments = "";
$ValueEmailList = "";
$ValueUpdateSource = "";
$ValueTestAreas = "";
$ValueDate = "";
$ValueADR_File = "";
$ValuePlanFile = "";
$ValueVptFile = "";
$ValueResultDir = "";
$ValueSetup = "";
$ValueResExport = "";
$ValueResExtract = "";
$ValueCompLog = "";
$ValueSourceDir = "";
$ValueNgcSourceDir = "";
$ValueBuildMode = "";

#$ngc_adr_dir = '\\\192.168.230.10\\ngc-store\\adr';

#$ngc_adr_dir = 'c:\\adr\\qa1';



$hostname = GetHostName();



PrintToLog($stlog,"WHO ARE YOU? I am $hostname");

PrintToLog($stlog,"$hostname: Any Job?");



$status = "pending";



START:



eval {

	print "\nADR_DIR:\n";
	print $ngc_adr_dir."\n";

	@adrs = GetListOfAdrFiles($ngc_adr_dir,$hostname,$status);
	print "ADRS: ".@adrs;

	while (!@adrs) {

		sleep(10);

		print "No Job!\n";

		@adrs = GetListOfAdrFiles($ngc_adr_dir,$hostname,$status);

	}

};



if ($@) {
	print "Error";
	print($ngc_adr_dir);

	$urgent_msg = "unable to access $ngc_adr_dir!";

	$urgent_mail_tpl_file = "$adr_root_dir\\mailbox\\drafts\draft_network_down.bat";



	print("$urgent_msg \n");

	sleep(30);



	$datatime = strftime('%d%b%Y%H%M%S',localtime);

	open (MYFILE, ">>$adr_root_dir\\mailbox\\error_$datatime.txt");

	print MYFILE "e:\n";

	print MYFILE "cd ADR\AutoEmail \n";

	print MYFILE 'postie -host:mail1.ipass.com -to:ayusupov@ipass.com -from:autotest@ipass.com -s:'.'"'.$urgent_msg.'"'.' -import -file:'.$urgent_mail_tpl_file;



	close (MYFILE);



	goto START;



};


$adr_file_pending = @adrs[0];

print("\n===========\n");
print($adr_file_pending);
print("\n===========\n");
if($platform eq "Windows"){
	$adr_fullpath_pending = $ngc_adr_dir."\\".$adr_file_pending;
}
else {
	$adr_fullpath_pending = $ngc_adr_dir."/".$adr_file_pending;
}

PrintToLog($stlog,"$hostname: I got a job ADR: [$adr_file_pending]");



#-------------------------------------------------------------

# Constructing ADR Log File:

#-------------------------------------------------------------



$log_adr = RemoveExtFromFileName($adr_file_pending).".log";

PrintToLog($log_adr,"STARTING ADR: [$adr_file_pending]");



#-------------------------------------------------------------

# Reading ADR Pending File

#-------------------------------------------------------------

print("\n $adr_fullpath_pending");
print("\n==================\n");

open(FILE, $adr_fullpath_pending) or die("Unable to open file");

	@data = <FILE>;

close(FILE);



PrintToLog($log_adr,"READING ADR: [$adr_file_pending]");



#-------------------------------------------------------------

# Changing ADR's Pending to Running Status:

#-------------------------------------------------------------



$status = "running";

$adr_file_running = ChangeAdrFileStatus($ngc_adr_dir,$adr_file_pending,$status);

PrintToLog($log_adr,"RENAMING ADR TO: [$adr_file_running]");



#-------------------------------------------------------------

# assigning values

#-------------------------------------------------------------



PrintToLog($log_adr,"LOADING ADR DATA: @data");





foreach (@data) {

	$line = $_;



	@dataline = split(/=/, $line);

	$param = @dataline[0];

	$value = chomp_plus(@dataline[1]);



	switch ($param)  {

		case ($Product) {$ValueProduct = $value;break;}

		case ($BuildNumber) {$ValueBuildNumber = $value;break;}

		case ($InstallType) {$ValueInstallType = $value;break;}

		case ($Profile) {$ValueProfile = $value;break;}

		case ($RuntimeMachine) {$ValueRuntimeMachine = $value;break;}

		case ($TestMachine) {$ValueTestMachine = $value;break;}

		case ($TestLanguage) {$ValueTestLanguage = $value;break;}

		case ($Device3G) {$ValueDevice3G = $value;break;}

		case ($Arguments) {$ValueArguments = $value;break;}

		case ($EmailList) {$ValueEmailList = $value;break;}

		case ($UpdateSource) {$ValueUpdateSource = $value;break;}

		case ($TestAreas) {

			$ValueTestAreas = $value;

			@ArrayTestAreas = split(/,/,$ValueTestAreas);

			break;

		}

		case ($Date) {$ValueDate = $value;break;}

		case ($ADR_File) {$ValueADR_File = $value;break;}

		case ($PlanFile) {$ValuePlanFile = $value;break;}

		case ($VptFile) {$ValueVptFile = $value;break;}

		case ($ResultDir) {$ValueResultDir = $value;break;}

		case ($Setup) {$ValueSetup = $value;break;}

		case ($ResExport) {$ValueResExport = $value;break;}

		case ($ResExtract) {$ValueResExtract = $value;break;}

		case ($SourceDir) {$ValueSourceDir = $value;break;}

		case ($NgcSourceDir) {$ValueNgcSourceDir = $value;break;}

		case ($CompLog) {$ValueCompLog = $value;break;}

		case ($BuildMode) {$ValueBuildMode = $value;break;}

	}

}

#-------------------------------------------------------------

# Update Source:

#-------------------------------------------------------------

if ($ValueUpdateSource eq "on") {



	$CurrentDir = cwd;



	$OldValueSourceDir = $ValueSourceDir."_old";



	if (-d $OldValueSourceDir){



		rmtree($OldValueSourceDir, 1);



	}





	if (-d $ValueSourceDir) {

		move($ValueSourceDir,$OldValueSourceDir);

	}



	mkdir $ValueSourceDir or die;



	PrintToLog($log_adr,"Updating Source: from [$ValueNgcSourceDir] to [$ValueSourceDir]");



	if ($platform eq "Windows") {

		system ('xcopy /E /Y /R '.$ValueNgcSourceDir." $ValueSourceDir");

		chdir $ValueSourceDir;



		system("attrib -r /s /d");



		chdir $CurrentDir;

	} elsif ($platform eq "iUnix") {

		system ('cp -rf '.$ValueNgcSourceDir." $ValueSourceDir");

		chdir $ValueSourceDir;

		system ('chmod 755 -R '.$ValueSourceDir);

		chdir $CurrentDir;

	} elsif ($platform eq "aUnix") {

		system ('cp -rf '.$ValueNgcSourceDir." $ValueSourceDir");

		chdir $ValueSourceDir;

		system ('chmod 755 -R '.$ValueSourceDir);

		chdir $CurrentDir;

	} else {

		system ('scp -r ngc-adrdata@'.$ValueNgcSourceDir." $ValueSourceDir");

		#scp -r ngc-adrdata@10.10.230.55:/adrdata/source/prod/omi/3-1-0/auto-ng/calabash

}

}



	#chdir $ValueSourceDir;



	#system("attrib -r /s /d");



	#chdir $CurrentDir;






#-------------------------------------------------------------

# Copy ADR file to Setup dir on Runtime system:

#-------------------------------------------------------------

if ($ValueSetup ne "") {



	if ($platform eq "Windows"){

		$adr_fullpath_file = $ngc_adr_dir."\\".$adr_file_running;

		$adr_setup_file = $ValueSetup."\\adr.ini";

	}

	else {

		$adr_fullpath_file = $ngc_adr_dir."/".$adr_file_running;

		$adr_setup_file = $ValueSetup."/adr.ini";

	}



	copy($adr_fullpath_file,$adr_setup_file);



	PrintToLog($log_adr,"Copy ADR: from [$adr_fullpath_file] to [$adr_setup_file]");

}





#-------------------------------------------------------------

# Execution:

#-------------------------------------------------------------

PrintToLog($log_adr,"STARTING EXECUTION:");



if ($platform eq "Windows") {

	system("$strunner -proj $ValueVptFile -q");

}

else {

	# do nothing

}



foreach (@ArrayTestAreas){

	@SingleTest = split(/:/,$_);

	$Query = @SingleTest[0];

	$AgentConnect = @SingleTest[1];



	#if ($ValueArguments ne ""){



	#	$ValueArguments = $ValueArguments." QUERY:$Query";

	#}else{

	#	$ValueArguments = $ValueArguments."QUERY:$Query";

	#}


	#if ($AgentConnect eq 0){



	#	$cmd = ConstructExecutionLine($strunner,'',$ValuePlanFile,'',$ValueArguments,$Query)."\n";





	#}else{



	#	$cmd = ConstructExecutionLine($strunner,'',$ValuePlanFile,$ValueTestMachine,$ValueArguments,$Query)."\n";

	#}


	$ADR_Zip_File = $ValueADR_File . ".zip";
	
	$cmd = "/opt/auto-ng/calabash-android/scripts/ExecuteComponent.sh $Query $ADR_Zip_File";



	PrintToLog($log_adr,"STARTING TEST: $cmd");

	system($cmd);

	PrintToLog($log_adr,"ENDING TEST: $cmd");

}



if ($ValueResultDir ne ""){







}



#-------------------------------------------------------------

# Renaming to Completed:

#-------------------------------------------------------------



$status = "completed";

$adr_file_completed = ChangeAdrFileStatus($ngc_adr_dir,$adr_file_running,$status);



PrintToLog($log_adr,"RENAMING ADR TO: [$adr_file_completed]");

PrintToLog($log_adr,"THE END");



PrintToLog($stlog,"$hostname: Job is completed for ADR: [$adr_file_completed]");

PrintToLog($stlog,"$hostname: Back To Work :(");

PrintToLog($stlog,"\n");

PrintToLog($stlog,"******************************************************************************\n");



goto back;











#----------------------------------------------------------------------------------------#

#

#

###############################   END OF STExecute	##################################

#

#

#----------------------------------------------------------------------------------------#







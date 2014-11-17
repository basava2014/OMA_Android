require_relative '../lib/logger.rb'

logger = OMLogger.instance

Before do |scenario|
	Calx.ResetErrorRecords
  	logger.info("************************************************ #{scenario.source_tag_names[0]} - Start ************************************************")
end

After do |scenario|
	logger.info("************************************************ #{scenario.source_tag_names[0]} - End ************************************************")
end


AfterStep do |scenario|

	@currentStep ||= 0
	begin
		if @currentStep === (scenario.steps.length-1)
			if Calx.tcFail
				logger.fatal("TC execution complete, but (#{Calx.arrErrors.length}) failures observed during execution. Marking TC as failure --\n #{Calx.arrErrors}")
			end
		else
			@currentStep += 1
		end
	rescue => e
		if !(e.message.include?"Cucumber::Ast::OutlineTable")
			raise e.message
		end
	end


	#scenario.steps.each do |str|
		#if (str.name.include?"screenshot") && (str.status === "skipped".to_sym)
		#	if !(str.previous.status === "skipped".to_sym)
					#fail("Failing scenario")
				#logger.fatal("TC execution complete, but (#{Calx.arrErrors.length}) failures observed during execution. Marking TC as failure --\n #{Calx.arrErrors}")
		#	end
		#end
		
	#end
end



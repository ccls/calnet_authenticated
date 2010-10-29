class Autotest::Rails

#
#	Need both the mapping and the extra files
#
	def run_with_calnet_authenticated
		add_exception %r%config/%
		add_exception %r%versions/%
		add_exception %r%\.git/%
		self.extra_files << File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/unit/calnet_authenticated/'))

		self.extra_files << File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/functional/calnet_authenticated/'))

		add_mapping( 
			%r{^#{File.expand_path(File.join(File.dirname(__FILE__),'/../../test/'))}/(unit|functional)/calnet_authenticated/.*_test\.rb$}
			) do |filename, _|
			filename
		end
		run_without_calnet_authenticated
	end
	alias_method_chain :run, :calnet_authenticated


end

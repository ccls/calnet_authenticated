class Autotest::Rails

#
#	Need both the mapping and the extra files
#
	def run_with_calnet_authenticated
		add_exception %r%config/%
		add_exception %r%versions/%
		add_exception %r%\.git/%
		self.extra_files << File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/unit/calnet/'))

		self.extra_files << File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/functional/calnet/'))

		add_mapping( 
			%r{^#{File.expand_path(File.join(File.dirname(__FILE__),'/../../test/'))}/(unit|functional)/calnet/.*_test\.rb$}
			) do |filename, _|
			filename
		end

		##
		#	This stops the ...
		#
		#	Unable to map class Ccls::IdentifierTest to a file
		#	Unable to map class Ccls::SubjectTest to a file
		#
		#	By default autotest is expecting all the namespaces to end with Test
		#		ie. CclsTest::IdentifierTest
		#	Could have renamed the dir, I suppose.
		#
		Dir[File.join(File.dirname(__FILE__),'/../../test/unit/**/*rb')].each do |f|
#	the condition isn't as important as grabbing "calnet/test_file_name.rb" for camelcasing
			if f =~ /test\/unit\/(calnet\/.*)\.rb/
				self.extra_class_map[$1.camelcase] = File.expand_path(f)
			end
		end
		Dir[File.join(File.dirname(__FILE__),'/../../test/functional/**/*rb')].each do |f|
			if f =~ /test\/functional\/(calnet\/.*)\.rb/
				self.extra_class_map[$1.camelcase] = File.expand_path(f)
			end
		end

		run_without_calnet_authenticated
	end
	alias_method_chain :run, :calnet_authenticated

end

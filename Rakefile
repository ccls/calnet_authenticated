require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
	require 'jeweler'
	Jeweler::Tasks.new do |gem|
		gem.name = "jakewendt-calnet_authenticated"
		gem.summary = %Q{one-line summary of your gem}
		gem.description = %Q{longer description of your gem}
		gem.email = "github@jake.otherinbox.com"
		gem.homepage = "http://github.com/jakewendt/calnet_authenticated"
		gem.authors = ["George 'Jake' Wendt"]
		# gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings

		gem.files  = FileList['config/routes.rb']
		gem.files += FileList['app/**/*.rb']
		gem.files += FileList['lib/**/*.rb']
		gem.files += FileList['generators/**/*']	#	this may need tightened!
		gem.files -= FileList['**/versions/*']

#   
#		I'm not quite sure if it matters whether these files
#		are included as 'files' or 'test_files', but
#		they need to be included if I'm gonna use'em.
#
		gem.test_files  = FileList['test/**/*.rb']
		gem.test_files -= FileList['test/test_helper.rb']

		gem.add_dependency('rails', '~> 2')
		gem.add_dependency('ucb_ldap', '>= 1.4.2')
		gem.add_dependency('rubycas-client', '>= 2.2.1')
	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require(File.join(File.dirname(__FILE__), 'config', 'boot'))
require 'tasks/rails'

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rdoc/task'

require 'tasks/rails'

begin
	require 'jeweler'
	Jeweler::Tasks.new do |gem|
		gem.name = "ccls-calnet_authenticated"
		gem.summary = %Q{one-line summary of your gem}
		gem.description = %Q{longer description of your gem}
		gem.email = "github@jakewendt.com"
		gem.homepage = "http://github.com/ccls/calnet_authenticated"
		gem.authors = ["George 'Jake' Wendt"]
		# gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings

		gem.files  = FileList['rails/init.rb']
		gem.files += FileList['lib/**/*.rb']
		gem.files += FileList['generators/**/*']	#	this may need tightened!
		gem.files -= FileList['**/versions/*']

#   
#		I'm not quite sure if it matters whether these files
#		are included as 'files' or 'test_files', but
#		they need to be included if I'm gonna use'em.
#
		gem.test_files  = FileList['test/unit/calnet/*.rb']

		gem.add_dependency('rails', '~> 2')
		gem.add_dependency('ucb_ldap', '>= 1.4.2')
		gem.add_dependency('rubycas-client', '>= 2.2.1')
		gem.add_dependency('jrails')
		gem.add_dependency('chronic')
		gem.add_dependency('ssl_requirement')
		gem.add_dependency('ryanb-acts-as-list')
		gem.add_dependency('thoughtbot-factory_girl')
		gem.add_dependency('ccls-common_lib')
		gem.add_dependency('RedCloth','!= 4.2.6')

	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

#	This is an array of Regexs excluded from test coverage report.
RCOV_EXCLUDES = [
	'lib/calnet_authenticated.rb',
	'lib/calnet_authenticated/controller.rb',
	'lib/calnet_authenticated/test_helper.rb'
]


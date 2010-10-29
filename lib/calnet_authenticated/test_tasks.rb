module CalnetAuthenticated;end
namespace :test do
	namespace :units do
		Rake::TestTask.new(:calnet_authenticated => "db:test:prepare") do |t|
			t.pattern = File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/unit/calnet_authenticated/*_test.rb'))
			t.libs << "test"
			t.verbose = true
		end
	end
	namespace :functionals do
		Rake::TestTask.new(:calnet_authenticated => "db:test:prepare") do |t|
			t.pattern = File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/functional/calnet_authenticated/*_test.rb'))
			t.libs << "test"
			t.verbose = true
		end
	end
end
Rake::Task['test:functionals'].prerequisites.unshift(
	"test:functionals:calnet_authenticated" )
Rake::Task['test:units'].prerequisites.unshift(
	"test:units:calnet_authenticated" )

#	I thought of possibly just including this file
#	but that would make __FILE__ different.
#	Hmmm



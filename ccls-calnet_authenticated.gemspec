# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ccls-calnet_authenticated}
  s.version = "1.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["George 'Jake' Wendt"]
  s.date = %q{2011-06-10}
  s.description = %q{longer description of your gem}
  s.email = %q{github@jakewendt.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "app/controllers/sessions_controller.rb",
    "app/controllers/users_controller.rb",
    "app/views/users/_form.html.erb",
    "app/views/users/edit.html.erb",
    "app/views/users/index.html.erb",
    "app/views/users/menu.js.erb",
    "app/views/users/new.html.erb",
    "app/views/users/show.html.erb",
    "config/routes.rb",
    "generators/calnet_authenticated/USAGE",
    "generators/calnet_authenticated/calnet_authenticated_generator.rb",
    "generators/calnet_authenticated/templates/autotest_calnet_authenticated.rb",
    "generators/calnet_authenticated/templates/calnet_authenticated.rake",
    "generators/calnet_authenticated/templates/migration.rb",
    "lib/calnet_authenticated.rb",
    "lib/calnet_authenticated/autotest.rb",
    "lib/calnet_authenticated/calnet_user.rb",
    "lib/calnet_authenticated/controller.rb",
    "lib/calnet_authenticated/test_helper.rb",
    "lib/calnet_authenticated/test_tasks.rb",
    "lib/ccls-calnet_authenticated.rb"
  ]
  s.homepage = %q{http://github.com/ccls/calnet_authenticated}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{one-line summary of your gem}
  s.test_files = ["test/functional/calnet/sessions_controller_test.rb", "test/functional/calnet/users_controller_test.rb", "test/functional/home_controller_test.rb", "test/unit/calnet/user_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 2"])
      s.add_runtime_dependency(%q<ucb_ldap>, [">= 1.4.2"])
      s.add_runtime_dependency(%q<rubycas-client>, [">= 2.2.1"])
      s.add_runtime_dependency(%q<jrails>, [">= 0"])
      s.add_runtime_dependency(%q<jakewendt-ruby_extension>, [">= 0"])
      s.add_runtime_dependency(%q<chronic>, [">= 0"])
      s.add_runtime_dependency(%q<ssl_requirement>, [">= 0"])
      s.add_runtime_dependency(%q<ryanb-acts-as-list>, [">= 0"])
      s.add_runtime_dependency(%q<gravatar>, [">= 0"])
      s.add_runtime_dependency(%q<paperclip>, [">= 0"])
      s.add_runtime_dependency(%q<thoughtbot-factory_girl>, [">= 0"])
      s.add_runtime_dependency(%q<jakewendt-rails_extension>, [">= 0"])
      s.add_runtime_dependency(%q<RedCloth>, ["!= 4.2.6"])
    else
      s.add_dependency(%q<rails>, ["~> 2"])
      s.add_dependency(%q<ucb_ldap>, [">= 1.4.2"])
      s.add_dependency(%q<rubycas-client>, [">= 2.2.1"])
      s.add_dependency(%q<jrails>, [">= 0"])
      s.add_dependency(%q<jakewendt-ruby_extension>, [">= 0"])
      s.add_dependency(%q<chronic>, [">= 0"])
      s.add_dependency(%q<ssl_requirement>, [">= 0"])
      s.add_dependency(%q<ryanb-acts-as-list>, [">= 0"])
      s.add_dependency(%q<gravatar>, [">= 0"])
      s.add_dependency(%q<paperclip>, [">= 0"])
      s.add_dependency(%q<thoughtbot-factory_girl>, [">= 0"])
      s.add_dependency(%q<jakewendt-rails_extension>, [">= 0"])
      s.add_dependency(%q<RedCloth>, ["!= 4.2.6"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 2"])
    s.add_dependency(%q<ucb_ldap>, [">= 1.4.2"])
    s.add_dependency(%q<rubycas-client>, [">= 2.2.1"])
    s.add_dependency(%q<jrails>, [">= 0"])
    s.add_dependency(%q<jakewendt-ruby_extension>, [">= 0"])
    s.add_dependency(%q<chronic>, [">= 0"])
    s.add_dependency(%q<ssl_requirement>, [">= 0"])
    s.add_dependency(%q<ryanb-acts-as-list>, [">= 0"])
    s.add_dependency(%q<gravatar>, [">= 0"])
    s.add_dependency(%q<paperclip>, [">= 0"])
    s.add_dependency(%q<thoughtbot-factory_girl>, [">= 0"])
    s.add_dependency(%q<jakewendt-rails_extension>, [">= 0"])
    s.add_dependency(%q<RedCloth>, ["!= 4.2.6"])
  end
end


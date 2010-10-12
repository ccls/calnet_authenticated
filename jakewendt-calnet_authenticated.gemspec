# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jakewendt-calnet_authenticated}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["George 'Jake' Wendt"]
  s.date = %q{2010-10-12}
  s.description = %q{longer description of your gem}
  s.email = %q{github@jake.otherinbox.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "app/controllers/sessions_controller.rb",
     "config/routes.rb",
     "lib/calnet_authenticated.rb",
     "lib/calnet_authenticated/controller.rb",
     "lib/calnet_authenticated/test_helper.rb",
     "lib/calnet_authenticated/user_model.rb"
  ]
  s.homepage = %q{http://github.com/jakewendt/calnet_authenticated}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{one-line summary of your gem}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 2"])
      s.add_runtime_dependency(%q<ucb_ldap>, [">= 1.4.2"])
      s.add_runtime_dependency(%q<rubycas-client>, [">= 2.2.1"])
    else
      s.add_dependency(%q<rails>, ["~> 2"])
      s.add_dependency(%q<ucb_ldap>, [">= 1.4.2"])
      s.add_dependency(%q<rubycas-client>, [">= 2.2.1"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 2"])
    s.add_dependency(%q<ucb_ldap>, [">= 1.4.2"])
    s.add_dependency(%q<rubycas-client>, [">= 2.2.1"])
  end
end


# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rack_session_access"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andriy Yanko"]
  s.date = "2012-09-24"
  s.email = ["andriy.yanko@gmail.com"]
  s.homepage = "https://github.com/railsware/rack_session_access"
  s.require_paths = ["lib"]
  s.rubyforge_project = "rack_session_access"
  s.rubygems_version = "1.8.24"
  s.summary = "Rack middleware that provides access to rack.session environment"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<builder>, [">= 2.0.0"])
    else
      s.add_dependency(%q<rack>, [">= 1.0.0"])
      s.add_dependency(%q<builder>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 1.0.0"])
    s.add_dependency(%q<builder>, [">= 2.0.0"])
  end
end

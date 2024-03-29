# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "activeadmin-cancan"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Laurent Cobos"]
  s.date = "2012-09-14"
  s.description = "Provides CanCan roles to ActiveAdmin"
  s.email = ["laurent@11factory.fr"]
  s.homepage = "https://github.com/11factory"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Provides CanCan roles to ActiveAdmin"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0"])
      s.add_runtime_dependency(%q<cancan>, [">= 1.6.2"])
      s.add_runtime_dependency(%q<activeadmin>, [">= 0.4.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0"])
      s.add_dependency(%q<cancan>, [">= 1.6.2"])
      s.add_dependency(%q<activeadmin>, [">= 0.4.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0"])
    s.add_dependency(%q<cancan>, [">= 1.6.2"])
    s.add_dependency(%q<activeadmin>, [">= 0.4.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end

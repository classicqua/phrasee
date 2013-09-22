# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pry-exception_explorer"
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Mair (banisterfiend)"]
  s.date = "2012-10-04"
  s.description = "Enter the context of exceptions"
  s.email = "jrmair@gmail.com"
  s.homepage = "https://github.com/banister/pry-exception_explorer"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Enter the context of exceptions"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pry-stack_explorer>, [">= 0.4.6"])
      s.add_development_dependency(%q<bacon>, ["~> 1.1.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
    else
      s.add_dependency(%q<pry-stack_explorer>, [">= 0.4.6"])
      s.add_dependency(%q<bacon>, ["~> 1.1.0"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<pry-stack_explorer>, [">= 0.4.6"])
    s.add_dependency(%q<bacon>, ["~> 1.1.0"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
  end
end

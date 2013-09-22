# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "hominid"
  s.version = "3.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Getting"]
  s.date = "2012-08-02"
  s.description = "Hominid is a Ruby gem that provides a wrapper for interacting with the Mailchimp email marketing service MC, STS and Export API's."
  s.email = "brian@tatem.ae"
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = ["LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/tatemae-consultancy/hominid"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Ruby gem for interacting with the Mailchimp API's."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["> 1.0.0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["> 1.6.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["> 1.0.0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["> 1.6.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["> 1.0.0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["> 1.6.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

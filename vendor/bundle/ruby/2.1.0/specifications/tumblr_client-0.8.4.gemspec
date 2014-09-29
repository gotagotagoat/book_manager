# -*- encoding: utf-8 -*-
# stub: tumblr_client 0.8.4 ruby lib

Gem::Specification.new do |s|
  s.name = "tumblr_client"
  s.version = "0.8.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["John Bunting", "John Crepezzi"]
  s.date = "2014-09-02"
  s.description = "A Ruby wrapper for the Tumblr v2 API"
  s.email = ["codingjester@gmail.com", "john@crepezzi.com"]
  s.executables = ["tumblr"]
  s.files = ["bin/tumblr"]
  s.homepage = "http://github.com/tumblr/tumblr_client"
  s.licenses = ["Apache"]
  s.rubygems_version = "2.2.2"
  s.summary = "Tumblr API wrapper"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<simple_oauth>, [">= 0"])
      s.add_runtime_dependency(%q<oauth>, [">= 0"])
      s.add_runtime_dependency(%q<mime-types>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<faraday>, ["~> 0.9.0"])
      s.add_dependency(%q<faraday_middleware>, ["~> 0.9.0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<simple_oauth>, [">= 0"])
      s.add_dependency(%q<oauth>, [">= 0"])
      s.add_dependency(%q<mime-types>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<faraday>, ["~> 0.9.0"])
    s.add_dependency(%q<faraday_middleware>, ["~> 0.9.0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<simple_oauth>, [">= 0"])
    s.add_dependency(%q<oauth>, [">= 0"])
    s.add_dependency(%q<mime-types>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

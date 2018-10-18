# -*- encoding: utf-8 -*-
# stub: jekyll-admin 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-admin".freeze
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mert Kahyao\u011Flu".freeze, "GitHub Open Source".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-09-24"
  s.description = "Jekyll::Admin is a drop in administrative framework for Jekyll sites.".freeze
  s.email = ["mertkahyaoglu93@gmail.com".freeze, "opensource@github.com".freeze]
  s.homepage = "https://github.com/jekyll/jekyll-admin".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "wp-admin for Jekyll, but better".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>.freeze, ["~> 3.3"])
      s.add_runtime_dependency(%q<sinatra>.freeze, ["~> 1.4"])
      s.add_runtime_dependency(%q<sinatra-contrib>.freeze, ["~> 1.4"])
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.4"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
      s.add_development_dependency(%q<sinatra-cross_origin>.freeze, ["~> 0.3"])
      s.add_development_dependency(%q<gem-release>.freeze, ["~> 0.7"])
    else
      s.add_dependency(%q<jekyll>.freeze, ["~> 3.3"])
      s.add_dependency(%q<sinatra>.freeze, ["~> 1.4"])
      s.add_dependency(%q<sinatra-contrib>.freeze, ["~> 1.4"])
      s.add_dependency(%q<addressable>.freeze, ["~> 2.4"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
      s.add_dependency(%q<sinatra-cross_origin>.freeze, ["~> 0.3"])
      s.add_dependency(%q<gem-release>.freeze, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<jekyll>.freeze, ["~> 3.3"])
    s.add_dependency(%q<sinatra>.freeze, ["~> 1.4"])
    s.add_dependency(%q<sinatra-contrib>.freeze, ["~> 1.4"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.4"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
    s.add_dependency(%q<sinatra-cross_origin>.freeze, ["~> 0.3"])
    s.add_dependency(%q<gem-release>.freeze, ["~> 0.7"])
  end
end

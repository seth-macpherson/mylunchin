# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rspec-instafail"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Grosser"]
  s.date = "2012-01-08"
  s.email = "michael@grosser.it"
  s.homepage = "http://github.com/grosser/rspec-instafail"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Show failing specs instantly"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

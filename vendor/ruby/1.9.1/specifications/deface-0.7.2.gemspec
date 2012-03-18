# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{deface}
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian D Quinn"]
  s.date = %q{2011-11-28}
  s.description = %q{Deface is a library that allows you to customize ERB views in a Rails application without editing the underlying view.}
  s.email = %q{brian@railsdog.com}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = [".gitignore", ".travis.yml", "Gemfile", "MIT-LICENSE", "README.markdown", "Rakefile", "deface.gemspec", "init.rb", "lib/deface.rb", "lib/deface/action_view_extensions.rb", "lib/deface/environment.rb", "lib/deface/override.rb", "lib/deface/parser.rb", "lib/deface/railtie.rb", "lib/deface/template_helper.rb", "spec/assets/admin/posts/index.html.erb", "spec/assets/shared/_post.html.erb", "spec/assets/shared/person.html.erb", "spec/deface/environment_spec.rb", "spec/deface/override_spec.rb", "spec/deface/parser_spec.rb", "spec/deface/template_helper_spec.rb", "spec/deface/template_spec.rb", "spec/spec_helper.rb", "tasks/precompile.rake", "tasks/utils.rake"]
  s.homepage = %q{http://github.com/railsdog/deface}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Deface is a library that allows you to customize ERB views in Rails}
  s.test_files = ["spec/assets/admin/posts/index.html.erb", "spec/assets/shared/_post.html.erb", "spec/assets/shared/person.html.erb", "spec/deface/environment_spec.rb", "spec/deface/override_spec.rb", "spec/deface/parser_spec.rb", "spec/deface/template_helper_spec.rb", "spec/deface/template_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.5.0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.0.9"])
      s.add_development_dependency(%q<rspec>, [">= 2.7.0"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.5.0"])
      s.add_dependency(%q<rails>, [">= 3.0.9"])
      s.add_dependency(%q<rspec>, [">= 2.7.0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.5.0"])
    s.add_dependency(%q<rails>, [">= 3.0.9"])
    s.add_dependency(%q<rspec>, [">= 2.7.0"])
  end
end

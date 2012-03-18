# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{turn}
  s.version = "0.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Pease"]
  s.date = %q{2012-02-02}
  s.default_executable = %q{turn}
  s.description = %q{}
  s.email = %q{tim.pease@gmail.com}
  s.executables = ["turn"]
  s.extra_rdoc_files = ["History.txt", "LICENSE-GPL2.txt", "LICENSE-MIT.txt", "LICENSE-RUBY.txt", "LICENSE.txt", "Release.txt", "Version.txt", "bin/turn"]
  s.files = [".gitignore", ".travis.yml", "Gemfile", "History.txt", "LICENSE-GPL2.txt", "LICENSE-MIT.txt", "LICENSE-RUBY.txt", "LICENSE.txt", "README.md", "Rakefile", "Release.txt", "Version.txt", "bin/turn", "lib/turn.rb", "lib/turn/autoload.rb", "lib/turn/autorun.rb", "lib/turn/bin.rb", "lib/turn/colorize.rb", "lib/turn/command.rb", "lib/turn/components.rb", "lib/turn/components/case.rb", "lib/turn/components/method.rb", "lib/turn/components/suite.rb", "lib/turn/configuration.rb", "lib/turn/controller.rb", "lib/turn/core_ext.rb", "lib/turn/minitest.rb", "lib/turn/reporter.rb", "lib/turn/reporters/cue_reporter.rb", "lib/turn/reporters/dot_reporter.rb", "lib/turn/reporters/marshal_reporter.rb", "lib/turn/reporters/outline_reporter.rb", "lib/turn/reporters/pretty_reporter.rb", "lib/turn/reporters/progress_reporter.rb", "lib/turn/runners/crossrunner.rb", "lib/turn/runners/isorunner.rb", "lib/turn/runners/loadrunner.rb", "lib/turn/runners/minirunner.rb", "lib/turn/runners/solorunner.rb", "lib/turn/runners/testrunner.rb", "lib/turn/testunit.rb", "lib/turn/version.rb", "test/helper.rb", "test/runner", "test/test_framework.rb", "test/test_reporters.rb", "test/test_runners.rb", "try/test_autorun_minitest.rb", "try/test_autorun_testunit.rb", "try/test_counts.rb", "try/test_sample.rb", "try/test_sample2.rb", "turn.gemspec"]
  s.homepage = %q{http://gemcutter.org/gems/turn}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{turn}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Test::Unit Reporter (New) -- new output format for Test::Unit}
  s.test_files = ["test/test_reporters.rb", "test/test_framework.rb", "test/test_runners.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ansi>, [">= 0"])
      s.add_runtime_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<bones-git>, [">= 0"])
      s.add_development_dependency(%q<bones>, [">= 3.7.3"])
    else
      s.add_dependency(%q<ansi>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<bones-git>, [">= 0"])
      s.add_dependency(%q<bones>, [">= 3.7.3"])
    end
  else
    s.add_dependency(%q<ansi>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<bones-git>, [">= 0"])
    s.add_dependency(%q<bones>, [">= 3.7.3"])
  end
end

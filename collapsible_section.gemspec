# frozen_string_literal: true

require_relative "lib/collapsible_section/version"

Gem::Specification.new do |spec|
  spec.name = "collapsible_section"
  spec.version = CollapsibleSection::VERSION
  spec.authors = ["Yaroslav Yenkala"]
  spec.email = ["yaroslav_yenkala@epam.com"]

  spec.add_dependency "rails", ">= 7.0"
  spec.summary = "Simple collapsible section helper for Rails applications."
  spec.description = "This gem provides a simple helper method to create collapsible sections in Rails views."
  spec.homepage = "https://github.com/yaroslavrick/collapsible_section"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

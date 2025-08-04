# frozen_string_literal: true

require_relative "lib/collapsible_section/version"

Gem::Specification.new do |spec|
  spec.name = "collapsible_section"
  spec.version = CollapsibleSection::VERSION
  spec.authors = ["Yaroslav Yenkala"]
  spec.email = ["yaroslavrick@gmail.com"]

  spec.add_dependency "rails", ">= 7.0"
  spec.summary = "Simple collapsible section helper for Rails applications."
  spec.description = "This gem provides a simple helper method to create collapsible sections in Rails views."
  spec.homepage = "https://github.com/yaroslavrick/collapsible_section"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/yaroslavrick/collapsible_section/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Include gem files
  spec.files = Dir["lib/**/*.rb"] + %w[README.md LICENSE.txt CHANGELOG.md]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

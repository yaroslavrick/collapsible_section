# CollapsibleSection

A Rails gem that provides a simple helper method to generate HTML5 `<details>` collapsible sections with consistent styling and structure.

## Usage in your project

Add to Gemfile:

```Gemfile
gem 'collapsible_section', '~> 0.1.0'
```

After building and installing the gem, replace your selected code with:

```ruby
= collapsible_section(t('your_text'), open: true) do
  = render('some_section_for_block', some_variable_for_block: current_variable)
```

This will generate the same HTML structure but through a reusable gem component:

```haml
%details.section-collapsable{open: true}
              %summary.section-header
                %h3.section-title
                 = your_title
              = your_block
```

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add collapsible_section
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install collapsible_section
```

## Development

gem build collapsible_section.gemspec
gem push collapsible_section-0.1.0.gem

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yaroslavrick/collapsible_section. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/yaroslavrick/collapsible_section/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CollapsibleSection project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/yaroslavrick/collapsible_section/blob/main/CODE_OF_CONDUCT.md).

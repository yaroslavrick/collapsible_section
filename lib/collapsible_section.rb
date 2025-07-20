# frozen_string_literal: true

require_relative "collapsible_section/version"
require_relative "collapsible_section/helper"
require_relative "collapsible_section/railtie" if defined?(Rails)

module CollapsibleSection
  class Error < StandardError; end
  # Your code goes here...
end

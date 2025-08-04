# frozen_string_literal: true

require "rails"
require "action_view"

# Since the railtie is only loaded when Rails is defined, we need to ensure it's loaded
require_relative "../lib/collapsible_section/railtie"

RSpec.describe CollapsibleSection::Railtie do
  describe "railtie inheritance" do
    it "inherits from Rails::Railtie" do
      expect(CollapsibleSection::Railtie.superclass).to eq(Rails::Railtie)
    end
  end

  describe "helper inclusion" do
    it "defines an initializer for including the helper" do
      initializers = CollapsibleSection::Railtie.initializers
      helper_initializer = initializers.find { |i| i.name == "collapsible_section.helper" }

      expect(helper_initializer).not_to be_nil
      expect(helper_initializer.name).to eq("collapsible_section.helper")
    end
  end
end

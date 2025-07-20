# frozen_string_literal: true

module CollapsibleSection
  class Railtie < Rails::Railtie
    initializer "collapsible_section.helper" do
      ActionView::Base.include CollapsibleSection::Helper
    end
  end
end

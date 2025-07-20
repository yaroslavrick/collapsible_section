# frozen_string_literal: true

module CollapsibleSection
  module Helper
    def collapsible_section(title, open: true, &block)
      content_tag(:details, class: "section-collapsable", open: open) do
        concat content_tag(:summary, class: "section-header") do
          content_tag(:h3, title, class: "section-title")
        end
        concat capture(&block) if block_given?
      end
    end
  end
end

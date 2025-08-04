# frozen_string_literal: true

module CollapsibleSection
  module Helper
    def collapsible_section(title, open: true, &block)
      content_tag(:details, class: "section-collapsable", open: open) do
        summary_content = content_tag(:h3, title, class: "section-title")
        concat content_tag(:summary, summary_content, class: "section-header")
        concat capture(&block) if block_given?
      end
    end
  end
end

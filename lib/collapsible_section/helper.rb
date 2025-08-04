# frozen_string_literal: true

module CollapsibleSection
  module Helper
    def collapsible_section(title, open: true, &block)
      content_tag(:details, class: "section-collapsable", open: open) do
        summary_content = content_tag(:h3, title, class: "section-title")
        summary_tag = content_tag(:summary, summary_content, class: "section-header")
        block_content = block_given? ? capture(&block) : ""

        (summary_tag + block_content).html_safe
      end
    end
  end
end

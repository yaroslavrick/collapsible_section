# frozen_string_literal: true

require "action_view"

RSpec.describe CollapsibleSection::Helper do
  # Create an ActionView instance to test the helper
  let(:template) do
    template = ActionView::Base.new(ActionView::LookupContext.new([]), {}, nil)
    template.extend(CollapsibleSection::Helper)
    template
  end

  describe "#collapsible_section" do
    context "with default options" do
      it "generates a details element with default classes and open attribute" do
        result = template.collapsible_section("Test Title") do
          "Test content"
        end

        expect(result).to include('<details class="section-collapsable" open="open">')
        expect(result).to include('<summary class="section-header">')
        expect(result).to include('<h3 class="section-title">Test Title</h3>')
        expect(result).to include("Test content")
        expect(result).to include("</summary>")
        expect(result).to include("</details>")
      end
    end

    context "when open is false" do
      it "generates a details element without the open attribute" do
        result = template.collapsible_section("Test Title", open: false) do
          "Test content"
        end

        expect(result).to include('<details class="section-collapsable">')
        expect(result).not_to include('open="open"')
        expect(result).to include('<summary class="section-header">')
        expect(result).to include('<h3 class="section-title">Test Title</h3>')
        expect(result).to include("Test content")
      end
    end

    context "when open is true explicitly" do
      it "generates a details element with the open attribute" do
        result = template.collapsible_section("Test Title", open: true) do
          "Test content"
        end

        expect(result).to include('<details class="section-collapsable" open="open">')
        expect(result).to include('<summary class="section-header">')
        expect(result).to include('<h3 class="section-title">Test Title</h3>')
        expect(result).to include("Test content")
      end
    end

    context "with HTML content in title" do
      it "properly escapes HTML in the title for security" do
        result = template.collapsible_section("Test <em>Title</em>") do
          "Test content"
        end

        expect(result).to include('<h3 class="section-title">Test &lt;em&gt;Title&lt;/em&gt;</h3>')
      end
    end

    context "without a block" do
      it "generates a collapsible section with only the title" do
        result = template.collapsible_section("Test Title")

        expect(result).to include('<details class="section-collapsable" open="open">')
        expect(result).to include('<summary class="section-header">')
        expect(result).to include('<h3 class="section-title">Test Title</h3>')
        expect(result).to include("</summary>")
        expect(result).to include("</details>")
        expect(result).not_to include("Test content")
      end
    end

    context "with empty title" do
      it "generates a collapsible section with empty title" do
        result = template.collapsible_section("") do
          "Test content"
        end

        expect(result).to include('<h3 class="section-title"></h3>')
        expect(result).to include("Test content")
      end
    end

    context "with nil title" do
      it "generates a collapsible section with nil title" do
        result = template.collapsible_section(nil) do
          "Test content"
        end

        expect(result).to include('<h3 class="section-title"></h3>')
        expect(result).to include("Test content")
      end
    end
  end

  describe "HTML structure validation" do
    it "generates valid nested HTML structure" do
      result = template.collapsible_section("Test Title") do
        "Test content"
      end

      # Check that the structure is properly nested
      details_start = result.index("<details")
      summary_start = result.index("<summary")
      h3_start = result.index("<h3")
      h3_end = result.index("</h3>")
      summary_end = result.index("</summary>")
      content_position = result.index("Test content")
      details_end = result.index("</details>")

      expect(details_start).to be < summary_start
      expect(summary_start).to be < h3_start
      expect(h3_start).to be < h3_end
      expect(h3_end).to be < summary_end
      expect(summary_end).to be < content_position
      expect(content_position).to be < details_end
    end
  end

  describe "return value" do
    it "returns an HTML safe string" do
      result = template.collapsible_section("Test Title") do
        "Test content"
      end

      expect(result).to be_html_safe
    end
  end

  describe "complex content handling" do
    it "handles complex nested HTML content" do
      result = template.collapsible_section("Complex Test") do
        template.content_tag(:div, class: "wrapper") do
          template.content_tag(:ul) do
            template.content_tag(:li, "Item 1") +
              template.content_tag(:li, "Item 2") +
              template.content_tag(:li, "Item 3")
          end
        end
      end

      expect(result).to include('<div class="wrapper">')
      expect(result).to include("<ul>")
      expect(result).to include("<li>Item 1</li>")
      expect(result).to include("<li>Item 2</li>")
      expect(result).to include("<li>Item 3</li>")
      expect(result).to include("</ul>")
      expect(result).to include("</div>")
    end

    it "produces valid HTML5 details element structure" do
      result = template.collapsible_section("HTML5 Test", open: false) do
        template.content_tag(:p, "Paragraph content")
      end

      # Basic HTML5 structure validation
      expect(result).to match(%r{<details[^>]*>.*<summary[^>]*>.*</summary>.*</details>}m)
      expect(result).not_to include('open="open"')
      expect(result).to include("<p>Paragraph content</p>")
    end
  end
end

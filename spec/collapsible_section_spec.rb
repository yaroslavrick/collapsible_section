# frozen_string_literal: true

RSpec.describe CollapsibleSection do
  it "has a version number" do
    expect(CollapsibleSection::VERSION).not_to be nil
  end

  it "has the correct version" do
    expect(CollapsibleSection::VERSION).to eq("0.1.0")
  end

  describe "module structure" do
    it "defines the Helper module" do
      expect(CollapsibleSection::Helper).to be_a(Module)
    end

    it "defines a version constant with semantic versioning format" do
      expect(CollapsibleSection::VERSION).to be_a(String)
      expect(CollapsibleSection::VERSION).to match(/\A\d+\.\d+\.\d+\z/)
    end

    it "defines an Error class that inherits from StandardError" do
      expect(CollapsibleSection::Error).to be < StandardError
    end
  end

  describe "HTML structure generation" do
    let(:template) do
      template = ActionView::Base.new(ActionView::LookupContext.new([]), {}, nil)
      template.extend(CollapsibleSection::Helper)
      template
    end

    context "with default options (open: true)" do
      let(:expected_result) do
        <<-HTML
          <details class="section-collapsable" open="open"><summary class="section-header"><h3 class="section-title">Test Title</h3></summary>Test Content</details>
        HTML
      end

      it "generates the exact HTML structure matching the HAML specification" do
        result = template.collapsible_section("Test Title") do
          "Test Content"
        end

        expect(result.strip).to eq(expected_result.strip)
      end
    end

    context "when open is false" do
      let(:expected_closed_result) do
        <<-HTML
          <details class="section-collapsable"><summary class="section-header"><h3 class="section-title">Test Title</h3></summary>Test Content</details>
        HTML
      end

      it "generates the exact HTML structure without open attribute" do
        result = template.collapsible_section("Test Title", open: false) do
          "Test Content"
        end

        expect(result.strip).to eq(expected_closed_result.strip)
      end
    end

    context "without content block" do
      let(:expected_empty_result) do
        <<-HTML
          <details class="section-collapsable" open="open"><summary class="section-header"><h3 class="section-title">Test Title</h3></summary></details>
        HTML
      end

      it "generates the exact HTML structure with empty content" do
        result = template.collapsible_section("Test Title")

        expect(result.strip).to eq(expected_empty_result.strip)
      end
    end
  end
end

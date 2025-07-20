module CollapsibleSection
  class Railtie < Rails::Railtie
    initializer 'collapsible_section.helper' do
      ActionView::Base.send :include, CollapsibleSection::Helper
    end
  end
end

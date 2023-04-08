module Editor
  class RichTextService
    include Redcarpet::Render::SmartyPants
    def initialize; end

    def markdown
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    end
  end
end

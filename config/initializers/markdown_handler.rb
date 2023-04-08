require Rails.root.join('app/services/editor/markdown_handler.rb')

ActionView::Template.register_template_handler :md, Editor::MarkdownHandler

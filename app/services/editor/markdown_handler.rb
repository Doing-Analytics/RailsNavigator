module Editor
  class MarkdownHandler
    class Markdownray < Redcarpet::Render::HTML
      def block_code(code, language)
        <<~HTML
          <div class=' markdown bg-gray-100 p-4 rounded-md dark:bg-slate-800 ' data-lang='#{language}'>
            <div class="code-block">
              <span class='code-lan'>#{language}</span>
              #{CodeRay.scan(code, language).div(line_numbers: :table)}
            </div>
          </div>
        HTML
      end

      def list(contents, _list_type)
        "<ul class='markdown list-disc list-inside'>#{contents}</ul>"
      end

      def paragraph(text)
        "<p class=' markdown text-gray-800 leading-7'>#{text}</p>"
      end

      def header(text, level)
        "<h#{level} class=' markdown font-semibold text-2xl mt-8 mb-2'>#{text}</h#{level}>"
      end
    end

    def convert_markdown(text)
      rndr = Markdownray.new(filter_html: true, hard_wrap: true)
      options = {
        autolink: true,                    # Automatically detect and link URLs
        disable_indented_code_blocks: true, # Don't treat indented blocks of text as code
        fenced_code_blocks: true,           # Allow code blocks using ``` or ~~~
        footnotes: true,                    # Enable footnote syntax
        highlight: true,                    # Enable syntax highlighting for code blocks
        no_intra_emphasis: true,            # Don't parse emphasis inside words
        strikethrough: true,                # Enable strikethrough syntax
        superscript: true,                  # Enable superscript syntax
        tables: true                        # Enable table syntax
      }
      markdown_to_html = Redcarpet::Markdown.new(rndr, options)
      markdown_to_html.render(text)
    end
  end
end

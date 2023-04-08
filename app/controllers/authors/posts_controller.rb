module Authors
  class PostsController < AuthorsController
    before_action :set_post, only: %i[show edit update destroy]

    # GET /posts
    def index
      @posts = current_author.posts
      # input = Editor::MarkdownHandler.call("app/views/markdown/index.md")

      # markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      # @output = markdown.render ERB.new(input).result(binding)
    end

    # GET /posts/1
    def show
      input = File.read 'app/views/markdown/index.md'

      @input = Editor::MarkdownHandler.new.convert_markdown(input)
    end

    # GET /posts/new
    def new
      @post = current_author.posts.build
      @markdown = RichTextService.new.markdown
    end

    # GET /posts/1/edit
    def edit; end

    # POST /posts
    def create
      @post = current_author.posts.build(post_params)

      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_author.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :published, :published_at)
    end
  end
end

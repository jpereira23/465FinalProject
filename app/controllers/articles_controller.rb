class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json

  def user 
    @tags = Tag.all 
    @users = User.all 
    @tag_devices = TagDevise.all
  end 
  def index
    @articles = Article.all
    @tags = Tag.order(like: :desc).limit(5)
    @users = User.all
    @tag_devices = TagDevise.all
    @tag_articles = TagArticle.all
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @article.views = @article.views + 1
    @article.save 
    @tag = Tag.new
    @tags = Tag.all
    @tag_articles = TagArticle.all
    @tag_devises = TagDevise.all 
    @users = User.all
    @comment = Comment.new
    @comments = Comment.all
    @comment_articles = CommentArticle.all
    @comment_users = CommentUser.all
  end
  

  def like
    @article = Article.find(params[:id])
    @tmp = @article.likes + 1
    @article.likes = @tmp
    @article.save
    redirect_to :action => :show, :id => params[:id] 
  end 
  # GET /articles/new
  def new
    @article = Article.new
    @tag = Tag.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
  @article.filename = (0...8).map { (65 + rand(26)).chr }.join + ".jpg"
		@uploaded_io = params[:article][:uploaded_file]

		File.open(Rails.root.join('public', 'images', @article.filename), 'wb') do |file|
			file.write(@uploaded_io.read)
		end 

      if @article.save
				redirect_to @article, notice: 'Article was successfully created.'
      else
				render :new
      end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description, :story, :views, :likes, :filename)
    end
 
    def tag_params 
      params.require(:tag).permit(:str, :like, :dislike, :user_id, :article_id)
    end 
end

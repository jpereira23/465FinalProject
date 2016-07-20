class TagArticlesController < ApplicationController
  before_action :set_tag_article, only: [:show, :edit, :update, :destroy]

  # GET /tag_articles
  # GET /tag_articles.json
  def index
    @tag = Tag.find params[:tag_id] 
    @tag_articles = TagArticle.all 
    @articles = Article.all 
  end

  # GET /tag_articles/1
  # GET /tag_articles/1.json
  def show
    @tag_article = TagArticle.find params[:id]
    @article = Article.all
  end

  # GET /tag_articles/new
   
  def new 
    @tag = Tag.find params[:tag_id]
    @tag_article = @tag.tag_articles.new  
  end

  # GET /tag_articles/1/edit
  def edit
  end

  # POST /tag_articles
  # POST /tag_articles.json
  def create
    @tag = Tag.find params[:tag_id]
    @tag_article = TagArticle.new(tag_article_params)
    
    respond_to do |format|
      if @tag_article.save
        format.html { redirect_to @tag_article, notice: 'Tag article was successfully created.' }
        format.json { render :show, status: :created, location: @tag_article }
      else
        format.html { render :new }
        format.json { render json: @tag_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_articles/1
  # PATCH/PUT /tag_articles/1.json
  def update
    respond_to do |format|
      if @tag_article.update(tag_article_params)
        format.html { redirect_to @tag_article, notice: 'Tag article was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_article }
      else
        format.html { render :edit }
        format.json { render json: @tag_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_articles/1
  # DELETE /tag_articles/1.json
  def destroy
    @tag_article.destroy
    respond_to do |format|
      format.html { redirect_to tag_articles_url, notice: 'Tag article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_article
      @tag_article = TagArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_article_params
      params.require(:tag_article).permit(:article_id, :tag_id, :article_id)
    end
end

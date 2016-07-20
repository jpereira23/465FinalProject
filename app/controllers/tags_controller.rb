class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
    @tag_devises = TagDevice.all 
    @tag_articles = TagArticle.all
  end

  def like
    @tag = Tag.find(params[:a_id])
    @tmp = @tag.like 
    @tag.like = @tmp + 1
    @tag.save 
    redirect_to :controller => :articles, :action => :show, :id => params[:article_id]
  end 

  def dislike 
    @tag = Tag.find(params[:a_id]) 
    @tmp = @tag.like 
    @tag.like = @tmp - 1 
    @tag.save 
    redirect_to :controller => :articles, :action => :show, :id => params[:article_id]
  end 
  
  # GET /tags/1
  # GET /tags/1.json
  def show
    
  end

  # GET /tags/new
  def new
 end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    @tag.id = Tag.count(:all)
    @tag.like = 0; 
    @tag.dislike = 0; 
    @article = Article.find_by_id params[:subaction]
    @tag_article = TagArticle.new
    @tag_article.tag_id = Tag.count(:all)
    @tag_article.article_id = @article.id
    @tag_article.save    
    @tag_devise = TagDevise.new 
    @tag_devise.devise_id = current_user.id 
    @tag_devise.tag_id = Tag.count(:all)
    @tag_devise.save
      if @tag.save
        redirect_to :controller => :articles, :action => :show, :id => @article.id
      else
      end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:str, :like, :dislike, :user_id, :article_id)
    end
end

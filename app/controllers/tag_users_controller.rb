class TagUsers < ApplicationController
  before_action :set_tag_user, only: [:show, :edit, :update, :destroy]

  def index 
    @tag = Tag.find params[:tag_id]
    @tag_users = TagUser.all 
    @users = User.all 
  end 
  
  def show
    @tag_users = TagUser.all 
    @tags = Tag.all 
  end
  
  def new 
    @tag = Tag.find params[:tag_id]
    @tag_users = @tag.tag_users.new
  end 
  
  def edit 
  end 
  
  def create
    @tag = Tag.find params[:tag_id]
    @tag_user = @tag.tag_users.new(tag_user_params)
    if @tag_user.save 
      redirect_to @tag_user, notice: 'Tag User was successfully created.' 
    else 
      render :new
    end 
  end 
  
  def update 
    respond_to do |format|
      if @tag_user.update(tag_user_params)
        redirect_to @tag_user, notice: 'Tag user was successfully updated.' 
      else 
        render :edit 
      end 
    end 
  end 
 
  def destroy 
    @tag_user.destroy
    redirect_to tags_path, notice: 'Tag user was successfully destroyed.' 
  end 

private 

  def set_tag_user
    @tag_user = TagUser.find(params[:id])
  end 

  def tag_user_params
    params.require(:tag_user).permit(:tag_id, :user_id)
  end 
end 

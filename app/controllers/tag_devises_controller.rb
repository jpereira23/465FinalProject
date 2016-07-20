class TagDevisesController < ApplicationController
  before_action :set_tag_devise, only: [:show, :edit, :update, :destroy]

  # GET /tag_devises
  # GET /tag_devises.json
  def index
    @tag_devises = TagDevise.all
    @tags = Tag.order(like: :asc)
  end

  # GET /tag_devises/1
  # GET /tag_devises/1.json
  def show
  end

  # GET /tag_devises/new
  def new
    @tag_devise = TagDevise.new
  end

  # GET /tag_devises/1/edit
  def edit
  end

  # POST /tag_devises
  # POST /tag_devises.json
  def create
    @tag_devise = TagDevise.new(tag_devise_params)

    respond_to do |format|
      if @tag_devise.save
        format.html { redirect_to @tag_devise, notice: 'Tag devise was successfully created.' }
        format.json { render :show, status: :created, location: @tag_devise }
      else
        format.html { render :new }
        format.json { render json: @tag_devise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_devises/1
  # PATCH/PUT /tag_devises/1.json
  def update
    respond_to do |format|
      if @tag_devise.update(tag_devise_params)
        format.html { redirect_to @tag_devise, notice: 'Tag devise was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_devise }
      else
        format.html { render :edit }
        format.json { render json: @tag_devise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_devises/1
  # DELETE /tag_devises/1.json
  def destroy
    @tag_devise.destroy
    respond_to do |format|
      format.html { redirect_to tag_devises_url, notice: 'Tag devise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_devise
      @tag_devise = TagDevise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_devise_params
      params.require(:tag_devise).permit(:devise_id, :tag_id)
    end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    @categories = Category.all
    authorize @categories
  end


  def show
  end


  def new
    @category = current_user.categories.build
    authorize @category
  end

 
  def edit
  end


  def create
    @category = current_user.categories.build(category_params)
    authorize @category
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
      authorize @category
    end
    def correct_user
      @category = current_user.categories.find_by(id: params[:id])
      redirect_to categories_path, notice: "Not authorized to edit this Category" if @category.nil?
    end

    def category_params
      params.require(:category).permit(:name)
    end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @categories = Category.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
    authorize @categories
  end

  def show
  end


  def new
    @industry = Industry.find(params[:industry_id])
    @category = @industry.categories.new
    authorize @category
  end

 
  def edit
  end


  def create
    @industry = Industry.find(params[:industry_id])
    @category = @industry.categories.new(category_params)
    @category.save
    respond_with @industry
    authorize @category
  end


  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @industry, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @category.destroy
    redirect_to @industry
    flash[:notice] = "You have succesfully deleted the category."
  end

  private
    def set_category
      @category = Category.find(params[:id])
      @industry = Industry.find(params[:industry_id])
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

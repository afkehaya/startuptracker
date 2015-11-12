class IndustriesController < ApplicationController
  before_action :set_industry, only: [:show, :edit, :update, :destroy]

  def index
    query = params[:q].presence || "*"
    @industries = Industry.search(query)
    authorize @industries
  end

  def show
  	@categories = @industry.categories
  end

  def new
    @industry = Industry.new
    authorize @industry
  end
 
  def edit
  end


  def create
    @industry = Industry.new(industry_params)
    authorize @industry
    respond_to do |format|
      if @industry.save
        format.html { redirect_to @industry, notice: 'industry was successfully created.' }
        format.json { render :show, status: :created, location: @industry }
      else
        format.html { render :new }
        format.json { render json: @industry.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @industry.update(industry_params)
        format.html { redirect_to @industry, notice: 'Industry was successfully updated.' }
        format.json { render :show, status: :ok, location: @indsutry }
      else
        format.html { render :edit }
        format.json { render json: @industry.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @industry.destroy
    respond_to do |format|
      format.html { redirect_to industries_url, notice: 'Inustry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    render json: ["TEST"]
  end
  private
    def set_industry
      @industry = Industry.find(params[:id])
      authorize @industry
    end
   # def correct_user
     # @industry = current_user.industries.find_by(id: params[:id])
      #redirect_to industries_path, notice: "Not authorized to edit this Industry" if @industry.nil?
   # end

    def industry_params
      params.require(:industry).permit(:name)
    end
end


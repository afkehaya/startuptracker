class SubmissionsController < InheritedResources::Base
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  def index
    @submissions = Submission.all
    authorize @submissions
  end

  def show
  	@categories = @submission.categories
  end

  def new
    @submission = Submission.new
    authorize @submission
  end

 
  def edit
  end


  def create
    @submission = Submission.new(submission_params)
    authorize @submission
    @submission.user = current_user
    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
      authorize @submission
    end

    def submission_params
      params.require(:submission).permit(:name)
    end
end



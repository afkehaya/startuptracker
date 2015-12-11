class SubmissionsController < InheritedResources::Base

  private

    def submission_params
      params.require(:submission).permit(:business, :description)
    end
end


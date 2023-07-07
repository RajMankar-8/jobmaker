class JobCategorysController < ApplicationController
  before_action :ransack_search, only: %i[index show]

  def show
   @job_category = JobCategory.find(params[:id])
   @documents = @job_category.jobs.all
  end

  private
  def ransack_search
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distint: true).page(params[:page])
    @job_categorys = JobCategory.all
  end
end

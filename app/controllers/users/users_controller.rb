class Users::UsersController < ApplicationController
  before_action :ransack_search, only: %i[index edit]

  def index
    @my_jobs = Job.where(job_post_id: current_user.id)
  end

  def edit
    @my_jobs = Job.where(job_post_id: current_user.id)
    @job = Job.find(params[:id])
  end

  def condition_for_edit
    @my_jobs = true
  end

  private
  def job_params
    params.require(:job).permit(:title, :job_category_id, :employment_type, :location_type, :salary, :link_to_apply,
     :description, :max_positions, :qualification, :job_category_name, :job_post_id)
  end

  def ransack_search
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distint: true).page(params[:page])
    @job_categorys = JobCategory.all
  end
end
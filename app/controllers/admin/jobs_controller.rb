class Admin::JobsController < ApplicationController
  before_action :ransack_search, only: %i[index new my_jobs create show]

  def index
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      JobsMailer.job_creation_mailer(@job,current_user).deliver_now 
      redirect_to action: "index"
    else 
      render :new, status: :unprocessable_entity
    end   
  end

  def show
    @job = Job.find(params[:id])
  end 

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to users_users_path
    else 
      redirect_to edit_users_user_path(@job), status: :unprocessable_entity
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_job_path, status: :see_other
  end

  def whatever_view_this_is
    @q  = true
  end

  private

  def job_params
    params.require(:job).permit(:title, :job_category_id, :employment_type, :location_type, :salary, :link_to_apply, 
          :description, :max_positions, :qualification, :job_post_id, :company_image, :status)
  end

  def ransack_search
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distint: true).page(params[:page])
    @job_categorys = JobCategory.all
  end
end
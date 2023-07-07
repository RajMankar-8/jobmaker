  class HomesController < ApplicationController
    def index
      @job_categorys = JobCategory.all
      @q = Job.ransack(params[:q])
      @jobs = @q.result(distint: true).page(params[:page])
      @latest_jobs = Job.order(created_at: :desc).limit(10)
    end

    def new 
    end

    def create
    end
  end

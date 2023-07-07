class JobsMailer < ApplicationMailer

  def job_creation_mailer(job,user)
    @user = user
    @job = job
    mail to: @user.email, subject:"Job Posting"
  end
end

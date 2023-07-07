class AddAttrToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :job_post_id, :integer
  end
end

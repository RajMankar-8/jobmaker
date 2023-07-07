class RemoveAttrFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :job_category_name, :string
  end
end

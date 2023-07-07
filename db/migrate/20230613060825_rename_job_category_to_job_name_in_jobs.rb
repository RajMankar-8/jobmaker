class RenameJobCategoryToJobNameInJobs < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs, :job_category, :job_category_name
  end
end

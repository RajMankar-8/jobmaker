class ChangeTypeOfDescription < ActiveRecord::Migration[7.0]
  def change
    change_column :jobs, :description, :rich_text
  end
end

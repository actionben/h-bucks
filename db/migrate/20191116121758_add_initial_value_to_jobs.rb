class AddInitialValueToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :initial_value, :integer
  end
end

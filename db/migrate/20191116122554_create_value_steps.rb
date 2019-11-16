class CreateValueSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :value_steps do |t|
      t.belongs_to :job, foreign_key: true
      t.integer :duration
      t.integer :change

      t.timestamps
    end
  end
end

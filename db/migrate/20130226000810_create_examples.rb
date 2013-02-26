class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string  :name
      t.string  :status
      t.integer :age
      t.timestamps
    end
  end
end

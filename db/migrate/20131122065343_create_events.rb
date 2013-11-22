class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :age
      t.date :borthday
      t.boolean :is_public

      t.timestamps
    end
  end
end

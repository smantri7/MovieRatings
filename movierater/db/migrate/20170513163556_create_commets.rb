class CreateCommets < ActiveRecord::Migration[5.1]
  def change
    create_table :commets do |t|
      t.text :text
      t.string :author
      t.belongs_to :movie
      t.timestamps
    end
  end
end

class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.boolean :complete
      t.integer :correct
      t.integer :possible
      t.text :qajson

      t.timestamps
    end
  end
end

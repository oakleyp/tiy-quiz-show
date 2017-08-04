class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      t.boolean :published
      t.text :qajson

      t.timestamps
    end
  end
end

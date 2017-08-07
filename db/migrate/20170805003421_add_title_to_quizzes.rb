class AddTitleToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :title, :string
  end
end

class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end

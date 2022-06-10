class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :quiz, foreign_key: true, null: false

      t.timestamps
    end
  end
end

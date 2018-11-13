class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.integer :qnumber
      t.integer :qanswer

      t.timestamps
    end
  end
end

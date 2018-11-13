json.extract! question_answer, :id, :qnumber, :qanswer, :created_at, :updated_at
json.url question_answer_url(question_answer, format: :json)

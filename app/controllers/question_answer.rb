post '/question' do
  question = Question.new(question_content: params[:question_content], user_id: current_user.id)
  if question.save
    redirect '/home'
  else
    @question_error = question.errors.messages.values.join(',')
    erb :"/static/home"
  end
end

post '/answer' do
  answer = Answer.new(answer_content: params[:answer_content], user_id: current_user.id, question_id: params[:question_id])
  if answer.save
    redirect '/home'
  else
  @answer_error = answer.errors.messages.values.join(',')
    erb :"/static/home"
  end
end

get '/question' do
  erb
end

get '/question/:id/edit' do
  @question = Question.find(params[:id])
  erb :"/static/question_edit"
end

patch '/question/:id/edit' do
  @question = Question.find(params[:id])
  if @question.update(params[:question])
    @message = "Question updated"
    redirect to '/'
  end
end

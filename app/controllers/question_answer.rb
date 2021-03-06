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
    redirect '/'
  end
end

get '/answer/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'/static/answer_edit'
end

patch '/answer/:id/edit' do
  @answer = Answer.find(params[:id])
  if @answer.update(params[:answer])
    @message = "answer updated"
    redirect '/'
  end
end

get '/question/:id/delete' do
  @question = Question.find(params[:id])
  @question.destroy
  @message = "Question has been successfully deleted."
  redirect back
end

get '/answer/:id/delete' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  @message = "Answer has been successfully deleted"
  redirect back
end

get '/question/:id/upvote' do
  if current_user
    @question = Question.find(params[:id])
    @question_vote = QuestionVote.find_by(question_id: @question.id, user_id: current_user.id)
    if @question_vote != nil
      if @question_vote.vote == 1
        @question_vote.delete
      else
        @question_vote.update(vote: 1)
      end
    else
      @question_vote = QuestionVote.create(question_id: @question.id, vote: 1, user_id: current_user.id)
    end
      redirect back
  else
    @login_message = 'Please log first.'
    erb :'static/index'
  end
end

get '/question/:id/downvote' do
  if current_user
    @question = Question.find(params[:id])
    @question_vote = QuestionVote.find_by(question_id: @question.id, user_id: current_user.id)
    if @question_vote != nil
      if @question_vote.vote == -1
        @question_vote.delete
      else
        @question_vote.update(vote: -1)
      end
    else
      @question_vote = QuestionVote.create(question_id: @question.id, vote: -1, user_id: current_user.id)
    end
    redirect back
  else
    @login_message = 'Please log first.'
    erb :'static/index'
  end
end

get '/answer/:id/upvote' do
  if current_user
    @answer = Answer.find(params[:id])
    @answer_vote = AnswerVote.find_by(answer_id: @answer.id, user_id: current_user.id)
    if @answer_vote != nil
      if @answer_vote.vote == 1
        @answer_vote.delete
      else
        @answer_vote.update(vote: 1)
      end
    else
      @answer_vote = AnswerVote.create(answer_id: @answer.id, vote: 1, user_id: current_user.id)
    end
      redirect back
  else
    @login_message = 'Please log first.'
    erb :'static/index'
  end
end

get '/answer/:id/downvote' do
  if current_user
    @answer = Answer.find(params[:id])
    @answer_vote = AnswerVote.find_by(answer_id: @answer.id, user_id: current_user.id)
    if @answer_vote != nil
      if @answer_vote.vote == -1
        @answer_vote.delete
      else
        @answer_vote.update(vote: -1)
      end
    else
      @answer_vote = AnswerVote.create(answer_id: @answer.id, vote: -1, user_id: current_user.id)
    end
    redirect back
  else
    @login_message = 'Please log first.'
    erb :'static/index'
  end
end

class QuestionsController < ApplicationController
  before_action :set_quetion, only: %i[update show destroy edit]
  
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question), notice: 'Новый вопрос создан!!!'
    else 
      flash.now[:alert] = 'Вы не заполнили поля формы   <<Текст вопроса>>  или <<ID пользователя>>'

      render :new
    end
  end

  def update 
  	@question.update(question_params)

  	redirect_to question_path(@question), notice: "Вопрос обновлен! ID ##{@question.user_id}"
  end

  def destroy
  	@question.destroy 	

  	 redirect_to questions_path, notice: "Вопрос удален! ID ##{@question.user_id}"
  end

  def show  		
  end

  def index
  	@questions = Question.all
    @question = Question.new
  end

  def new
  	@question = Question.new
  end

  def edit	
  end

  private

  def question_params
   params.require(:question).permit(:body, :user_id) 
  end

  def set_quetion
    @question = Question.find(params[:id])
  end


end
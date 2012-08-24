class AnswersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @answers = Answer.all(:order  =>"created_at DESC")
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.new(params[:answer])
    respond_to do |format|
      if @answer.save
        format.html { redirect_to(answers_path, :notice => 'Answer was successfully created.') }
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  def update
    @answer = Answer.find(params[:id])
    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to(@answer, :notice => 'Answer was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to(answers_path) }
    end
  end

  def ratting_submit
    @answer = Answer.find(params[:id])
    @answer.rating = params[:rating]
    @answer.save
    respond_to do |format|
      format.json { render :json => @answer.rating.to_json }
    end
  end
end

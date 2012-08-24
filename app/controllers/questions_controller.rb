class QuestionsController < ApplicationController

  before_filter :authenticate_user!
  prepend_before_filter :authorize_association!

  def index
    @questions = Question.paginate(:page => params[:page], :per_page => 7).order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params[:question])
    respond_to do |format|
      if @question.save
        format.html { redirect_to(questions_path, :notice => 'Question was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question, :notice => 'Question was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to(questions_path) }
    end
  end

  def send_email
    @question = Question.find(params[:id])
    @user = current_user
    @email = current_user.email
    UserMailer.member_alert(@email,  @question).deliver
    respond_to do |format|
      format.html { redirect_to(questions_path) }
    end
  end

  def feed
  @title = "Your feed title (e.g. Matthias Frick - Blog - Feed)"
  # all blogposts
  @questions = Question.order("created_at desc")
  # update timestamp for the feed
  @updated = @@questions.first.updated_at unless @questions.empty?
    respond_to do |format|
      format.atom { render :layout => false }
    
      # if you want to permanently redirect to the ATOM feed and do not use the RSS feed
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end

end

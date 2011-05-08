class QuestionsController < ApplicationController
  before_filter :adminseulement, :except => [:show, :reponse]
  # GET /questions
  # GET /questions.xml
  def index
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])
    flash[:chemin] = "<a href='/'>Challenges</a>"+" > "+"<a href='/categories/#{@question.category_id}'>#{@question.category.libelle}</a>"+" > r&eacute;ponse"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.xml
  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    @question.nb_reponse = 0

    respond_to do |format|
      if @question.save
        format.html { redirect_to(@question, :notice => 'Question was successfully created.') }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question, :notice => 'Question was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end
  
  def reponse
    question = Question.find(params[:question_id])
    if question.response_est_juste?(params[:reponse])
      flash[:notice] = "Votre reponse est correcte"
      if user_signed_in?
        unless current_user.a_repondu_a?(question)
          current_user.questions << question
          current_user.points = current_user.points + question.points
          current_user.save
        end
      end
      redirect_to question.category
    else
      flash[:notice] = "Votre reponse n'est pas correcte"
      redirect_to question
    end
  end
end

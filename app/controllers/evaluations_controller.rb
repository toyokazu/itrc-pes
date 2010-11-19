require 'RedCloth'

class EvaluationsController < ApplicationController
  require_auth = [:index]
  if defined?(AuthenticatedSystem)
    before_filter :login_required, :only => require_auth
  end

  # GET /evaluations
  # GET /evaluations.xml
  def index
    if !params[:presentation_id].nil?
      @evaluations = Evaluation.all(:conditions => {:presentation_id => params[:presentation_id]})
    else
      @evaluations = Evaluation.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @evaluations }
    end
  end

  # GET /evaluations/1
  # GET /evaluations/1.xml
  def show
    @evaluation = Evaluation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @evaluation }
    end
  end

  # GET /meetings/1/evaluations/summaries
  # GET /presentations/1/evaluations/summaries
  # GET /evaluations/summaries
  # GET /evaluations/summaries.xml
  def summaries
    @summaries = []
    if !params[:presentation_id].nil?
      @presentation = Presentation.find(params[:presentation_id])
      summary = @presentation.summary
      @summaries.push(summary) if !summary.nil?
    else
      @presentations = nil
      if !params[:meeting_id].nil?
        @presentations = Meeting.find(params[:meeting_id]).presentations
      else
        @presentations = Presentation.all
      end
      @presentations.each do |presentation|
        summary = presentation.summary
        @summaries.push(summary) if !summary.nil?
      end
    end
    respond_to do |format|
      format.html # summaries.html.erb
      format.xml  { render :xml => @summaries }
    end
  end

  # GET /evaluations/new
  # GET /evaluations/new.xml
  def new
    if !params[:presentation_id].nil?
      @conditions = {:id => params[:presentation_id]}
    elsif !params[:meeting_id].nil?
      @conditions = {:meeting_id => params[:meeting_id]}
    end
    @evaluation = Evaluation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @evaluation }
    end
  end

  # GET /evaluations/1/edit
  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  # POST /evaluations
  # POST /evaluations.xml
  def create
    @evaluation = Evaluation.new(params[:evaluation])

    respond_to do |format|
      if @evaluation.save
        flash[:notice] = 'Evaluation was successfully created.'
        format.html { redirect_to(@evaluation) }
        format.xml  { render :xml => @evaluation, :status => :created, :location => @evaluation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @evaluation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /evaluations/1
  # PUT /evaluations/1.xml
  def update
    @evaluation = Evaluation.find(params[:id])

    respond_to do |format|
      if @evaluation.update_attributes(params[:evaluation])
        flash[:notice] = 'Evaluation was successfully updated.'
        format.html { redirect_to(@evaluation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @evaluation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.xml
  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy

    respond_to do |format|
      format.html { redirect_to(evaluations_url) }
      format.xml  { head :ok }
    end
  end
end

class RequestSelectionsController < ApplicationController
  # GET /request_selections
  # GET /request_selections.json
  def index
   
    @response = Response.find(params[:response_id])
    @request_selections = @response.request_selections
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @request_selections }
    end
  end

  # GET /request_selections/1
  # GET /request_selections/1.json
  def show
     @response = Response.find(params[:response_id])
    @request_selection = RequestSelection.find(params[:id])

    #@request_selection = RequestSelection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_selection }
    end
  end

  # GET /request_selections/new
  # GET /request_selections/new.json
  def new
    @response = Response.find(params[:response_id])
    @request_selection = @response.request_selections.build

    #@request_selection = RequestSelection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request_selection }
    end
  end

  # GET /request_selections/1/edit
  def edit

    @response = Response.find(params[:response_id])
    @request_selection = RequestSelection.find(params[:id])
  end

  # POST /request_selections
  # POST /request_selections.json
  def create

     @response = Response.find(params[:response_id])
    @request_selection = @response.request_selections.build(params[:request_selection])
   
 
    respond_to do |format|
      if @request_selection.save
       
        #format.html { redirect_to response_request_selections_path @response, notice: 'This developer has been selected for this project request.' }
        format.html { redirect_to _my_requests_path }
        format.json { render json: @request_selection, status: :created, location: @request_selection }
      else
        format.html { render action: "new" }
        format.json { render json: @request_selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /request_selections/1
  # PUT /request_selections/1.json
  def update

    @response = Response.find(params[:response_id])
    @request_selection = RequestSelection.find(params[:id])
    

    respond_to do |format|
      if @request_selection.update_attributes(params[:request_selection])
        format.html { redirect_to response_request_selections_path(@response, @request_selection), notice: 'Request Selection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request_selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_selections/1
  # DELETE /request_selections/1.json
  def destroy
    @response = Response.find(params[:response_id])
     
    @request_selection = RequestSelection.find(params[:id])



   # @request_selection = RequestSelection.find(params[:id])
    @request_selection.destroy

    respond_to do |format|
      format.html { redirect_to response_request_selections_path(@response) }
      format.json { head :no_content }
    end
  end
end

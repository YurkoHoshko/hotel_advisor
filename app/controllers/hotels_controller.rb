class HotelsController < ApplicationController

before_filter :authenticate_user!, :except=>[:index, :show, :welcome]


  def welcome
    @top_five = Hotel.top_five
    @hotels = Hotel.all


    respond_to do |format|
      format.html {redirect_to hotels_path, :if=>!@top_five.presence}
      format.html {render :layout=>"landing_layout"}
      format.json { render json: @hotels }

    end
  end

  # GET /hotels
  # GET /hotels.json
  def index
    @top_five = Hotel.top_five
    @hotels = Hotel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hotels }
    end
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    @hotel = Hotel.find(params[:id])
    @comment = Comment.new
  end

  # GET /hotels/new
  # GET /hotels/new.json
  def new
    @hotel = Hotel.new
    3.times {@hotel.images.build}



    respond_to do |format|
      format.html
      format.json { render json: @hotel }
    end
  end

  # GET /hotels/1/edit


  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(params[:hotel])


    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render json: @hotel, status: :created, location: @hotel }
      else
        format.html { render action: "new" }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hotels/1
  # PUT /hotels/1.json


  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    respond_to do |format|
      format.html { redirect_to hotels_url }
      format.json { head :no_content }
    end
  end
end

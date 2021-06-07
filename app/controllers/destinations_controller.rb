class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  # GET /destinations
  # GET /destinations.json
  def index
    @destinations = Destination.all
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
  end
  def member_destination
    @destination = Destination.new
    @group = params[:group_id]
    @code = params['code']
    @member = params['member_id']
    require 'httparty'
    require 'json'
    response = HTTParty.get("http://UsanPull1API.usanorth811.org/member_destinations?member_id="+ params[:member_id], :verify => false)
    pp response
    @member_destinations = response
    render partial: 'destinations/member_destination'
  end
  # GET /destinations/new
  def new
    @destination = Destination.new
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = Destination.new(destination_params)
    DestinationMailer.with(billing_id: @destination.group.billing_id, code: @destination.code, old_destination: @destination.old_destination, new_destination: @destination.new_destination, email: @destination.user.email, name: "#{@destination.user.profile.first_name} #{@destination.user.profile.last_name}").destination.deliver_later!(wait: 1.second)

    respond_to do |format|
      if @destination.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('new_destination', partial: 'destinations/request_submitted', locals: {
            member_id: @destination.member,
            code: @destination.code,
            group_id: @destination.group_id}) }
        format.html { redirect_to @destination.group, notice: 'Destination change request was submitted. A representative will contact you shortly.' }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { redirect_to @destination.group, notice: 'Destination change request was submitted. A representative will contact you shortly.' }
        format.html { redirect_to @destination.group, notice: 'There was an error processing your request. Please try again' }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinations/1
  # PATCH/PUT /destinations/1.json
  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url, notice: 'Destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_params
      params.require(:destination).permit(:old_destination, :new_destination, :code, :group_id, :user_id, :member, :completed)
    end
end

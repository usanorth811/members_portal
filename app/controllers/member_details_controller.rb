class MemberDetailsController < ApplicationController
  before_action :set_member_detail, only: [:show, :edit, :update, :destroy]

  # GET /member_details
  # GET /member_details.json
  def index
    @member_details = MemberDetail.all
  end

  # GET /member_details/1
  # GET /member_details/1.json
  def show
  end

  # GET /member_details/new
  def new
    @member_detail = MemberDetail.new
  end

  # GET /member_details/1/edit
  def edit
  end

  # POST /member_details
  # POST /member_details.json
  def create
    @member_detail = MemberDetail.new(member_detail_params)
    #set group code as billing id
    @member_detail.group_code = @member_detail.group.billing_id
    #define active as true or false
    if @member_detail.active == "true"
      @active = "1"
    else
      @active = "0"
    end

    #validate request
    if @member_detail.valid?
      #post data to jas
      api_update
    else
      #redirect and display error
      flash[:member_detail_errors] = @member_detail.errors.full_messages
      redirect_to @member_detail.group, flash[:member_detail_errors]
    end
  end
  def api_update
    @result = HTTParty.put("http://52.52.172.182/members/#{@member_detail.member_id}",
                           :body => {:member => {
                               :facility_type => "#{@member_detail.facility}"
                           }}.to_json,
                           :headers => { 'Content-Type' => 'application/json' } )
    puts @member_detail.member_id
    case @result.code
    when 200...290
      respond_to do |format|
        format.html { redirect_to @member_detail.group, notice: 'Your changes have been saved, but may take a moment to appear on this page' }
        ready_message
      end
    when 404
      respond_to do |format|
        format.html { redirect_to @member_detail.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues" }
      end
    when 500...600
      respond_to do |format|
        format.html { redirect_to @member_detail.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues. Error: #{response.code}" }
      end
    end
  end
  def ready_message
    #define action from stype
    if @member_detail.stype == 'DELETE'
      @action = 'deleted'
    elsif @member_detail.stype == 'UPDATE'
      @action = 'updated'
    else
      @action = 'added'
    end
    #define user and admin message
    @usermessage = "Your " + @member_detail.company.downcase + " facility type for " + @member_detail.member_code.to_s + " was succesfully " + @action
    @message = current_user.profile.first_name.to_s + ' ' + current_user.profile.last_name.to_s + ' '+@action+' a '+@member_detail.company+' contact for ' + @member_detail.member_code.to_s
    #prepare delayed job of email send
    ActionMailer::Base.mail(from: "memberservices@usanorth811.org", to: 'memberservices@usanorth811.org', subject: @message, template_path: 'layouts', template_name: 'facility_mailer').deliver_later!(wait: 1.minute)
    ActionMailer::Base.mail(from: "memberservices@usanorth811.org", to: current_user.email, subject: @usermessage, template_path: 'layouts', template_name: 'facility_mailer').deliver_later!(wait: 1.minute)
  end

  #def create
  #  @member_detail = MemberDetail.new(member_detail_params)
  #
  #   respond_to do |format|
  #     if @member_detail.save
  #       format.html { redirect_to @member_detail, notice: 'Member detail was successfully created.' }
  #       format.json { render :show, status: :created, location: @member_detail }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @member_detail.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /member_details/1
  # PATCH/PUT /member_details/1.json

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_member_detail
    @member_detail = MemberDetail.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_detail_params
    params.require(:member_detail).permit(:name, :member_id, :member_code, :stype, :group_code, :company, :description, :facility, :active, :group_id)
  end
end

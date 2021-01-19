class MemberContactsController < ApplicationController
  before_action :set_member_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_contact_types

  def set_contact_types
    @contact_types = { "RCVR" => 'MARKING CONTACT',
                       "ALTR" => 'ALTERNATE',
                       'BILL' => 'BILLING',
                       'BORD' => 'Board Rep',
                       'DAMG' => 'EMERGENCY/DAMAGES',
                       'ENGR' => 'ENGINEERING',
                       'DATA' => 'DATABASE',
                       'EMER' => 'EMERGENCY/DAMAGES',
                       'MAIN' => 'MAIN SWITCHBOARD',
                       'SURV' => 'SURVEYOR',
                       'CONT' => 'MARKING CONTACT',
                       'NITE' => 'NIGHT TIME',
                       'AHRS' => 'AFTER HOURS',
                       'VACU' => 'VACUUM',
                       'REPR' => 'MEMBER REP'}
  end
  # GET /member_contacts
  # GET /member_contacts.json
  def index
    @member = params[:member_id]
    @member_code = params[:member_code]
    @group = params[:group_id]
  end

  def contact_list
    require 'httparty'
    require 'json'
    response = HTTParty.get("http://UsanPull1API.usanorth811.org/member_contacts?member_id="+ params[:member_id], :verify => false)
    @contact_list = response['data']
    @member_id = params[:member_id]
    @member_code = params[:member_code]
    @group = params[:group_id]
    @missing_contact_types = @contact_types.except('CONT')
    @codestatus = Codestatus.new
    render partial: 'member_contacts/contact_list'
  end

  # GET /member_contacts/1
  # GET /member_contacts/1.json
  def show

  end

  # GET /member_contacts/new
  def new
    if params[:contact_id].present?
      require 'httparty'
      require 'json'
      response = HTTParty.get("http://UsanPull1API.usanorth811.org/member_contacts/"+ params[:contact_id], :verify => false)
      @contact = response
    end
    @group = params[:group_id]
    @member_code = params[:member_code]
    @member = params[:member_id]
    @stype = params[:stype]
    @member_contact = MemberContact.new
    @missing_type = params[:missing_type]
    puts "MEMBER ID"
    puts "MEMBER ID"
    puts "MEMBER ID"
    puts "MEMBER ID"
    puts "MEMBER ID"
    puts @member_code
    puts params[:member_code]
  end

  # GET /member_contacts/1/edit
  def edit
  end
  # POST /member_contacts
  # POST /member_contacts.json
  def create
    require 'uri'
    require 'net/http'
    @member_contact = MemberContact.new(member_contact_params)
    #update company field to match contact type
    update_company
    #otherwise, check if request is valid
    if @member_contact.save
      #send request if valid
      # Check request type
      if @member_contact.stype == 'INSERT'
        api_create
      elsif @member_contact.stype == 'UPDATE'
        api_update
      elsif @member_contact.stype == 'DELETE'
        api_delete
      end
      # send_notice
    else
      # send error if not valid
      pp @member_contact.errors
      respond_to do |format|
        flash[:member_contact_errors] = @member_contact.errors.full_messages
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@member_contact.contact_id.present? ? @member_contact.contact_id : @member_contact.member_id, partial: "member_contacts/form",
                                                                        params: { member_contact: @member_contact, member_id: @member_contact.member_id, group_id: @member_contact.group_id, stype: @member_contact.stype, contact: @member_contact}) }
        format.html { redirect_to @member_contact.group }
      end
    end
  end

  def update_company
    billing = Group.find(@member_contact.group_id)
    @member_contact.billing = billing.billing_id
    @contact_types = { "RCVR" => 'MARKING CONTACT',
                       "ALTR" => 'ALTERNATE',
                       'BILL' => 'BILLING',
                       'BORD' => 'Board Rep',
                       'DAMG' => 'EMERGENCY/DAMAGES',
                       'ENGR' => 'ENGINEERING',
                       'DATA' => 'DATABASE',
                       'EMER' => 'EMERGENCY/DAMAGES',
                       'MAIN' => 'MAIN SWITCHBOARD',
                       'SURV' => 'SURVEYOR',
                       'CONT' => 'MARKING CONTACT',
                       'NITE' => 'NIGHT TIME',
                       'AHRS' => 'AFTER HOURS',
                       'VACU' => 'VACUUM',
                       'REPR' => 'MEMBER REP'}
    puts @contact_types.fetch(@member_contact.contact_type)
    @member_contact.company = @contact_types.fetch(@member_contact.contact_type)
  end

  def api_create
    api_url = 'http://UsanPull1API.usanorth811.org'
    @result = HTTParty.post( api_url + "/member_contacts?user_name=CALEBWOODS&member_code=#{@member_contact.member_code}",
                            :body => {:member_contact => {
                                :member_id => @member_contact.member_id,
                                :contact_type => @member_contact.contact_type,
                                :name => @member_contact.company,
                                :address1 => @member_contact.address1,
                                :address2 => @member_contact.address2,
                                :city => @member_contact.city,
                                :state => @member_contact.state,
                                :zip => @member_contact.zip,
                                :contact => @member_contact.contact_name,
                                :phone => @member_contact.phone,
                                :phone_ext => @member_contact.phone_ext,
                                :email => @member_contact.email
                            }}.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )
    puts @result.code
    pp @result
    case @result.code
    when 200...290
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@member_contact.member_id, partial: "member_contacts/success", locals: { member_contact: @member_contact }) }
        format.html { redirect_to @member_contact.group, notice: 'Your changes have been saved, but may take a moment to appear on this page' }
      end
    when 404
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@member_contact.member_id, partial: "member_contacts/form",
                                                                        locals: { member_contact: @member_contact, result: @result}) }
        format.html { redirect_to @member_contact.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues. Error: #{response.code}" }
      end
    when 422
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@member_contact.member_id, partial: "member_contacts/form",
                                                                        locals: { member_contact: @member_contact, result: @result}) }
        format.html { redirect_to @member_contact.group, notice: "Unable to save duplicate contact." }
      end
    when 500...600
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@member_contact.member_id, partial: "member_contacts/form",
                                                                        locals: { member_contact: @member_contact, result: @result}) }
        format.html { redirect_to @member_contact.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues. Error: #{response.code}" }
      end
    end
  end
  def api_update
    puts "BEGIN API UPDATE"
    api_url = 'http://UsanPull1API.usanorth811.org'
    @result = HTTParty.put( api_url + "/member_contacts/#{@member_contact.contact_id}?user_name=CALEBWOODS&member_code=#{@member_contact.member_code}",
                           :body => {:member_contact => {
                               :member_id => @member_contact.member_id,
                               :contact_type => @member_contact.contact_type,
                               :name => @member_contact.company,
                               :address1 => @member_contact.address1,
                               :address2 => @member_contact.address2,
                               :city => @member_contact.city,
                               :state => @member_contact.state,
                               :zip => @member_contact.zip,
                               :contact => @member_contact.contact_name,
                               :phone => @member_contact.phone,
                               :phone_ext => @member_contact.phone_ext,
                               :email => @member_contact.email
                           }}.to_json,
                           :headers => { 'Content-Type' => 'application/json' } )
    puts @result.code
    pp @result.body
    case @result.code
    when 200...290
      puts @result.body
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@member_contact.contact_id, partial: "member_contacts/success", locals: { member_contact: @member_contact }) }
        format.html { redirect_to @member_contact.group, notice: 'Your changes have been saved, but may take a moment to appear on this page' }
      end
    when 404
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@member_contact.contact_id, partial: "member_contacts/form",
                                                                        locals: { member_contact: @member_contact, result: @result.code}) }
        format.html { redirect_to @member_contact.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues" }
      end
    when 500...600
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@member_contact.contact_id, partial: "member_contacts/form",
                                                                        locals: { member_contact: @member_contact, result: @result.code}) }
        format.html { redirect_to @member_contact.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues. Error: #{@result.code}" }
      end
    end
  end
  def destroy
    puts "BEGIN DELETE"
    puts params
  end
  def api_delete
    api_url = ENV['API_URL']
    @result = HTTParty.delete( api_url + "/member_contacts/#{@member_contact.contact_id}?user_name=CALEBWOODS&member_code=#{@member_contact.member_code}",
                              :headers => { 'Content-Type' => 'application/json' } )

    case @result.code
    when 200...290
      respond_to do |format|
        format.html { redirect_to @member_contact.group, notice: 'Your changes have been saved, but may take a moment to appear on this page' }
      end
    when 404
      respond_to do |format|
        format.html { redirect_to @member_contact.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues" }
      end
    when 500...600
      respond_to do |format|
        format.html { redirect_to @member_contact.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues. Error: #{response.code}" }
      end
    end
  end
  def send_notice
    if @member_contact.stype == 'DELETE'
      @action = 'deleted'
    elsif @member_contact.stype == 'UPDATE'
      @action = 'updated'
    else
      @action = 'added'
    end
    # Form user and admin message based on action
    @usermessage = "Your " + @member_contact.company.downcase + " contact for " + @member_contact.member_code.to_s + " was succesfully " + @action
    @message = current_user.profile.first_name.to_s + ' ' + current_user.profile.last_name.to_s + ' '+@action+' a '+@member_contact.company+' contact for ' + @member_contact.member_code.to_s

    #ActionMailer::Base.mail(from: "memberservices@usanorth811.org",reply_to: "memberservices@usanorth811.org", to: 'memberservices@usanorth811.org', subject: 'contact update details', body: @member_contact.inspect.to_yaml, content_type: 'yaml').deliver_later!(wait: 1.second)
    ActionMailer::Base.mail(from: "memberservices@usanorth811.org",reply_to: "memberservices@usanorth811.org", to: 'memberservices@usanorth811.org', subject: @message, template_path: 'layouts', template_name: 'contact_mailer').deliver_later!(wait: 1.second)
    ActionMailer::Base.mail(from: "memberservices@usanorth811.org",reply_to: "memberservices@usanorth811.org", to: current_user.email, subject: @usermessage, template_path: 'layouts', template_name: 'contact_mailer').deliver_later!(wait: 1.second)

  end

  def billing
    @member_contact.billing
  end
  def stype
    @member_contact.stype
  end
  def code
    @member_contact.member_code
  end
  def contact_type
    @member_contact.contact_type
  end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_member_contact
    @member_contact = MemberContact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_contact_params
    params.require(:member_contact).permit(:name, :ip, :member_id, :member_code, :contact_id, :contact_type, :company, :contact_name, :address1, :address2, :city, :state, :zip, :phone, :phone_ext, :email, :group_id, :stype, :billing)
  end
  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end
end

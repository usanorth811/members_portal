class MemberContactsController < ApplicationController
  before_action :set_member_contact, only: [:show, :edit, :update, :destroy]

  # GET /member_contacts
  # GET /member_contacts.json
  def index
    @member_contacts = MemberContact.all
  end

  # GET /member_contacts/1
  # GET /member_contacts/1.json
  def show
  end

  # GET /member_contacts/new
  def new
    @member_contact = MemberContact.new
  end

  # GET /member_contacts/1/edit
  def edit
  end
  # POST /member_contacts
  # POST /member_contacts.json
  def create
    @member_contact = MemberContact.new(member_contact_params)
    #update company field to match contact type
    update_company
    #otherwise, check if request is valid
    if @member_contact.valid?
      #send request if valid
      jas
    else
      #send error if not valid
      respond_to do |format|
        flash[:member_contact_errors] = @member_contact.errors.full_messages
        format.html { redirect_to @member_contact.group }
      end

    end
  end

  def update_company
    if @member_contact.contact_type == 'RCVR'
      @member_contact.company = 'MARKING CONTACT'
    elsif @member_contact.contact_type== 'ALTR'
      @member_contact.company = 'ALTERNATE'
    elsif @member_contact.contact_type== 'BILL'
      @member_contact.company =  'BILLING'
    elsif @member_contact.contact_type== 'BORD'
      @member_contact.company =  'Board Rep'
    elsif @member_contact.contact_type== 'DAMG'
      @member_contact.company =  'EMERGENCY/DAMAGES'
    elsif @member_contact.contact_type== 'DATA'
      @member_contact.company =  'DATABASE'
    elsif @member_contact.contact_type== 'EMER'
      @member_contact.company =  'EMERGENCY/DAMAGES'
    elsif @member_contact.contact_type== 'ENGR'
      @member_contact.company =  'ENGINEERING'
    elsif @member_contact.contact_type== 'MAIN'
      @member_contact.company =  'MAIN SWITCHBOARD'
    elsif @member_contact.contact_type== 'SURV'
      @member_contact.company =  'SURVEYOR'
    elsif @member_contact.contact_type== 'CONT'
      @member_contact.company = 'MARKING CONTACT'
    elsif @member_contact.contact_type== 'NITE'
      @member_contact.company =  'NIGHT TIME'
    elsif @member_contact.contact_type== 'AHRS'
      @member_contact.company =  'AFTER HOURS'
    elsif @member_contact.contact_type== 'VACU'
      @member_contact.company =  'VACUUM'
    elsif @member_contact.contact_type== 'REPR'
      @member_contact.company =  'MEMBER REP'
    end
  end

  def jas
    require 'uri'
    require 'net/http'
    # set url
    url = URI("https://jas.usanorth811.org:10443/membersapi")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Accept"] = '*/*'
    request["Cache-Control"] = 'no-cache'
    request["Host"] = 'jas2.usanorth811.org:10443'
    request["Accept-Encoding"] = 'gzip, deflate'
    request["Content-Length"] = '702'
    request["Connection"] = 'keep-alive'
    request["cache-control"] = 'no-cache'
    # def body of request
    @body = "{\n    \"token\": \"yZ24ytp8soMMJfB3BoZDDGZ2hzMaNhHm\",\n    \"page\": \"contacts\",\n    \"name\": \""+@member_contact.name+"\",\n    \"ip\": \"1.1.1.1\",\n    \"date_time\": \"07/01/2019 00:00:00.000\",\n    \"member_id\": \""+@member_contact.member_id+"\",\n    \"member_code\": \""+@member_contact.member_code+"\",\n    \"contacts\": [\n        {\n            \"stype\":\""+@member_contact.stype+"\",\n            \"contact_id\":\""+@member_contact.contact_id+"\",\n            \"type\":\""+@member_contact.contact_type+"\",\n            \"company\":\""+@member_contact.company+"\",\n            \"contact_name\":\""+@member_contact.contact_name+"\",\n            \"address1\":\""+@member_contact.address1+"\",\n            \"address2\":\""+@member_contact.address2+"\",\n            \"city\":\""+@member_contact.city+"\",\n            \"state\":\""+@member_contact.state+"\",\n            \"zip\":\""+@member_contact.zip+"\",\n            \"phone\":\""+@member_contact.phone+"\",\n            \"phone_ext\":\""+@member_contact.phone_ext+"\",\n            \"email\":\""+@member_contact.email+"\"\n        }\n    ]\n}"
    request.body = @body
    puts request.body
    # Send request
    response = http.request(request)
    # Check response status
    puts response.body
    outputj = JSON.parse(response.body)
    puts outputj["results"][0]["status"]
    output = outputj["results"][0]["status"].to_s
    # if response status is successful, then save request to database
    if output.start_with? 'Successful'
      respond_to do |format|
        if @member_contact.save
          # Define action based off stype
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
          # Redirect back to the group with success notification
          format.html { redirect_to @member_contact.group, notice: 'Your changes have been saved, but may take a moment to appear on this page' }
          format.json { render :show, status: :created, location: @member_contact }
          puts "successful update"
          # Delayed action of sending mail
          ActionMailer::Base.mail(from: "memberservices@usanorth811.org", to: 'memberservices@usanorth811.org', subject: @message, template_path: 'layouts', template_name: 'contact_mailer').deliver_later!(wait: 1.minute)
          ActionMailer::Base.mail(from: "memberservices@usanorth811.org", to: current_user.email, subject: @usermessage, template_path: 'layouts', template_name: 'contact_mailer').deliver_later!(wait: 1.minute)
        else
          # redirect and display error
          flash[:member_contact_errors] = @member_contact.errors.full_messages
          format.html { redirect_to @member_contact.group }
        end
      end
    else
      respond_to do |format|
        # Redirect and display generic error
        format.html { redirect_to @member_contact.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues" }
      end
    end
  end
  # PATCH/PUT /member_contacts/1
  # PATCH/PUT /member_contacts/1.json
  def update
    respond_to do |format|
      if @member_contact.update(member_contact_params)
        format.html { redirect_to @member_contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_contact }
      else
        format.html { render :edit }
        format.json { render json: @member_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_contacts/1
  # DELETE /member_contacts/1.json
  def destroy
    @member_contact.destroy
    respond_to do |format|
      format.html { redirect_to member_contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
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

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
    
    require 'uri'
    require 'net/http'
    if @member_contact.valid?
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
    
    @body = "{\n    \"token\": \"yZ24ytp8soMMJfB3BoZDDGZ2hzMaNhHm\",\n    \"page\": \"contacts\",\n    \"name\": \""+@member_contact.name+"\",\n    \"ip\": \"1.1.1.1\",\n    \"date_time\": \"07/01/2019 00:00:00.000\",\n    \"member_id\": \""+@member_contact.member_id+"\",\n    \"member_code\": \""+@member_contact.member_code+"\",\n    \"contacts\": [\n        {\n            \"stype\":\""+@member_contact.stype+"\",\n            \"contact_id\":\""+@member_contact.contact_id+"\",\n            \"type\":\""+@member_contact.contact_type+"\",\n            \"company\":\""+@member_contact.company+"\",\n            \"contact_name\":\""+@member_contact.contact_name+"\",\n            \"address1\":\""+@member_contact.address1+"\",\n            \"address2\":\""+@member_contact.address2+"\",\n            \"city\":\""+@member_contact.city+"\",\n            \"state\":\""+@member_contact.state+"\",\n            \"zip\":\""+@member_contact.zip+"\",\n            \"phone\":\""+@member_contact.phone+"\",\n            \"phone_ext\":\""+@member_contact.phone_ext+"\",\n            \"email\":\""+@member_contact.email+"\"\n        }\n    ]\n}"
    
    request.body = @body
    puts request.body
    response = http.request(request)
    puts response.read_body
    end
    respond_to do |format|
      if @member_contact.save
            @message = current_user.profile.first_name.to_s + ' ' + current_user.profile.last_name.to_s + ' '+@member_contact.stype+' a contact for ' + @member_contact.member_code.to_s 
            ActionMailer::Base.mail(from: "memberservices@usanorth811.org", to: 'memberservices@usanorth811.org', subject: @message, template_path: 'layouts', template_name: 'contact_mailer').deliver
            @useremail = current_user.email
            ActionMailer::Base.mail(from: "memberservices@usanorth811.org", to: @useremail, subject: @message, template_path: 'layouts', template_name: 'contact_mailer').deliver 
        format.html { redirect_to @member_contact.group, notice: 'Your changes have been saved' }
        format.json { render :show, status: :created, location: @member_contact }
      else
        flash[:member_contact_errors] = @member_contact.errors.full_messages
        format.html { redirect_to @member_contact.group }
        
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

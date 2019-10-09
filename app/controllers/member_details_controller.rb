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
    @member_detail.group_code = @member_detail.group.billing_id
    if @member_detail.active == "true"
      @active = "1"
    else
      @active = "0"
    end
    require 'uri'
    require 'net/http'
    if @member_detail.valid?
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

      @body = "{\n    \"token\": \"yZ24ytp8soMMJfB3BoZDDGZ2hzMaNhHm\",\n    \"page\": \"details\",\n    \"name\": \""+@member_detail.name+"\",\n    \"ip\": \"1.1.1.1\",\n    \"date_time\": \"07/01/2019 00:00:00.000\",\n    \"member_id\": \""+@member_detail.member_id+"\",\n    \"member_code\": \""+@member_detail.member_code+"\",\n    \"member\": [\n        {\n            \"stype\":\""+@member_detail.stype+"\",\n            \"group\":\""+@member_detail.group_code+"\",\n           \"company\":\""+@member_detail.company+"\",\n              \"description\":\""+@member_detail.description+"\",\n              \"facility\":\""+@member_detail.facility+"\",\n            \"active\":\""+@active+"\"\n            }\n    ]\n}"
      puts @body
      request.body = @body
      response = http.request(request)
      puts response.body
      outputj = JSON.parse(response.body)
      puts outputj["results"][0]["message"]
      output = outputj["results"][0]["message"].to_s
    end
    if output.start_with? '1'
      respond_to do |format|
        if @member_detail.save
          if @member_detail.stype == 'DELETE'
            @action = 'deleted'
          elsif @member_detail.stype == 'UPDATE'
            @action = 'updated'
          else
            @action = 'added'
          end
          @usermessage = "Your " + @member_detail.company.downcase + " facility type for " + @member_detail.member_code.to_s + " was succesfully " + @action
          @message = current_user.profile.first_name.to_s + ' ' + current_user.profile.last_name.to_s + ' '+@action+' a '+@member_detail.company+' contact for ' + @member_detail.member_code.to_s

          format.html { redirect_to @member_detail.group, notice: 'Your changes have been saved, but may take a moment to appear on this page' }
          format.json { render :show, status: :created, location: @member_detail }

          ActionMailer::Base.mail(from: "memberservices@usanorth811.org", to: 'memberservices@usanorth811.org', subject: @message, template_path: 'layouts', template_name: 'facility_mailer').deliver_later!(wait: 1.minute)
          ActionMailer::Base.mail(from: "memberservices@usanorth811.org", to: current_user.email, subject: @usermessage, template_path: 'layouts', template_name: 'facility_mailer').deliver_later!(wait: 1.minute)


        else
          flash[:member_detail_errors] = @member_detail.errors.full_messages
          format.html { redirect_to @member_detail.group }

        end
      end


    else
      respond_to do |format|
        format.html { redirect_to @member_contact.group, notice: "There was a problem processing your request. Please try again. Contact us at memberservices@usanorth811.org if the issue continues" }
      end
    end


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
  def update
    respond_to do |format|
      if @member_detail.update(member_detail_params)
        format.html { redirect_to @member_detail, notice: 'Member detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_detail }
      else
        format.html { render :edit }
        format.json { render json: @member_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_details/1
  # DELETE /member_details/1.json
  def destroy
    @member_detail.destroy
    respond_to do |format|
      format.html { redirect_to member_details_url, notice: 'Member detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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

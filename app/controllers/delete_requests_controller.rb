class DeleteRequestsController < InheritedResources::Base
  def create
    @delete_request = DeleteRequest.new(delete_request_params)
    respond_to do |format|
      if @delete_request.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_delete_request_#{@delete_request.contact_number}", partial: "delete_requests/success") }
        format.html { redirect_to @delete_request, notice: 'request was successfully submitted.' }
        format.json { render :show, status: :created, location: @delete_request }
        DeleteRequestMailer.with(delete_request: @delete_request, user: current_user.email).delete_request.deliver_later!(wait: 1.second)

      else
        format.turbo_stream { render :new }
        format.html { render :new }
        format.json { render json: @delete_request.errors, status: :unprocessable_entity }
      end
    end
  end
  private

    def delete_request_params
      params.require(:delete_request).permit(:code, :billing, :contact_type, :contact_name, :phone, :email, :user_id, :completed, :contact_number)
    end

end

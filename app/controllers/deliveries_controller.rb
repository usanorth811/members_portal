class DeliveriesController < InheritedResources::Base

  def index
    @deliveries = Delivery.all.where(group_id: current_user.groups)
    @notifications = Notification.all.where(group_id: current_user.groups)
  end

  def create
    @delivery = Delivery.new(delivery_params)
      respond_to do |format|
        if @delivery.save
          format.turbo_stream { redirect_to deliveries_path}
          format.html { redirect_to @delivery, notice: 'Notification Rule was successfully created.' }
          format.json { render :show, status: :created, location: @delivery }
        else
          format.html { render :new }
          format.json { render json: @delivery.errors, status: :unprocessable_entity }
        end
      end
  end

  private

    def delivery_params
      params.require(:delivery).permit(:billing, :member_code, :group_id, :delivery_type, :deliver_to, :email, :phone, :city, :county, :state, :zip, :ticket_type)
    end

end

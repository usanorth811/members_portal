class DeliveriesController < InheritedResources::Base

  def index
    @deliveries = Delivery.all.where(group_id: current_user.groups)
    @notifications = Notification.all.where(group_id: current_user.groups)
  end
  private

    def delivery_params
      params.require(:delivery).permit(:billing, :member_code, :group_id, :delivery_type, :deliver_to, :email, :phone, :city, :state, :zip)
    end

end

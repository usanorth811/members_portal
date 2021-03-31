class NotificationsController < InheritedResources::Base

  def index
    @notifications = Notification.all.where(group_id: current_user.groups)
  end

  private

    def notification_params
      params.require(:notification).permit(:group_id, :delivery_id, :concerned_citizen_ticket_id, :description)
    end

end

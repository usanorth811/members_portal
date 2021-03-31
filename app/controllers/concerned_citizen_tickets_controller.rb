class ConcernedCitizenTicketsController < InheritedResources::Base

  private

    def concerned_citizen_ticket_params
      params.require(:concerned_citizen_ticket).permit(:first, :last, :email, :state, :city, :zip, :address, :description, :notify_citizen)
    end

end

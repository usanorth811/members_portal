class ConcernedCitizenTicketsController < InheritedResources::Base

  private

    def concerned_citizen_ticket_params
      params.require(:concerned_citizen_ticket).permit(:first, :last, :email, :state, :city, :county, :zip, :address, :description, :notify_citizen, :ticket_type, :street, :cross_st)
    end

end

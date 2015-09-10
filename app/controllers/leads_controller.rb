class LeadsController < ApplicationController

  def create
    lead = Lead.new lead_params
    respond_to do |format|
      if lead.save
        @success = true
        @message = success_message
        format.js
      else
        @success = false
        @message = error_message(lead.errors)
        format.js
      end
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:email, :phone_number)
  end

  def success_message
    "We've got your info and we'll be in touch soon"
  end

  def error_message(errors)
    errors.full_messages.first
  end

end

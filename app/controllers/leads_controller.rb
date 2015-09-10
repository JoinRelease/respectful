class LeadsController < ApplicationController

  def create
    lead = Lead.new lead_params
    respond_to do |format|
      if lead.save
        format.js { message: success_message }
      else
        format.js { error: error_message(lead.errors)}
      end
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:email, :phone_number)
  end

  def success_message
    'Thanks for signing up!'
  end

  def error_message(errors)
    errors.full_messages.first
  end

end

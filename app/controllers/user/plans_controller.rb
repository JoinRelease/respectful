class User::PlansController < User::BaseController

  def index
    respond_to do |format|
      format.js
    end
  end

  def new
  end

end

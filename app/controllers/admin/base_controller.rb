class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end
end

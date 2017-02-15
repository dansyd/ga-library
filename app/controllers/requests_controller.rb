class RequestsController < ApplicationController
  def make_request
    @request = Request.create(user_id: @current_user.id, isbn: params[:isbn])
    redirect_to dashboard_path
  end

  def cancel_request
    if Request.find(params[:id]).user_id == @current_user.id
      @request = Request.find(params[:id]).destroy
    end
    redirect_to dashboard_path
  end
end

class RequestsController < ApplicationController
  def make_request
    @request = Request.create(user_id: @current_user.id, isbn: params[:isbn])
    flash[:message] = "Request made"
    redirect_to dashboard_path
  end

  def cancel_request
    if @current_user.admin || Request.find(params[:id]).user_id == @current_user.id
      @request = Request.find(params[:id]).destroy
    end
    flash[:message] = "Request cancelled"
    redirect_to dashboard_path
  end
end

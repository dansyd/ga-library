class RequestsController < ApplicationController
  def make_request
    @request = Request.create(user_id: @current_user.id, isbn: params[:isbn])
    flash[:message] = "Request made (See me in Requests#make_request)"
    redirect_to dashboard_path
  end

  def cancel_request
    if @current_user.admin || Request.find(params[:id]).user_id == @current_user.id
      @request = Request.find(params[:id]).destroy
    end
    flash[:message] = "Request cancelled (See me in Requests#cancel_request)"
    redirect_to dashboard_path
  end
end

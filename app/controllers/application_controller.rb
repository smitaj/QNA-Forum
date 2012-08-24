class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize_association!
    current_path = url_for(:controller => params[:controller], :action => params[:action], :id => params[:id], :only_path => true)
    logger.info "----------------------------------------------"
    if not user_signed_in?
      flash[:alert] = "You need to sign in to access the system!!!"
      redirect_to new_user_session_path
    end
  end
end

class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorized

  private
  
  def authorized
    @user = User.find_by(id: session[:user_id])
    return render json: {errors: ["Not Authorized"]}, status: :unauthorized unless @user
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end

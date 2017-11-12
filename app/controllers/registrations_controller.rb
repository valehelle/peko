class RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.permit(:nickname, :email, :password, :password_confirmation)
  end

end

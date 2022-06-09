class UsersController < Clearance::UsersController
  private

  def user_params
      params.require(:user).permit(:username, :email, :password)
  end
  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end
end

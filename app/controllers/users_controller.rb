class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Usuário atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_admin!
    redirect_to root_path, alert: "Acesso negado." unless current_user&.role == "admin"
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :cellphone, :oab, :role)
  end
end

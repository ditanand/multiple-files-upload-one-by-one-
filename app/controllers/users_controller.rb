class UsersController < ApplicationController

  def index
  end

  def new
  	@user = User.new
  	@user.photos.build if @user.photos.none?
  end

  def create
  	user = User.new(user_params)
  	if user.save
  		flash[:notice] = "user information saved successfully!"
  		redirect_to root_path
  	else
  		flash[:error] = user.errors.full_messages.to_sentence
  		redirect_to :back
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email,photos_attributes: [:title, :attachment, :_destroy, :id])
  end
end

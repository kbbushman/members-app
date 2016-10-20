class SessionsController < ApplicationController

	def new
		@member = Member.new
	end

	def create
    member_params = params.require(:member).permit(:email, :password)
    # confirm that email/password combination is correct
    @member = Member.confirm(member_params)
    if @member
      login(@member)
      redirect_to @member
    else
      redirect_to login_path
    end
  end

  def destroy
    logout # coming soon in SessionsHelper
    redirect_to root_path
  end

end

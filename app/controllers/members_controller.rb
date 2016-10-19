class MembersController < ApplicationController

	def index
		@members = Member.all
	end

	def new
		@member = Member.new
	end

	def create
		@member = Member.create(member_params)
		redirect_to root_path
	end

	def show
		@member = Member.find_by_id(params[:id])
	end

	private

	def member_params
		params.require(:member).permit(:first_name, :last_name, :email, :password)
	end

end

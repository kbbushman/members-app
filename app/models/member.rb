class Member < ApplicationRecord

	has_secure_password

	def self.confirm(params)
    @member = Member.find_by({email: params[:email]})
    @member ? @member.authenticate(params[:password]) : false
  end

end

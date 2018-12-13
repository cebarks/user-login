require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:email) }
		it { should validate_uniqueness_of(:email) }
	end

	describe "Class Methods" do
		it ".authenticate" do
			name = "anten"
			email = "cebarks@gmail.com"
			password = "turing123"
			User.create!(name: name, email: email, password: password)

			auth_user = User.authenticate(email, password)

			expect(auth_user.email).to eq(email)
			expect(auth_user.password).to eq(password)
			expect(auth_user.name).to eq(name)
		end
	end
end

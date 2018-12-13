require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "I can visit the user registration page" do
    it "I can create a new account" do
      name = 'Anten Skrabec'
      email = "cebarks@gmail.com"
      password = "turing123"

      visit new_user_path

      fill_in 'user[name]', with: name
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password

      click_button 'Submit'

      expect(current_path).to eq(user_path(User.last))

      expect(User.last.name).to eq(name)
      expect(User.last.email).to eq(email)
      expect(User.last.password).to eq(password)

      expect(page).to have_content(name)
      expect(page).to have_content(email)
    end
  end
end

require 'rails_helper'

RSpec.describe "Admin function", type: :request do 
  describe "can access all pages" do 
    it "has access to index page" do 
      admin = User.create!(username: "karanm645", email: "karanm645@gmaill.com", admin: true, password_digest: "my password")
      non_admin = User.create!(username: "non_user", email: "whatisthis@gmail.com", password_digest: "myotherpassword")

      sign_in admin
    end 
  end 
end 
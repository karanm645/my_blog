require 'rails_helper'

RSpec.describe "Destroy Article", type: :feature do 
  describe 'when i visit the index page' do
    it 'can delete the article' do 
      article_1 = Articles.create!(title: "1233", description: "fewafewafawefwaf")
      
      visit articles_path
      expect(page).to have_content("1233")
      click_button "delete"

      expect(page).to_not have_content("1233")
    end 

  end 
end
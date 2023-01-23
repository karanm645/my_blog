require 'rails_helper'

RSpec.describe "Article Show Page", type: :feature do 
  describe "when i visit the articles show page" do 
    
    it "shows the article title and description" do 
      article_1 = Articles.create!(id: 1, title: "My first blog", description: "fewafewfawefawefeawfewaf")
      
      visit articles_path 

      click_link "show"

      visit article_path(1)

      expect(page).to have_content(article_1.description)
    end

    it 'back link to articles index page' do 
      @article_1 = Articles.create(id: 1, title: "second article", description: "ioewajiofnuiewfiopfewahiupewaoijfioweap")

      visit article_path(1)
      click_link "Back"

      expect(current_path).to eq(articles_path)
    end 

    it 'has a link to edit the article' do 
      @article_1 = Articles.create(id: 1, title: "second article", description: "ioewajiofnuiewfiopfewahiupewaoijfioweap")
      
      visit article_path(1)

      click_link "edit"

      visit edit_article_path(1)

      fill_in 'Title', with: "third article"
      fill_in 'Description', with: "zzzfjiewofjieolslslslslslsllssl"
      click_button "update"

      visit articles_path
      expect(current_path).to eq(articles_path)
    end 

  end 
end 
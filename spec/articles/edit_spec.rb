require 'rails_helper'

RSpec.describe 'Edit Article', type: :feature do 
  describe 'when I visit the article show page' do 
    it 'has a link to edit the article' do 
      @article_1 = Articles.create(id: 1, title: "second article", description: "ioewajiofnuiewfiopfewahiupewaoijfioweap")
      
      visit articles_path

      click_link "edit"

      visit edit_article_path(1)

      fill_in 'Title', with: "third article"
      fill_in 'Description', with: "zzzfjiewofjieolslslslslslsllssl"
      click_button "update"

      visit articles_path
      expect(current_path).to eq(articles_path)
    end 

    it 'back link to articles index page' do 
      @article_1 = Articles.create(id: 1, title: "second article", description: "ioewajiofnuiewfiopfewahiupewaoijfioweap")

      visit edit_article_path(1)
      click_link "Back"

      expect(current_path).to eq(articles_path)
    end 
  end 
end 
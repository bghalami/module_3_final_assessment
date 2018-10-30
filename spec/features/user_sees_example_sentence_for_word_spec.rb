require 'rails_helper'

describe "As a guest user" do
  describe "When I visit the home page, enter a word, and hit submit" do
    it "should return examples of that word in a sentence" do

      VCR.use_cassette("visit_root") do
        visit '/'
      end

      fill_in 'Word', with: 'mindfulness'

      VCR.use_cassette("click_submit_from_home") do
        click_on("Submit")
      end
      
      expect(page).to have_content("Examples for using 'mindfulness'")
      expect(page).to have_css('.sentence', count: 3)
      expect(page).to have_content("Region: British")
      expect(page).to have_content("Region: Canadian")
      expect(page).to_not have_content("Region: North American")
    end
  end
end

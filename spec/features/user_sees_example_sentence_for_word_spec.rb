require 'rails_helper'

describe "As a guest user" do
  describe "When I visit the home page, enter a word, and hit submit" do
    it "should return examples of that word in a sentence" do
      # As a guest user (no sign in required)
      # When I visit "/"
      visit '/'
      # And I fill in a text box with "mindfulness"
      fill_in 'Word', with: 'mindfulness'
      # And I click "Submit"
      click("Submit")
      # Then I should see a message that says "Examples for using 'mindfulness'"
      expect()
      # And I should see a list of sentences with examples of how to use the word
      # And I should see only sentences where the region for usage is "Brittish" or "Canadian"
      # And I should not see sentences for any other regions (or blank regions)
    end
  end
end

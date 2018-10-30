require 'rails_helper'

describe "User goes to /api/v1/games/1" do
  it "should return the correct JSON" do
    get '/api/v1/games/1'

    json = {
              "game_id":1,
              "scores": [
                {
                  "user_id":1,
                  "score":15
                },
                {
                  "user_id":2,
                  "score":16
                }
              ]
            }

    expect(page).to have_content(json)
  end
end

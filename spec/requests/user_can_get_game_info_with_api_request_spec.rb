require 'rails_helper'

describe "User goes to /api/v1/games/1" do
  it "should return the correct JSON" do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)

    VCR.use_cassette("get_game_show_api") do
      get '/api/v1/games/1'
    end 

    expect(response.status).to be 200
    returned_game = JSON.parse(response.body, symbolize_names: true)
      expect(returned_game.keys.count).to eq(2)
      expect(returned_game).to have_key(:game_id)
      expect(returned_game).to have_key(:scores)
      expect(returned_game[:scores].first.keys.count).to eq(2)
      expect(returned_game[:scores].first).to have_key(:user_id)
      expect(returned_game[:scores].first).to have_key(:score)
  end
end

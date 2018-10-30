require 'rails_helper'

describe "User goes to /api/v1/games/1/plays with a user_id=1 and word=at" do
  it "should return a 201 and run a get with new info" do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)

    VCR.use_cassette("post_play") do
      post '/api/v1/games/1/plays?user_id=1&word=at'
    end

    expect(response.status).to be 201
    VCR.use_cassette("view_after_posted_play") do
      get '/api/v1/games/1'
    end
    returned_game = JSON.parse(response.body, symbolize_names: true)
    expect(returned_game[:scores][0][:score]).to eq(17)
    expect(returned_game[:scores][1][:score]).to eq(16)
  end
end

module Api
  module V1
    class PlaysController < ApplicationController
      def create
        user = User.find(params[:user_id])
        word = params[:word]
        game = Game.find(params[:game_id])
        user.plays.create(game: game, word: word)
        render json: game, status: 201
      end
    end
  end
end

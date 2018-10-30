module Api
  module V1
    class GamesController < ActionController::API
      def show
        binding.pry
        game =
        render json: game
      end
    end
  end
end

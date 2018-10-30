class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [player_stats(object.player_1),
      player_stats(object.player_2)]
  end

  private

  def player_stats(object_player)
    player = object_player
    {"user_id" => player.id, "score" => total_score(player)}
  end

  def total_score(player)
    players_plays = object.plays.select do |play|
      play.user_id == player.id
    end
    players_plays.sum do |play|
      play.score
    end
  end
end

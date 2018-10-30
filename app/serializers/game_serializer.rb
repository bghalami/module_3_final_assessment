class GameSerializer < ActiveModel::Serializer
  attributes :id, :scores

  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def scores
    [player_1_stats, player_2_stats]
  end

  def player_1_stats
    player = object.player_1
    {"user_id" => player.id, "score" => total_score(player)}
  end

  def total_score(player)
    object.plays.select do |play|
      binding.pry
    end
  end
end

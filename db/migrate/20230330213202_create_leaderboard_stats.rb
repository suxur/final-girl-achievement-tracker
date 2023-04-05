class CreateLeaderboardStats < ActiveRecord::Migration[7.0]
  def change
    create_view :leaderboard_stats
  end
end

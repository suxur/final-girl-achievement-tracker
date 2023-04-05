class LeaderboardController < AuthController
  def show
    @pagy, users = pagy(leaderboard_stats)

    @users =
      GravatarDecorator.decorate_collection(
        TotalProgressDecorator.decorate_collection(users),
      )
  end

  private

  def leaderboard_stats
    @leaderboard_stats ||=
      LeaderboardStat.where("completed_achievements > 0").order(
        completed_achievements: :desc,
      )
  end
end

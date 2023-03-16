class Killer::IndexFacade < IndexFacade
  def collection
    killers.group_by { |k| k.series }
  end

  def killers
    Killer
      .order(:id)
      .map do |killer|
        ProgressCardData.new(
          killer,
          killer.series.name,
          killer.name,
          calculate_progress(killer),
          killer.icon,
        )
      end
  end

  def calculate_progress(killer)
    (
      (
        @user
          .user_killer_achievements
          .completed(killer.achievements)
          .count
          .to_f / killer.achievements.count.to_f
      ) * 100
    ).round.to_i
  end
end

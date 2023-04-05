class Killer::IndexFacade < IndexFacade
  def collection
    killers.group_by { |k| k.series }
  end

  def killers
    Killer.order(:id).map { |killer| progress_card_data(killer) }
  end

  private

  def progress_card_data(killer)
    ProgressCardData.new(
      killer,
      killer.series.name,
      killer.name,
      CalculateProgress.new(
        completed_achievements(killer).count,
        total_achievements(killer).count,
      ).call,
      killer.icon,
    )
  end

  def completed_achievements(killer)
    @user.user_killer_achievements.completed(total_achievements(killer))
  end

  def total_achievements(killer)
    killer.achievements
  end
end

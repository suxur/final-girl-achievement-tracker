class Play::IndexFacade < IndexFacade
  def plays
    scoped_collection
      .includes(:final_girl, :killer, :location)
      .order(created_at: :desc)
  end

  private

  def scoped_collection
    PlayPolicy::Scope.new(user, Play).resolve
  end
end

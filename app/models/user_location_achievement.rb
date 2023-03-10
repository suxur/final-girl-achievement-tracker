class UserLocationAchievement < ApplicationRecord
  belongs_to :user
  belongs_to :location_achievement
  belongs_to :killer, optional: true

  scope :completed,
        ->(ids) { where(location_achievement: ids).where(completed: true) }
  scope :not_completed,
        ->(ids) { where(location_achievement: ids).where(completed: false) }
end

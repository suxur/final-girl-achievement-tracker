class UserKillerAchievement < ApplicationRecord
  belongs_to :user
  belongs_to :killer_achievement
  belongs_to :location, optional: true

  scope :completed,
        ->(ids) { where(killer_achievement: ids).where(completed: true) }
  scope :not_completed,
        ->(ids) { where(killer_achievement: ids).where(completed: false) }
end

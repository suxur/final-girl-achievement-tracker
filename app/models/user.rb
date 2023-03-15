class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :plays

  has_many :user_killer_achievements
  has_many :killer_achievements, through: :user_killer_achievements

  has_many :user_location_achievements
  has_many :location_achievements, through: :user_location_achievements

  accepts_nested_attributes_for :user_killer_achievements
  accepts_nested_attributes_for :user_location_achievements
end

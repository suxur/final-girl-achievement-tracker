class Killer < ApplicationRecord
  belongs_to :series

  has_many :achievements, class_name: "KillerAchievement"

  has_one_attached :logo
  has_one_attached :icon

  def to_param
    slug
  end
end

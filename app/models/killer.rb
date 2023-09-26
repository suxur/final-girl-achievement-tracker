class Killer < ApplicationRecord
  belongs_to :series
  has_many :achievements, class_name: "KillerAchievement"
  has_one_attached :logo
  has_one_attached :icon

  validates :name, presence: true

  def to_param
    slug
  end

  def self.chooseables
    @chooseables ||= all.collect { |record| [record.name, record.id] }
  end
end

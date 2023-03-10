class FinalGirl < ApplicationRecord
  belongs_to :series

  def to_param
    slug
  end
end

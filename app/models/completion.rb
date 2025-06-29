class Completion < ApplicationRecord
  belongs_to :habit
  validates :completed_on, presence: true
  validates :completed_on, uniqueness: { scope: :habit_id }
end

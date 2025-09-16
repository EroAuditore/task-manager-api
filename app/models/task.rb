class Task < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :title, presence: true
  validates :status, inclusion: { in: %w[todo in_progress done] }
end

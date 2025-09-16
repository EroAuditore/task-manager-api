class Board < ApplicationRecord
  belongs_to :user
  has_many :tasks, depedent: :destroy

  validates :title, presence: true
end

class Question < ApplicationRecord
  belongs_to :quiz

  has_many :answers, dependent: :destroy

  validates :title, presence: true

  validates :question_type, presence: true, inclusion: { in: %w[multiple_choice single_choice] }
end

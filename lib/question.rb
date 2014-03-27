class Question < ActiveRecord::Base

  belongs_to :survey
  has_many :answers
  has_many :choices
  has_many :takers, through: :answers
  validates :description, presence: true, length: {maximum: 50, minimum: 2}

  def percentage(choice)
    (choice.answers.length.to_f / self.answers.length.to_f * 100).round(1)
  end
end

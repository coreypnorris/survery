class Taker < ActiveRecord::Base

  has_many :answers
  has_many :responses
  has_many :questions, through: :answers
  validates :name, presence: true, length: {maximum: 50, minimum: 2}
end

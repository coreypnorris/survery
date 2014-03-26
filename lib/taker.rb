class Taker < ActiveRecord::Base

  has_many :answers
  has_many :responses
  has_many :questions, through: :answers
end

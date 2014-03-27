class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  validates :description, presence: true, length: {maximum: 50, minimum: 2}
end

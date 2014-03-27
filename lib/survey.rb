class Survey < ActiveRecord::Base
  has_many :questions
  validates :name, presence: true, length: {maximum: 50, minimum: 2}
end

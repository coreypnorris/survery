require 'spec_helper'

describe Question do
  it { should belong_to :survey }
  it { should have_many :choices }
  it { should have_many :answers }
  it { should have_many :takers }
  it { should validate_presence_of :description }
  it { should ensure_length_of(:description).is_at_most(50) }
  it { should ensure_length_of(:description).is_at_least(2) }

  describe '#percentage' do
    it 'should return the percentage of respondents who chose a specific answer' do
      question = Question.create(description: "question 1", survey_id: 1)
      choices = (1..3).to_a.map { |number| question.choices.create(description: "choice #{number}") }
      answers1 = (1..2).to_a.map { |number| question.answers.create(choice_id: choices[number-1].id) }
      answers2 = (1..3).to_a.map { |number| question.answers.create(choice_id: choices[number-1].id) }
      question.percentage(choices[0]).should eq 40.0
    end
  end
end

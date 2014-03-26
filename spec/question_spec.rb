require 'spec_helper'

describe Question do
  it { should belong_to :survey }
  it { should have_many :choices }
  it { should have_many :answers }
  it { should have_many :takers}

  describe '#percentage' do
    it 'should return the percentage of respondents who chose a specific answer' do
      question = Question.create(description: "question 1", survey_id: 1)
      choices = (1..3).to_a.map { |number| Choice.create(description: "choice #{number}", question_id: question.id) }
      answers1 = (1..2).to_a.map { |number| Answer.create(question_id: question.id, choice_id: choices[number-1].id) }
      answers2 = (1..3).to_a.map { |number| Answer.create(question_id: question.id, choice_id: choices[number-1].id) }
      question.percentage(choices[0]).should eq 40.0
    end
  end
end

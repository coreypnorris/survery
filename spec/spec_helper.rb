require 'active_record'
require 'rspec'
require 'shoulda-matchers'

require 'answer'
require 'choice'
require 'question'
require 'response'
require 'survey'
require 'taker'

database_configuration = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configuration["test"]
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Answer.all.each { |answer| answer.destroy }
    Choice.all.each { |choice| choice.destroy }
    Question.all.each { |question| question.destroy }
    Response.all.each { |response| response.destroy }
    Survey.all.each { |survey| survey.destroy }
    Taker.all.each { |taker| taker.destroy }
  end
end

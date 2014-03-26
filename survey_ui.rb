require 'active_record'
require './lib/answer'
require './lib/choice'
require './lib/question'
require './lib/response'
require './lib/survey'
require './lib/taker'

database_configurations = YAML::load(File.open("./db/config.yml"))
development_configuration = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to the survey program!"
  main_menu
end

def main_menu
  choice = nil
  until choice == 'X'
    puts "press 'D' for design menu"
    puts "press 'T' for taker menu"
    puts "press 'X' to exit the program"

    choice = gets.chomp.upcase
    case choice
    when 'D'
      design_menu
    when 'T'
      taker_menu
    when 'X'
      puts "Thanks for using SurveyMakerPro 60000"
    else
      puts "Invalid input"
    end
  end
end

def design_menu
  choice = nil
  until choice == 'M'
    puts "Press 'S' to create a new survey"
    puts "Press 'VS' to view all surveys"
    puts "Press 'Q' to create and add a question to a survey"
    puts "Press 'VQ' to view all the questions in a particular survey"
    puts "Press 'M' to return to the main menu"

    choice = gets.chomp.upcase
    case choice
    when 'S'
      create_survey
    when 'VS'
      view_surveys
    when 'Q'
      create_question
    when 'VQ'
      view_questions
    when 'M'
      puts "Returning to main menu..."
    else
      puts "Invalid input"
    end
  end
end

def create_survey
  puts "Name your survey:"
  name = gets.chomp
  survey = Survey.create({name: name})
  puts "#{survey.name} ADDED!"
end

def view_surveys
  Survey.all.each_with_index do |survey, index|
    puts "#{index + 1}. #{survey.name}"
  end
end

def create_question
  puts "Which survey would you like to add a question to?"
  view_surveys
  survey_index = gets.chomp.to_i
  survey = Survey.all[survey_index-1]
  puts "Enter the question:"
  description = gets.chomp
  new_question = Question.create({description: description, survey_id: survey.id})
  puts "The question has been added to #{survey.name}"
end

def view_questions
  puts "Which survey's questions would you like to view?"
  view_surveys
  survey_index = gets.chomp.to_i
  survey = Survey.all[survey_index-1]
  Question.where(survey_id: survey.id).each { |i| puts i.description }
end


welcome













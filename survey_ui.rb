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
    puts "Press 'C' to create a new survey"
    puts "Press 'V' to view all surveys"
    puts "Press 'M' to return to the main menu"

    choice = gets.chomp.upcase
    case choice
    when 'C'
      create_survey
    when 'V'
      view_surveys
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






welcome













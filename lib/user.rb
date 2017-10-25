require './lib/joke'
require 'csv'

class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(other_person, joke)
    other_person.learn(joke)
  end

  def perform_routine_for(another_person)
    @jokes.each do |joke|
      another_person.learn(jokes)
    end
  end

  def learn_routine(file = "./jokes.csv")
    file = CSV.foreach file, headers: true, header_converters: :symbol do |row|
    @jokes << Joke.new(row)
    end
  end
end

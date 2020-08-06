require_relative 'cat.rb'
require_relative 'dog.rb'

class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name, species="human")
    @name = name
    @species = species
    @@all<< self
  end
  def say_species
    return "I am a #{@species}."
  end
  def self.all
    @@all
  end
  def self.count
    @@all.length
  end
  def self.reset_all
    @@all = []
  end
  
  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end
  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end
  def buy_cat(cat)
    new_cat = Cat.new(cat, self)
    cats
  end
  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
    dogs
  end
end
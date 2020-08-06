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
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
  def walk_dogs
     self.dogs.each do |dog|
      dog.mood = 'happy'
     end
  end 
  def feed_cats
    self.cats.each do |cat|
      cat.mood = 'happy'
     end
  end
  def sell_pets
    pets_for_sale = self.dogs.concat(self.cats)
    pets_for_sale.each do |animal|
      animal.owner = nil
      animal.mood = 'nervous'
    end
  end
end
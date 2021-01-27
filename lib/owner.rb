require 'pry'

class Owner

  @@all=[]

  attr_reader :name, :species
  attr_accessor :dog, :cat

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count 
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|ow| ow.owner == self}
  end

  def dogs
    Dog.all.select {|ow| ow.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets 
    scared_dogs = self.dogs
  scared_dogs.each do |dog| 
    dog.mood = "nervous"
    dog.owner = nil
  end
  scared_cats = self.cats
  scared_cats.each do |cat|
    cat.mood = "nervous"
    cat.owner = nil
  end
end

def list_pets
  "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
end

end
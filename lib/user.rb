# This class represents a User object with email, age, and name attributes.
class User
  # Getter and setter methods for email, age, and name attributes.
  attr_accessor :email, :age, :name
  # Class variable to keep track of all User objects created.
  @@all_users = []

  # Initializes a User object with email, age, and name attributes.
  def initialize(email, age, name)
    @name = name
    @email = email
    @age = age

    # Adds the User object to the @@all_users array.
    @@all_users << self
  end

  # Returns a random name from a list of names.
  def self.random_name
    %w[Marc Robert Jan].sample
  end

  # Creates a new User object with a random age and email, and the given name.
  def self.create_user(name)
    age = rand(15..35)
    email = 'email@fake.com'
    User.new(email, age, name)
  end

  # Returns the number of User objects created.
  def self.count
    @@all_users.size
  end

  # Returns an array of all User objects created.
  def self.all
    @@all_users
  end

  # Returns a string representation of the User object.
  def to_s
    "#{name}, #{age}, #{email}"
  end
end

# Creates three User objects with random names and adds them to the @@all_users array.
user1 = User.create_user(User.random_name)
user2 = User.create_user(User.random_name)
user3 = User.create_user(User.random_name)

# Prints the array of all User objects created.
puts User.all

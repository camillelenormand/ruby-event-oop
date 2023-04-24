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

  def self.random_email
    %w[fake@domain.com fake2@domain.com fake3@domain.com].sample
  end

  # Creates a new User object with a random age and email, and the given name.
  def self.create_user(name, email)
    age = rand(15..35)
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

  def self.find_by_email(email)
    @@all_users.find{ 
      |user| user.email == email 
    }
  end

  # Returns a string representation of the User object.
  def to_s
  "
  ----------------------------
    Name:#{name}
    Age #{age}
    Email:#{email}
  "
  end
end

# Creates three User objects with random names and adds them to the @@all_users array.
user1 = User.create_user(User.random_name, User.random_email)
user2 = User.create_user(User.random_name, User.random_email)
user3 = User.create_user(User.random_name, User.random_email)

# Prints the array of all User objects created.
puts User.all

# Finds a User object by email and prints the related user's name.
if user = User.find_by_email("fake3@domain.com")
  puts "Email found! The related user is: #{user.name}"
end
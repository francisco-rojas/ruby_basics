class MyClass

  # defines a class method called first_method using self
  def self.first_method
    # self here is the class MyClass
    "called first_method on the #{self.name} class"
  end

  # defines a class method called second_method using the class's name
  def MyClass.second_method
    "called second_method on the #{self.name} class"
  end

  # defines an instance method in the MyClass class's metaclass or singleton class
  # such method ends up being a class method of the class MyClass
  # Remember: class methods are just Singleton Methods that live in the class’s singleton class
  class << self
    def third_method
      "called third_method on the #{self.name} class"
    end
  end


  # defines an instance method called first_method
  def first_method
    # self here is an instance of the MyClass class
    "called first_method on an instance of the #{self.class.name} class"
  end
end
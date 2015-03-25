class MyClass
  @@my_class_var = 'a class variable'
  @my_class_instance_var = 'a class instance variable'

  # defines a class method that returns @@my_class_var
  def self.my_class_var
    @@my_class_var
  end

  # defines an instance method that returns @@my_class_var
  def my_class_var
    @@my_class_var
  end

  # defines a class method that returns @my_class_instance_var
  def self.my_class_instance_var
    @my_class_instance_var
  end

  # defines an instance method that returns @my_class_instance_var
  # however this variable is not really the class instance variable defined above
  # because this is an instance method the @my_class_instance_var is an instance variable
  # not a class instance variable
  def my_class_instance_var
    @my_class_instance_var
  end

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
  # Note: instance method names don't clash with class methods names
  def first_method
    # self here is an instance of the MyClass class
    "called first_method on an instance of the #{self.class.name} class"
  end
end
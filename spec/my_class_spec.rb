require 'spec_helper'

describe MyClass do
  it 'all classes in ruby implicitly inherit from the Object class' do
    MyClass.ancestors.must_include Object
  end

  describe 'class methods' do
    it 'calls first_method' do
      MyClass.first_method.must_equal 'called first_method on the MyClass class'
    end

    it 'calls second_method' do
      MyClass.second_method.must_equal 'called second_method on the MyClass class'
    end

    it 'calls third_method' do
      MyClass.third_method.must_equal 'called third_method on the MyClass class'
    end
  end

  describe 'instance methods' do
    it 'calls first_method' do
      MyClass.new.first_method.must_equal 'called first_method on an instance of the MyClass class'
    end

    it 'defines an instance method on the fly' do
      obj = MyClass.new
      # defines an instance method called second_method ONLY for the obj instance
      def obj.second_method
        "called second_method on an instance of the #{self.class.name} class"
      end

      obj.second_method.must_equal 'called second_method on an instance of the MyClass class'
    end

    it 'calls first_method on any instance of the MyClass class' do
      MyClass.new.first_method.must_equal 'called first_method on an instance of the MyClass class'
      MyClass.new.first_method.must_equal 'called first_method on an instance of the MyClass class'
    end

    it 'cannot call second_method on any instance of the MyClass class' do
      obj = MyClass.new
      def obj.second_method
        "called second_method on an instance of the #{self.class.name} class"
      end

      obj.second_method.must_equal 'called second_method on an instance of the MyClass class'
      -> { MyClass.new.second_method }.must_raise NoMethodError
    end
  end

  describe 'class variables & class instance variables' do
    it 'accesses the MyClass class variables' do
      MyClass.my_class_var.must_equal 'a class variable'
      MyClass.new.my_class_var.must_equal 'a class variable'
      MyClass.new.my_class_var.must_equal 'a class variable'
    end

    it 'accesses the MyClass class instance variables' do
      MyClass.my_class_instance_var.must_equal 'a class instance variable'
    end

    it 'lists the MyClass class variables' do
      MyClass.class_variables.must_equal [:@@my_class_var]
    end

    it 'lists the MyClass class variables' do
      MyClass.instance_variables.must_equal [:@my_class_instance_var]
    end

    it 'does not retrieve the value of the MyClass instance variable' do
      MyClass.new.my_class_instance_var.must_equal nil
    end
  end
end
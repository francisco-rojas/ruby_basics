require 'spec_helper'

describe MyClass do
  it 'inherits from Object class' do
    MyClass.ancestors.must_include MyClass
  end
end
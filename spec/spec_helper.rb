require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
Dir.glob('./lib/**/*.rb').each { |file| require file }
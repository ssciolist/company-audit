require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
require 'pry'
SimpleCov.start do
  add_filter '/test/'
end

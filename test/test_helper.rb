ENV["RAILS_ENV"] = "test"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'before_render'

require 'minitest/autorun'

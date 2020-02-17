# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'
$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'before_render'

require 'minitest/autorun'

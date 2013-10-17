require 'bundler/setup'
Bundler.require

require 'minitest/autorun'
require 'webmock/minitest'
require 'minitest/pride'
Minitest::PrideIO.pride!

class TestCase < Minitest::Test

end

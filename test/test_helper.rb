require 'bundler/setup'
Bundler.require

require 'minitest/autorun'
require 'webmock/minitest'

# colorize test output
require 'minitest/pride'
Minitest::PrideIO.pride!

# requiring helpers
Dir[ File.join( File.dirname(__FILE__), "helpers/*.rb")].each { |file| require file }

class TestCase < Minitest::Test

  include ConfigurationHelper
  include FixturesHelper

end

ENV["RAILS_ENV"] = "test"
require 'rubygems'
require 'spec'

$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__), '../lib')

require 'simple-pages'

# Spec::Runner.configure do |config|
  # no special config
# endx
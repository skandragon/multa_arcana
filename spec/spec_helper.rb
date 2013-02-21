require 'rubygems'
require 'bundler/setup'
require 'rspec/autorun'

require 'multa_arcana'

RSpec.configure do |config|
  config.backtrace_clean_patterns = [
    #/\/lib\d*\/ruby\//,
    #/bin\//,
    #/gems/,
    #/spec\/spec_helper\.rb/,
    /lib\/rspec\/(core|expectations|matchers|mocks)/
  ]
end

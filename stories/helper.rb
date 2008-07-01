$LOAD_PATH.unshift File.expand_path("#{File.dirname(__FILE__)}/../lib")
require 'rubygems'
require 'skating_system'
require 'ruby-debug'
require 'spec'
require 'spec/story'
require File.join(File.dirname(__FILE__), *%w[resources steps scrutineering_a_final_performance])

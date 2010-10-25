require File.dirname(__FILE__)+ '/../lib/SOMETHING'
require './SOMETHING'
require './screen_util.rb'
require 'yaml'

yml = YAML::load(File.open('./world.yml'))

#bot_email_address = yml['bot_email_address']

#pitch = Pitch.new
ScreenUtil.clear
STDOUT.flush
RESULT = gets.chomp


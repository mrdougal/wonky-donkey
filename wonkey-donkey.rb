#!/usr/bin/env ruby
require 'yaml'

class WonkeyDonkey
  
  attr_accessor :attributes, :read, :listen
  
  def initialize args = {}
    
    @read   = args[:read] || true
    @listen = args[:listen] || false
    
    @attributes = File.open('attributes.yml') { |file| YAML.load(file) }
  end
  
  def output val
    puts "#{val} \n" if read?
    say val if listen?
  end

  def verse val
    @verse ||= []
    @verse.insert 0, val
    val
  end

  def chorus val
    @chorus ||= []
    @chorus.insert 0, val
  end
  
  def read?
    @read
  end
  
  def listen?
    @listen
  end
  
  def say val
    system 'say', val
  end
  
  def story
    
    attributes.each do |key, value|
  
      output "i was walking down the road and i saw..."
      output "A DONKEY"
      output "Hee Haw!\n"
  
      output "He #{@verse.join ', '}" if @verse
      output "and #{verse(key)}"

      output "He was a #{chorus(value).join ' '} donkey."
  
    end

    output 'Hee Haw!'
  end
  
  class << self
    
    def read
      self.new.story
    end
    
    def listen
      self.new(:listen => true).story
    end
    
  end
  
end


# WonkeyDonkey.read
WonkeyDonkey.listen


#!/usr/bin/env ruby
require 'rubygems'
require 'daemons'

class MyDaemon

  def initialize
  end

  def dostuff
  	puts "processing now"
    Feed.process_background
  end
end

dir = File.expand_path(File.join(File.dirname(__FILE__), '..'))

daemon_options = {
  :multiple   => false,
  :dir_mode   => :normal,
  :dir        => File.join(dir, 'tmp', 'pids'),
  :backtrace  => true
}

Daemons.run_proc('my-daemon', daemon_options) do
  if ARGV.include?('--')
    ARGV.slice! 0..ARGV.index('--')
  else
    ARGV.clear
  end

  Dir.chdir dir

  require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))
  MyDaemon.new.dostuff
end
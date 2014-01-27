require 'thor'
require 'badger'

module Badger
  class CLI < Thor
    desc 'badge', 'Generate default badge markdown'
    option :not
    option :only

    def badge dir = '.'
      f = File.open '/tmp/wtf', 'w'
      f.write options

      @badger = Badger.new Git.open(dir).remote.url
      @badger.remove options[:not].split(',') if options[:not]
      @badger.only options[:only].split(',') if options[:only]

      puts @badger.to_s
    end

    default_task :badge
  end
end
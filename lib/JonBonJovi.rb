%w(eventmachine sinatra/base haml launchy).each{|x| require x}
%w(version webapp).each{|x| require "JonBonJovi/#{x}"}

module JonBonJovi
  extend self
  def run

    Thread.abort_on_exception = true
    trap('INT'){ puts "\rBye!"; exit }
    
    EM.run do
      Thread.start do
        WebApp.run
      end
    end

  end
end

module JonBonJovi

  module WebApp
    extend self

    def run
      ::Rack::Handler::WEBrick.run(
        Server.new,
        :Port => JonBonJovi::PORT,
        :Logger => ::WEBrick::Log.new('/dev/null'),
        :AccessLog => [nil,nil],
        :StartCallback => proc{ WebApp.open }
      )
    end

    def open
      ::Launchy.open("http://localhost:#{JonBonJovi::PORT}/")
    end

    class Server < ::Sinatra::Base
      get "/" do
        haml :index
      end
    end

  end
end


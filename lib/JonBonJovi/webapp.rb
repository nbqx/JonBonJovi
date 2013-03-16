module JonBonJovi

  module WebApp
    extend self

    def free_port
      port = 3331
      until `lsof -i:#{port}`.empty?
        port += 1
      end
      port
    end

    def run
      @port = WebApp.free_port

      ::Rack::Handler::WEBrick.run(
        Server.new,
        :Port => @port,
        :Logger => ::WEBrick::Log.new('/dev/null'),
        :AccessLog => [nil,nil],
        :StartCallback => proc{ WebApp.open }
      )
    end

    def open
      ::Launchy.open("http://localhost:#{@port}/")
    end

    class Server < ::Sinatra::Base
      get "/" do
        haml :index
      end
    end

  end
end


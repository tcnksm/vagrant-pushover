require "net/https"

module VagrantPlugins
  module Pushover
    class Action
      
      def initialize(app,env)
        @app = app
      end
      
      def call(env)        
        @app.call(env)
        config = env[:machine].config.pushover
        nortification config if config.execute
      end 
      
      def nortification config
        url = URI.parse("https://api.pushover.net/1/messages.json")
        req = Net::HTTP::Post.new(url.path)
        req.set_form_data({
                            token:     config.token,
                            user:      config.user, 
                            message:   config.message,
                            title:     config.title,
                            device:    config.device,
                            url:       config.url,      
                            url_title: config.url_title,
                            priority:  config.priority, 
                            timestamp: config.timestamp,
                            sound:     config.sound,    
                          })
        res = Net::HTTP.new(url.host, url.port)
        res.use_ssl = true
        res.verify_mode = OpenSSL::SSL::VERIFY_PEER
        res.start {|http| http.request(req)}
        puts "send notification"
      end
    end
  end
end


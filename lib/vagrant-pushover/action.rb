require "net/https"

module VagrantPlugins
  module Pushover
    class Action
      
      def initialize(app,env)
        @app     = app
        @ui      = env[:ui]
        @machine = env[:machine].name.to_s
      end
      
      def call(env)
        # Before machine action
        state  = env[:machine].state.id
        
        # Execute machine action
        @app.call(env)

        # After execute machine action
        config    = env[:machine].config.pushover
        action    = env[:machine_action]
        provision = env[:provision_enabled]
        
        case action
        when :up
          nortification config if state != :running && provision && config.execute
        when :reload          
          nortification config if provision && config.execute
        when :provision
          nortification config if config.execute
        end
      end
      
      def nortification config
        message = "[#{@machine}] " + config.message
        url = URI.parse("https://api.pushover.net/1/messages.json")
        req = Net::HTTP::Post.new(url.path)        
        req.set_form_data({
                            token:     config.token,
                            user:      config.user, 
                            message:   message,
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
        status = res.start {|http| http.request(req)}.message
        
        if status == "OK"
          @ui.info  "Send push notification."
        else
          @ui.error "Send push notification is failed. Parameter is wrong."
        end
        
      end
    end
  end
end


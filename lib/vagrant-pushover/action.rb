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
          notification config if state != :running && provision && config.execute
        when :reload          
          notification config if provision && config.execute
        when :provision
          notification config if config.execute
        end
      end
      
      def notification(config)
        params = {
          token:     config.token,
          user:      config.user,
          message:   "[#{@machine}] #{config.message}",
          title:     config.title,
          device:    config.device,
          url:       config.url,
          url_title: config.url_title,
          priority:  config.priority,
          timestamp: config.timestamp,
          sound:     config.sound,
        }
        res = Net::HTTP.post_form(URI.parse("https://api.pushover.net/1/messages.json"), params)

        if res.message == "OK"
          @ui.info  "Send pushover notification."
        else
          @ui.error "Send pushover notification is failed. Parameter is wrong."
        end
      end
    end
  end
end


require "net/https"

module VagrantPlugins
  module Pushover
    class Command < Vagrant.plugin("2", :command)

      def execute
        config_file = ::VagrantPlugins::Pushover.config_file
        if config_file.exist?
          @env.ui.info("Vagrant-pushover configuration file (.vagrant/pushover.rb) is already exist. Edit it and set your app token and your key.")
        else
          ::VagrantPlugins::Pushover.write_default_key
          @env.ui.info("Generated vagrant-pushover configuration file (.vagrant/pushover.rb). Edit it and set your app token and your key.")
        end
      end  
    end          
  end
end        

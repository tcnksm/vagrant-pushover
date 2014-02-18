begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant pushover plugin must be run within Vagrant."
end

module VagrantPlugins
  module Pushover

    class Plugin < Vagrant.plugin("2")
      name "Pushover"
      description <<-DESC
      This plugin add a pushover notification to your vagrant command.
      This notificates `up` or `provision` is over.
      DESC

      action_hook("pushover_hook", :machine_action_up) do |hook|
        require_relative "action"
        hook.prepend(Action)
      end

      action_hook("pushover_hook", :machine_action_provision) do |hook|
        require_relative "action"
        hook.prepend(Action)
      end

      action_hook("pushover_hook", :machine_action_reload) do |hook|
        require_relative "action"
        hook.prepend(Action)
      end

      config(:pushover) do
        require_relative "config"
        Config
      end
    end
  end
end

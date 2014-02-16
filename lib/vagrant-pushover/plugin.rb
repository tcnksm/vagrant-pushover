begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant pushover plugin must be run within Vagrant."
end

module VagrantPlugins
  module Pushover
    name "pushover"
    description <<-DESC
    This plugin add a pushover notification to your vagrant command.
    This notificates `up` or `provision` is over.
    DESC
  end
end

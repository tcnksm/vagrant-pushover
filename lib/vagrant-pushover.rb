require "pathname"
require "vagrant-pushover/version"
require "vagrant-pushover/plugin"

module VagrantPlugins
  module Pushover

    def self.config_file
      called_root.join(".vagrant/pushover.rb")
    end

    def self.called_root
      Pathname.pwd
    end

    def self.write_default_key
      content = <<-EOF
module PushoverConfig
  TOKEN = "YOUR APP TOKEN"
  USER  = "YOUR USER KEY"
end
EOF
      File.open(config_file,'w') do |f|
        f.puts content
      end
    end

  end
end

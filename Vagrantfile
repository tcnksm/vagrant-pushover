Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provision :shell, inline: "echo Hello, world"  

  # Vagrant-pushover plugin configure example
  # 1) Execute `vagrant pushover-init` and generate .vagrant/pushover.rb.
  # 2) Edit it and set your application token and user key.
  # 3) Read it with below configuration.
  config.pushover.read_key
  
  # You can set another parameter like this
  # See more parameter, https://pushover.net/api
  config.pushover.set do |p|
     p.priority  = 1
     p.message   = "Provisioning is over. Back to your seat."
  end
end

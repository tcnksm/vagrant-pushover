Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provision :shell, inline: "echo Hello, world"  

  # Vagrant-pushover plugin configure example
  # See more parameter, https://pushover.net/api
  config.pushover.set do |p|
    p.token     = "************"
    p.user      = "************"
    p.priority  = 1
    p.message   = "Provisioning is over. Back to your seat."
  end
end

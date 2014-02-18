# Vagrant Pushover

This is a [Vagrant](http://www.vagrantup.com/) plugin that add [pushover](https://pushover.net/api) notification function to your Vagrant, allowing Vagrant to push noticate your iOS/Androind. If your provisioning takes too much time, use this plugin and go out to have good :coffee:, you can know when you should go back your seat.

![](https://raw.github.com/tcnksm/vagrant-pushover/master/images/sample.png)

## Requirement

- Pushover App
    - [iOS](https://itunes.apple.com/us/app/pushover-notifications/id506088175?ls=1&mt=8https://itunes.apple.com/us/app/pushover-notifications/id506088175?ls=1&mt=8)
    - [Android](https://play.google.com/store/apps/details?id=net.superblock.pushover&ts=1392735420)
- User key of pushover App
    - You can get it from your [dashboard](https://pushover.net)
- Application token of pushover App
    - You can get it after [registering your application](https://pushover.net/apps/build)

## Installation

Install it as a Vagrant plugin. 

```bash
$ vagrant plugin install vagrant-pushover
```

## Usage

Add configuration in your Vagrantfile. You must set `token` and `user`. 

```ruby
Vagrant.configure("2") do |config|
    config.pushover.set do |p|
        p.token     = "YOUR APP TOKEN"
        p.user      = "YOUR KEY"
    end
end
```

Nofication is not send unless add this configuration. You can set other parameters here, check pushover API documentation [here](https://pushover.net/api). 

## When notification is sent

Notification is sent in below cases.

- `vagrant up`
    - When machine is not yet provisioned.
    - Current machine state is not running.
- `vagrant up --provision`
- `vagrant reload --provision`
- `vagrant provision`


## Contributing

1. Fork it ( http://github.com/<my-github-username>/vagrant-pushover/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

[tcnksm](https://twitter.com/deeeet)

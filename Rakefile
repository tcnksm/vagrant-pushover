require "vagrant-pushover"
require "bundler/gem_tasks"

version = VagrantPlugins::Pushover::VERSION

desc "Install your plugin to your system vagrant."
task :install_plugin do
  system("git add -u")
  Rake::Task[:build].execute
  system("/usr/bin/vagrant plugin install pkg/vagrant-pushover-#{version}.gem")
end

task :uninstall_plugin do
  system("/usr/bin/vagrant plugin uninstall vagrant-pushover")
end

# alias
task :i => :install_plugin
task :u => :uninstall_plugin


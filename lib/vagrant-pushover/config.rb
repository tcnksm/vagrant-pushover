require "net/https"

module VagrantPlugins
  module Pushover
    class Config < Vagrant.plugin("2", :config)

      attr_accessor :execute
      
      # API parameters
      # See more details, https://pushover.net/api
      attr_accessor :token    
      attr_accessor :user     
      attr_accessor :message  
      attr_accessor :device   
      attr_accessor :title    
      attr_accessor :url      
      attr_accessor :url_title
      attr_accessor :priority 
      attr_accessor :timestamp
      attr_accessor :sound

      def initialize
        super
        @execute   = false
        @token     = UNSET_VALUE
        @user      = UNSET_VALUE
        @message   = UNSET_VALUE
        @device    = UNSET_VALUE
        @title     = UNSET_VALUE
        @url       = UNSET_VALUE
        @url_title = UNSET_VALUE
        @priority  = UNSET_VALUE
        @timestamp = UNSET_VALUE
        @sound     = UNSET_VALUE        
      end

      def set
        yield self if block_given?
      end
      
      def validate(machine)
        errors = []
        errors << "Your application's API token must be set."            if @execute && !@token
        errors << "The user/group key must be set."                      if @execute && !@user
        errors << "You don't need Emergency priority(2) in this plugin." if @execute && @priority == 2
        errors << "Priority must be set {-1,0,1}."                       if @execute && ( not [-1,0,1].include?(@priority))
        
        errors << "See more details, https://pushover.net/api" if errors.any?
        {pushover: errors}
      end

      def attributes
        [ @title, @message, @token, @user, @device, @url, @url_title, @priority, @timestamp, @sound ]
      end

      def execute?
        attributes.each do |attribute|
          return true if attribute != UNSET_VALUE
        end
        false
      end

      def finalize!
        @execute   = true                    if execute?
        @title     = "Vagrant pushover"      if @title     == UNSET_VALUE
        @message   = "Provisioning is over." if @message   == UNSET_VALUE
        @token     = nil                     if @token     == UNSET_VALUE
        @user      = nil                     if @user      == UNSET_VALUE        
        @device    = nil                     if @device    == UNSET_VALUE        
        @url       = nil                     if @url       == UNSET_VALUE
        @url_title = nil                     if @url_title == UNSET_VALUE
        @priority  = 0                       if @priority  == UNSET_VALUE
        @timestamp = nil                     if @timestamp == UNSET_VALUE
        @sound     = nil                     if @sound     == UNSET_VALUE        
      end
    end
    
  end
end
        

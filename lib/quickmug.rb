require 'quickmug/version'

require 'rubygems'
require 'oauth'
require 'safe_yaml'
require 'ruby-smugmug'
require 'clipboard'

require 'quickmug/upload'
require 'quickmug/format'

module Quickmug
  def self.config
    @@config ||= YAML.safe_load_file(File.expand_path("~/.quickmug"))
  end

  def self.client
    @@client ||= SmugMug::Client.new(:api_key => config['consumer']['key'],
                                     :oauth_secret => config['consumer']['secret'],
                                     :user => {
                                       :token => config['access']['token'],
                                       :secret => config['access']['secret']})
  end
end

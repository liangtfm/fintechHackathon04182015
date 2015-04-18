require "#{Rails.root}/lib/alchemy"
require "#{Rails.root}/lib/keywords"
require 'net/http'
require 'uri'
require 'json'

module Analyze
  @@alchemyapi = AlchemyAPI.new()

  def initialize
  end

  def self.brand_affinity(taxonomy)
    response = ['emtpy']
    # find match btwn taxonomy & brand category
    Keywords.brand.each do |brand|

    end

    response
  end

  def self.risk_affinity(text)
    @@alchemyapi.taxonomy('text', text)
    # return highest matched category (risk,safety)
  end

end

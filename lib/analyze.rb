require "#{Rails.root}/lib/alchemy"
require 'net/http'
require 'uri'
require 'json'

module Analyze
  def initialize

  end

  def self.brand_affinity(keywords, text)
    @alchemyapi = AlchemyAPI.new()
    # return highest matched brands
  end

  def self.risk_affinity(keywords, text)
    @alchemyapi = AlchemyAPI.new()
    response = []

    keywords[:risk].each do |keyword|
      response.push(@alchemyapi.sentiment_targeted('text', text, keyword))
    end

    keywords[:neutral].each do |keyword|
      response.push(@alchemyapi.sentiment_targeted('text', text, keyword))
    end

    keywords[:security].each do |keyword|
      response.push(@alchemyapi.sentiment_targeted('text', text, keyword))
    end

    return response
    # return highest matched category (risk,safety)
  end

end

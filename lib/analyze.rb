require "#{Rails.root}/lib/alchemy"
require 'net/http'
require 'uri'
require 'json'

module Analyze
  def initialize

  end

  def brand_affinity
    @alchemyapi = AlchemyAPI.new()
    text    = "Looking forward to my 3rd #hackathon and 2nd one with @CoreyLeveen. Representing @GAGrads #fintech http://t.co/rmnbLz2QHa
Thank you @joyent. I just can't remember all the different Linux package managers. So many flavors https://t.co/5jkFdXmpNU #devlife
Coachella isn't really my thing but I love the #fashion side of it. The H&M collection is pretty sweet & smart http://t.co/Lk0vxiK4Lg
Living in a fifth-floor walkup is like getting a free elliptical machine - no gym membership needed #nyc #winning
Anticipating five great presentations at @NYVM #nyvmtff #video #meetup"
    keyword = 'linux'
    response = @alchemyapi.sentiment_targeted('text', text, keyword)
    {
      keyword: keyword,
      #text: text,
      match: response
    }
  end

  def self.risk_affinity
  end

end

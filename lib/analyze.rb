module Analyze
  include AlchemyAPI

  def initialize
    @alchemyapi = AlchemyAPI.new
  end

  def brand_affinity
    text    = "Looking forward to my 3rd #hackathon and 2nd one with @CoreyLeveen. Representing @GAGrads #fintech http://t.co/rmnbLz2QHa
Thank you @joyent. I just can't remember all the different Linux package managers. So many flavors https://t.co/5jkFdXmpNU #devlife
Coachella isn't really my thing but I love the #fashion side of it. The H&M collection is pretty sweet & smart http://t.co/Lk0vxiK4Lg
Living in a fifth-floor walkup is like getting a free elliptical machine - no gym membership needed #nyc #winning
Anticipating five great presentations at @NYVM #nyvmtff #video #meetup"
    keyword = 'apple'
    response = @alchemyapi.sentiment_targeted('text', demo_text, keyword)
    puts response
  end

  def risk_affinity
  end

end

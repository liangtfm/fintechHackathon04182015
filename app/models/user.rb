require "#{Rails.root}/lib/analyze"
require "#{Rails.root}/lib/keywords"

class User
  include MongoMapper::Document
  key :name, String
  key :nickname, String
  key :provider, String
  key :uid, String

  many :tweets

  @@client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = ENV['TWITTER_KEY']
	  config.consumer_secret     = ENV['TWITTER_SECRET']
	  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
	  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
	end

  def initialize
  end

  def analyze
    text = "Anticipating five great presentations at @NYVM #nyvmtff #video #meetup
Looking forward to my 3rd #hackathon and 2nd one with @CoreyLeveen. Representing @GAGrads #fintech http://t.co/rmnbLz2QHa
Living in a fifth-floor walkup is like getting a free elliptical machine - no gym membership needed #nyc #winning
Thank you @joyent. I just can't remember all the different Linux package managers. So many flavors https://t.co/5jkFdXmpNU #devlife
Coachella isn't really my thing but I love the #fashion side of it. The H&amp;M collection is pretty sweet &amp; smart http://t.co/Lk0vxiK4Lg
Accidentally creepy func names: childrenToHide = [], findChildrenTohide = function() {}, hideChildren = function() {} #JavaScript #DevLife
The best #parody award goes to..... Sesame Street https://t.co/02X1zOZfXX #houseofbricks #HouseOfCards
The only thing worse than looking for an apartment in NYC is looking an apartment when there's snow storm &amp; slush every day #snowpocalypse
Was charged $11.57 by #tmobile for THREE minutes of international talk without being warned. Post-paid plans are such a #ripoff
How Fifty Shades of Grey could have been a less boring movie http://t.co/mpFzbAd369
The struggle is real. Cookie really inspires women to be strong and strive for what they deserve #Empire
Pretty much obsessed over the addictive beats of Oliver Heldens' Koala http://t.co/fugKkr1W7E #edm #electrohouse
Came across @jeanjailonline #dresses on Pinterest and cannot wait to place an order! #fashion
Getting extremely nostalgic with Mike Mago's remix of The Nights http://t.co/0J4Kt8Q2UT #avicii #progressivehouse
\"I don't listen to deep house, man, it's too deep. Progressive is where it's at in 2015\" #edmhipster #EDM
How to deploy a Rails app and not destroy your production database http://t.co/gb2OvwHR3j #Rails #webdev
Is it me or is One Direction facial hair situation extremely awkward #SNL
It's tough to do rom-coms right - #ManhattanLoveStory http://t.co/meAHfdQHYX #romcom
Oh the joy of serving static assets! #Rails #webdev
Thanks @codrops for the comprehensive guide to modal and overlay http://t.co/l28E1Q6HzR #webdev #frontend
Wonder why @Pinterest hides the pin button at the bottom of the page, where I look at or click.@Indiegogo
RT @shitWDIerssay: You know something is not right when you have to write \"!important\" on 95% of your CSS lines. #webdev
#EDM T-shirts be selling like hot cakes http://t.co/S7Yp2scPpw #redbubble
@AskingFriend Probably. I have come to the office at 9:30 am and found a big bowl of recently microwaved popcorn
Haunting article. No one can be paid enough for a job that involves looking into darkest corners of the Internet http://t.co/FN0HuEE0TP
RT @dariocravero: #railsrumble featured @padrinorb screencasts :) http://t.co/PEld0V2M0A Thanks @coffeepunk and @_Myfashionhub for the effo…
Would anyone like to team up with me for #railsrumble? @coffeepunk @nerdbabe @superscott3000
@pivotallabs Pretty dope selection of beverages, makes for a good first time to the NYC.rb meetup #ruby
Thank you for clarifying the z-index phenomenon. W3C really oversimplifies it http://t.co/Ix5T4RXPDe
@HowToGetAwayABC is a deliciously wicked show #addicted
Having a bad case of TWW - @TomorrowWorld Withdrawal #edm
Despite the sea of talented artists at #TomorrowWorld I'm still really glad to see @Vicetone #edm
What can possibly trigger checkboxes to be selected even though ng-model value is still false? #angularjs #webdev
Coming at the gitastrophe head on with an interactive rebase #git #devlife
RT @BenKarl: That feeling when you namespace your scripts and not a single thing breaks. HNNGGG
Great to see @wochitTwit demo for the first time and @ziggeoinc demo again last night at NY video meetup #nyvm
Dear @Meetup, wouldn't it be so much nicer if we can edit email preferences for all our groups in one place? Sincerely, impatient
@LinkedIn Please stop the gratuitous number of sponsored posts on the LinkedIn app news feed. Really??
@johntrandall You know you're a lawyer when you have a five-page CV
Willing myself through my first #angularjs app. Thanks @toptalllc for the tutorial http://t.co/BjDcouYYWs
Rooting for Elizabeth to win the #masterchef home cook competition next week
There are more people in the bathroom line at Starbucks than the patrons in the rest of the shop #firstworldproblems
@tangowithdjango Your user authentication tutorial saves me so much time and headache. Thank you! http://t.co/K9DhvqMQ2j #python #django
#Ezoo Sunday lineup is so good. What a waste! #alesso #bingoplayers #dashberlin #deorro
At some point we decided that the heinous combination of Loud/Dark/Crowded was the optimal nightlife atmosphere http://t.co/ZAXgulCokx #bars
Today I learned a new word: trans menagerie https://t.co/zPuEbUgIFE #design #branding
@MASTERCHEFonFOX Top 10 was shot in my college town. Couldn't believe it #thousandoaks
The absolute beginner's guide to setting up Capybara/RSpec http://t.co/wPHy4JEmPr #ruby #webdev
RT @shitWDIerssay: [Instructor] If you don't know what happens when you do \"rails g model\", I am going to rm -rf your project!
#D3js hurts my brain
A trip to the mall in Pittsburgh re-ignited my love for @PacSun #stylecrush
My day hacking Google QPX Express airfare API http://t.co/JwYqI8bXMd
Feels good to be filling out my @ga alumni profile http://t.co/dMYXpsUWpj #webdev #bootcamp
Great late dinner spot in Union Sq (at @VapianoNyc w/ 4 others) https://t.co/pJ7QhaldNH
Officially a @GA WDI alum! Time to divide and conquer @CoreyLeveen @BenKarl @Diiimmmaaa @TimHannes
How programming has changed my life.... so far http://t.co/I4QN5S3r7v #tech #webdev

Hired will help NYC-based developers bypass recruiters in their #jobsearch http://t.co/bAWVFqrqVJ
Example of bad #emailmarketing: The disclaimer is longer than the main content itself http://t.co/YSSzD4Gl51 @Chase
In love with Anna Kendrick dress but not so much with the opening musical number #SNL
Thatz Not Okay is my latest favorite humor column. @caityweaver is a hilarious woman http://t.co/8eR20TxK4F
Exploitative unpaid #internships: Are they just the result of free market or perpetuated by the greedy rich http://t.co/eraBxL22LP
One of my favorite #ecommerce companies - NastyGal - featured on Fast Company http://t.co/AauiXVD7Bf #fashion
Matthew Koma on #ULTRALIVE stage!! (Live streaming.....)
Super quirky @Snapchat iPhone case http://t.co/k81U2X0m52 #snapchat
Is it any less real w. we fall in love &amp; break up over Gchat than w. we get fired over email/find a job on LinkedIn? http://t.co/sbiftVfkbF
How to avoid the pitfalls of A/B testing. Great infographic by @qubitgroup http://t.co/1HXqLAqxp9 #marketing
45 quick and easy #resume tips from @dailymuse http://t.co/OaUJ8hOC59 #career
Bike messenger trying to spit at cab driver for cutting him off. Just a typical occurrence during #nyc lunch time... #roadrage
94% #college students borrow a median $33K AND have trouble finding jobs that pay enough to afford their #debts http://t.co/n6Ou8QJCLY
Tribute to Michael Jordan http://t.co/LOujCwMtfO #hiphop"
    #text = User.social_content(params[:id])
    taxonomy = Analyze.risk_affinity(text)
    brand_affinity = Analyze.brand_affinity(taxonomy)
    { brand_affinity: brand_affinity }
  end

  def social_content
    tweets = []
    Tweet.where(user_id: id.to_s).each do |tweet|
      tweets.push(tweet.content)
    end
    return tweets
  end

	def get_tweets(user_id)
		tweet_array = @@client.user_timeline(self.nickname, {count: 100})
    tweet_array.each do |tweet|
      Tweet.create(content: tweet.text, user_id: user_id)
    end
    # returns an array of Tweet objects. Tweet.text returns the message.
	end

  def self.create_with_omniauth(auth)
    user = User.new
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
      user.name = auth['info']['name'] || ""
      user.nickname = auth['info']['nickname'] || ""
    end
    user.save!
    user
  end

  def user_params
    params.require(:user).permit(:name)
  end

end

module Keywords
  # def self.risk
  #   {
  #   risk: ['danger', 'risk', 'expose'],
  #   neutral: ['watch', 'err'],
  #   security: ['plan', 'protect', 'truth']
  #   }
  # end

  def self.brand
    [{name: 'American Express', ticker: 'AXP'},
     {name: 'Apple', ticker: 'AAPL', category: ['technology', 'music', '']},
     {name: 'Boeing Co', ticker: 'BA'},
     {name: 'Chevron', ticker: 'CVX'},
     {name: 'Exxon', ticker: 'XOM'},
     {name: 'GE', ticker: 'GE'},
     {name: 'Goldman Sachs', ticker: 'GS'},
     {name: 'Home Depot', ticker: 'HD'},
     {name: 'IBM', ticker: 'IBM'},
     {name: 'Intel', ticker: 'INTC'},
     {name: 'Johnson & Johnson', ticker: 'JNJ'},
     {name: 'duPont', ticker: 'DD'},
     {name: 'Coca-Cola', ticker: 'KO'},
     {name: 'JPMorgan Chase', ticker: 'JPM'},
     {name: 'McDonald\'s Corp', ticker: 'MCD'},
     {name: '3M Co', ticker: 'MMM'}, #mining manufacture
     {name: 'Merck & Co', ticker: 'MRK'}, #pharma
     {name: 'Microsoft', ticker: 'MSFT'},
     {name: 'Nike', ticker: 'NKE'},
     {name: 'Pfizer', ticker: 'PFE'},
     {name: 'Procter & Gamble', ticker: 'PG'},
     {name: 'Travelers Companies Inc', ticker: 'TRV'},
     {name: 'UnitedHealth Group', ticker: 'UNH'},
     {name: 'United Technologies', ticker: 'UTX'},
     {name: 'Verizon', ticker: 'VZ'},
     {name: 'Visa', ticker: 'V'},
     {name: 'Wal Mart', ticker: 'WMT'},
     {name: 'Walt Disney', ticker: 'DIS'}
   ]
  end

  def self.category
    [ 'art and entertainment' ]
  end
end

=begin
['danger','exposure','hazard','liability','opportunity','peril','possibility','prospect','uncertainty','accident','fortune','gamble','jeopardy','luck','plunge','venture','wager']
Moderate:
['balanced','bearable','cautious','conservative','gentle','limited','middle of the road','mild','modest','neutral','pleasant','reasonable','soft','steady','tame','tolerant','compromise']

Safety: ['certain','safe','security','misfortune','plan','protection','reality','truth','sureness','surety','cover','defense','assurance','guarantee','preserve','hold','care']

=end


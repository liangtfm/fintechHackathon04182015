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
    results = {}
    # find match btwn taxonomy & brand category, weigh it
    Keywords.brand.each do |brand|
      brand[:category].each do |category|
        taxonomy.each do |field|
          if category.include?(field['label']) || field['label'].include?(category)
            brand_name = brand[:name].downcase
            if !results[brand_name]
              brand['score'] = 0
              results[brand_name] = brand
            end
            results[brand_name]['score'] += field['score'].gsub(/[^\d^\.]/, '').to_f
          end
        end
      end
    end

    results.sort_by { |k,v| v['score'] }.reverse
  end

  def self.taxonomy(tweets)
    paragraphs = []
    results   = []
    while tweets.length > 0
      paragraphs.push(tweets.slice!(0,20).join(' '))
    end

    paragraphs.each do |paragraph|
      response = @@alchemyapi.taxonomy('text', paragraph)
      if response['status'] == 'OK'
        results.push(response)
      else
        results = response
      end
    end

    if results.length > 1
      results.map do |result|
        result['taxonomy']
      end.flatten.uniq
    else
      nil
    end
  end

end

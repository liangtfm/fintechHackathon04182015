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
            puts "BRAND #{results[brand_name].inspect}"
            if !results[brand_name]
              brand['score'] = 0
              results[brand_name] = brand
            else
              results[brand_name]['score'] += field['score'].gsub(/[^\d^\.]/, '').to_f
            end

          end
        end
      end
    end

    results
  end

  def self.taxonomy(text)
    #@@alchemyapi.taxonomy('text', text)
    puts @@alchemyapi.entities('text', text)
    @@alchemyapi.entities('text', text)
    # return highest matched category
  end

end

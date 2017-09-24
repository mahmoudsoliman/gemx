require "gemx/version"
require 'rubygems'

module Gemx
  def local_gems
    Gem::Specification.sort_by{ |g| [g.name.downcase, g.version] }.group_by{ |g| g.name }
  end
  my_local_gems = local_gems()
  my_local_gems.each{|x|
    uri = URI('http://localhost:3000/lbsforgm')
    params = { :gem_name => x}
    uri.query = URI.encode_www_form(params)
    
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
  }
  
end

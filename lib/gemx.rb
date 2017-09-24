require "gemx/version"
require 'rubygems'

module Gemx
  def local_gems
    Gem::Specification.sort_by{ |g| [g.name.downcase, g.version] }.group_by{ |g| g.name }
  end
  my_local_gems = local_gems()
  
end

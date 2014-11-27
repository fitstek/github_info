require 'uri'
class User
  attr_reader :username

  def initialize username
    @username = username
  end

  def uri
    URI("https://api.github.com/users/#{username}/repos")
  end
end
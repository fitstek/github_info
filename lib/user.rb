require 'uri'
require 'net/http'
require 'json'

class User
  attr_reader :username

  def initialize username
    @username = username
  end

  def uri
    URI("https://api.github.com/users/#{username}/repos")
  end

  def repos
    response = Net::HTTP.start(self.uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri
      http.request request
    end
    JSON.parse(response.body)
  end
end
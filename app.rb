require_relative 'lib/user'

def user_interaction
  begin
    p "Github username:"
    user_input = gets.chomp
    user = User.new(user_input)
    p "#{user.username}'s favourite language is #{user.fav_language}."
  rescue TypeError => e
    p "Please check that you have provided the right username"
  end 
end

user_interaction
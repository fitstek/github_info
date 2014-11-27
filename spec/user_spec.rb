require 'user'

describe User do
  let(:user) { User.new('fitstek') }
  context 'programming language used in repos' do
    it 'knows the username' do
      expect(user.username).to eq 'fitstek'
    end
    it 'can form a uri object when given a username' do
      expect(user.uri.class).to eq URI::HTTPS
    end
    it 'gets an array containing each repo from github' do
      expect(user.repos).to be_kind_of Array
    end
    it 'gives the languages in the from an array' do
      expect(user.languages).to be_kind_of Array
    end
    it 'the number of languages is equal to the number of repos' do
      expect(user.languages.count).to eq user.repos.count
    end
    it 'gives the programming languages as array elements' do
      expect(user.languages).to include("Ruby")
    end
    it 'gives the programming language that has the most occurance' do
      expect(user.fav_language).to eq "Ruby"
    end
  end
end
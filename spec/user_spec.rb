require 'user'

describe User do
  let(:user) { User.new('fitstek') }
  let(:invalid_user) { User.new('fitste') }
  context 'when given a valid username' do
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
  context 'when given an invalid username' do
    it 'knows the username' do
      expect(invalid_user.username).to eq 'fitste'
    end
    it 'can form a uri object when given a username' do
      expect(invalid_user.uri.class).to eq URI::HTTPS
    end
    it 'gets a hash telling it the repo wasn\'t found' do
      expect(invalid_user.repos).to be_kind_of Hash
    end
    it 'the hash contains a message not found' do
      expect(invalid_user.repos["message"]).to eq "Not Found"
    end
    it 'expect an error when trying to find the languages' do
      expect(-> { invalid_user.languages }).to raise_error(TypeError)
    end
    it 'gives the programming language that has the most occurance' do
      expect(-> { invalid_user.fav_language }).to raise_error(TypeError)
    end
  end
end
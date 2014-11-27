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
  end
end
require 'user'

describe User do
  let(:user) { User.new('fitstek') }
  context 'programming language used in repos' do
    it 'knows the username' do
      expect(user.username).to eq 'fitstek'
    end
  end
end
require 'rails_helper'

RSpec.describe Users, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:email)}
  end 
end 
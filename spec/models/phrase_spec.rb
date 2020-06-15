require 'rails_helper'

RSpec.describe Phrase, :type => :model do 

	describe '#validations' do 

		it "should test that the factory is valid" do
			expect(FactoryBot.build :phrase).to be_valid
		end

		it "is not valid without a body" do 
			invalid_phrase = Phrase.new(body: nil)
			expect(invalid_phrase).to_not be_valid 
			expect(invalid_phrase.errors.messages[:body]).to include("can't be blank")
		end

    end

end

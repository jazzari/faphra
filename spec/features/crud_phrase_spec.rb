require 'rails_helper'

RSpec.feature 'CRUD for Phrase' do 

	scenario "user should create a new faphra" do 

		phrase = create :phrase
		visit phrase_path(phrase)

		expect(page).to have_content("My favorite phrase 1")
	end


end

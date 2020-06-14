require 'rails_helper'

RSpec.feature 'CRUD for Phrase' do 

	scenario "user should create a new faphra" do 

		visit new_phrase_path

		fill_in "Today favorite phrase", with: "Add your new favorite phrase..."

		click_on("Create Phrase")

		expect(page).to have_content("Add your new favorite phrase...")
	end

	scenario "user should see a created faphra" do
		@phrase = Phrase.create(body: "First Phrase")

		visit 'phrases/1'

		expect(page).to have_content("First Phrase")
	end

end

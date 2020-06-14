require 'rails_helper'

RSpec.feature 'Create a Faphra' do 

	scenario "user should create a new faphra" do 

		visit new_phrase_path

		fill_in "Today favorite phrase", with: "Add your new favorite phrase..."

		click_on("Create Phrase")

		expect(page).to have_content("Add your new favorite phrase...")
	end

end

require 'rails_helper'

describe 'phrase routes' do 

	it "should route to phrase index" do 
		expect(get '/').to route_to('phrases#index')
	end



end
require 'rails_helper'

describe PhrasesController do 

  describe 'GET phrases#index' do 

  	context "when the visitor is not a registered user"
	  	subject { get :index }

	  	it "should render index template" do 
	  		expect(subject).to render_template('index')
	  	end

	  	it "should list have factory faphras" do 
	  		faphra = create :phrase  
	  		subject

	  		expect(faphra.body).to have_content("My favorite phrase 1")
	  	end
	  	
	end

end


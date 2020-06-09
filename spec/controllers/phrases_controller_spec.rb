require 'rails_helper'

describe PhrasesController do 
  describe 'GET #index' do 
  	subject { get :index }

  	
  	it "should render index template" do 
  		expect(subject).to render_template('index')
  	end


  end

end
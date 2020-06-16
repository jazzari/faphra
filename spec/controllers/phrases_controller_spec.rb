require 'rails_helper'


describe PhrasesController do 

  describe 'GET phrases#index' do 
  	subject { get :index }

  	context "when the visitor is not a registered user"

	  	it "should render index template" do 
	  		expect(subject).to render_template('index')
	  	end

	  	it "should list collection of created faphras" do 
	  		phrases = create_list :phrase, 2  
	  		subject

	  		expect(phrases.count).to eq(2)
	  	end

	  	it "should return phrases in the proper order" do 
	  		old_phrase = create :phrase 
	  		new_phrase = create :phrase
	  		subject

	  		expect(Phrase.recent.first['id']).to eq(new_phrase.id)
	  		expect(Phrase.recent.last['id']).to eq(old_phrase.id)
	  	end

	end

	describe 'GET phrases#show' do 
		let(:phrase) { create :phrase }
		subject { get :show, params: { id: phrase.id } }

		it "should render show template" do 
			expect(subject).to render_template('show')
		end

		it "should return proper content" do 
			subject

			expect(response.body).to match(/My favorite phrase 6/)
		end

	end

	describe 'POST phrase#create' do 

		it "should create a new phrase" do 
			expect{
       		post :create, params: { :phrase => { :body => 'My favorite phrase' }
            } }.to change(Phrase, :count).by 1
			
			expect(flash[:notice]).to eq("Faphra was successfully created")
		end

	end



end


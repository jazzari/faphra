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

		context "with valid attributes" do 

			it "should save the phrase in the database" do 
				expect{
	       		post :create, params: { :phrase => { :body => 'My favorite phrase' }
	            } }.to change(Phrase, :count).by 1
				
				expect(flash[:success]).to eq("Faphra was successfully created")
			end

			it "should redirect to root path after creating" do 
				post :create, params: { :phrase => { :body => 'My favorite phrase' } }
				expect(response).to redirect_to root_path
			end

		end

		context "with invalid attributes" do 

			it "should not save the phrase in the database" do 
				expect{
		       		post :create, params: { :phrase => { :body => '' }
		            } }.to_not change(Phrase, :count)
			end

			it "should redirect to new phrase template after failing create" do 
				post :create, params: { :phrase => { :body => '' } }
				expect(response).to render_template('new')
			end

		end

	end

	describe 'PATCH phrases#update' do 
		let(:phrase) { create :phrase }
		subject { get :show, params: { id: phrase.id } }

		context "with valid attributes" do

			it "should update an existing phrase" do 
				patch :update, :params => { id: phrase.id, 
					:phrase => { :body => "My updated favorite phrase" } }
				expect(flash[:success]).to eq("Faphra was updated successfully!") 
			end

			it "should redirect to show template after updating" do 
				patch :update, :params => { id: phrase.id, 
					:phrase => { :body => "My updated favorite phrase" } }
				expect(response).to redirect_to phrase_path(phrase)
			end

		end

		context "with invalid attributes" do 

			it "should redirect to edit template after failing update" do 
				patch :update, :params => { id: phrase.id, 
					:phrase => { :body => "" } }

				expect(response).to render_template('edit')
			end

		end

	end

	describe 'DELETE phrases#destroy' do 
		let(:phrase) { create :phrase }
		subject { get :show, params: { id: phrase.id } }

		it "should destroy current faphra in database" do 
			subject

			expect{
	       		delete :destroy, params: { :id => phrase.id }
	             }.to change(Phrase, :count).by(-1)
			expect(flash[:notice]).to eq("Faphra was deleted successfully")
		end

		it "should redirect to index after delete faphra" do 
			subject

	       	delete :destroy, params: { :id => phrase.id }
	        expect(response).to redirect_to phrases_path
		end

	end



end


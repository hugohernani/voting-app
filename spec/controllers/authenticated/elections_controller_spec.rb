require 'rails_helper'

RSpec.describe ElectionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Election. As you add validations to Election, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
    }
  }

  let(:invalid_attributes) {
    {
      name: "Invalid Election"
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Election.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      election = Election.create! valid_attributes
      get :show, params: {id: election.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      election = Election.create! valid_attributes
      get :edit, params: {id: election.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Election" do
        expect {
          post :create, params: {election: valid_attributes}, session: valid_session
        }.to change(Election, :count).by(1)
      end

      it "redirects to the created election" do
        post :create, params: {election: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Election.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {election: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested election" do
        election = Election.create! valid_attributes
        put :update, params: {id: election.to_param, election: new_attributes}, session: valid_session
        election.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the election" do
        election = Election.create! valid_attributes
        put :update, params: {id: election.to_param, election: valid_attributes}, session: valid_session
        expect(response).to redirect_to(election)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        election = Election.create! valid_attributes
        put :update, params: {id: election.to_param, election: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested election" do
      election = Election.create! valid_attributes
      expect {
        delete :destroy, params: {id: election.to_param}, session: valid_session
      }.to change(Election, :count).by(-1)
    end

    it "redirects to the elections list" do
      election = Election.create! valid_attributes
      delete :destroy, params: {id: election.to_param}, session: valid_session
      expect(response).to redirect_to(elections_url)
    end
  end

end

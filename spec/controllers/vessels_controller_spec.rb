require 'rails_helper'

RSpec.describe VesselsController, type: :controller do

  let(:valid_attributes) { attributes_for(:vessel) }
  let(:invalid_attributes) { attributes_for(:invalid_vessel) }
  let(:valid_session) { {} }
  let(:vessel) { create(:vessel) }

  describe 'GET index' do
    it 'assigns all vessels as @vessels' do
      get :index, {}, valid_session
      expect(assigns(:vessels)).to eq([vessel])
    end
  end

  describe 'GET show' do
    it 'assigns the requested vessel as @vessel' do
      get :show, { id: vessel.id }, valid_session
      expect(assigns(:vessel)).to eq(vessel)
    end
  end

  describe 'GET new' do
    it 'assigns a new vessel as @vessel' do
      get :new, {}, valid_session
      expect(assigns(:vessel)).to be_a_new(Vessel)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested vessel as @vessel' do
      get :edit, { id: vessel.id }, valid_session
      expect(assigns(:vessel)).to eq(vessel)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Vessel' do
        expect do
          post :create, { vessel: valid_attributes }, valid_session
        end.to change(Vessel, :count).by(1)
      end

      it 'assigns a newly created vessel as @vessel' do
        post :create, { vessel: valid_attributes }, valid_session
        expect(assigns(:vessel)).to be_a(Vessel)
        expect(assigns(:vessel)).to be_persisted
      end

      it 'redirects to the created vessel' do
        post :create, { vessel: valid_attributes }, valid_session
        expect(response).to redirect_to(Vessel.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved vessel as @vessel' do
        post :create, { vessel: invalid_attributes }, valid_session
        expect(assigns(:vessel)).to be_a_new(Vessel)
      end

      it "re-renders the 'new' template" do
        post :create, { vessel: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { attributes_for(:vessel, name: 'new name') }

      it 'updates the requested vessel' do
        put :update, { id: vessel.id, vessel: new_attributes }, valid_session
        vessel.reload
        expect(vessel.name).to eq('new name')
      end

      it 'assigns the requested vessel as @vessel' do
        put :update, { id: vessel.id, vessel: valid_attributes }, valid_session
        expect(assigns(:vessel)).to eq(vessel)
      end

      it 'redirects to the vessel' do
        put :update, { id: vessel.id, vessel: valid_attributes }, valid_session
        expect(response).to redirect_to(vessel)
      end
    end

    describe 'with invalid params' do
      it 'assigns the vessel as @vessel' do
        put :update, { id: vessel.id, vessel: invalid_attributes }, valid_session
        expect(assigns(:vessel)).to eq(vessel)
      end

      it "re-renders the 'edit' template" do
        put :update, { id: vessel.id, vessel: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested vessel' do
      vessel.save
      expect do
        delete :destroy, { id: vessel.id }, valid_session
      end.to change(Vessel, :count).by(-1)
    end

    it 'redirects to the vessels list' do
      delete :destroy, { id: vessel.id }, valid_session
      expect(response).to redirect_to(vessels_url)
    end
  end

end

require 'rails_helper'

RSpec.describe WineriesController, type: :controller do

  let(:valid_attributes) { attributes_for(:winery) }
  let(:invalid_attributes) { attributes_for(:invalid_winery) }
  let(:valid_session) { {} }
  let(:winery) { create(:winery) }

  describe 'GET index' do
    it 'assigns all wineries as @wineries' do
      get :index, {}, valid_session
      expect(assigns(:wineries)).to eq([winery])
    end
  end

  describe 'GET show' do
    it 'assigns the requested winery as @winery' do
      get :show, { id: winery.id }, valid_session
      expect(assigns(:winery)).to eq(winery)
    end
  end

  describe 'GET new' do
    it 'assigns a new winery as @winery' do
      get :new, {}, valid_session
      expect(assigns(:winery)).to be_a_new(Winery)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested winery as @winery' do
      get :edit, { id: winery.id }, valid_session
      expect(assigns(:winery)).to eq(winery)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Winery' do
        expect do
          post :create, { winery: valid_attributes }, valid_session
        end.to change(Winery, :count).by(1)
      end

      it 'assigns a newly created winery as @winery' do
        post :create, { winery: valid_attributes }, valid_session
        expect(assigns(:winery)).to be_a(Winery)
        expect(assigns(:winery)).to be_persisted
      end

      it 'redirects to the created winery' do
        post :create, { winery: valid_attributes }, valid_session
        expect(response).to redirect_to(Winery.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved winery as @winery' do
        post :create, { winery: invalid_attributes }, valid_session
        expect(assigns(:winery)).to be_a_new(Winery)
      end

      it "re-renders the 'new' template" do
        post :create, { winery: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { attributes_for(:winery, name: 'new name') }

      it 'updates the requested winery' do
        put :update, { id: winery.id, winery: new_attributes }, valid_session
        winery.reload
        expect(winery.name).to eq('new name')
      end

      it 'assigns the requested winery as @winery' do
        put :update, { id: winery.id, winery: valid_attributes }, valid_session
        expect(assigns(:winery)).to eq(winery)
      end

      it 'redirects to the winery' do
        put :update, { id: winery.id, winery: valid_attributes }, valid_session
        expect(response).to redirect_to(winery)
      end
    end

    describe 'with invalid params' do
      it 'assigns the winery as @winery' do
        put :update, { id: winery.id, winery: invalid_attributes }, valid_session
        expect(assigns(:winery)).to eq(winery)
      end

      it "re-renders the 'edit' template" do
        put :update, { id: winery.id, winery: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested winery' do
      winery.save
      expect do
        delete :destroy, { id: winery.id }, valid_session
      end.to change(Winery, :count).by(-1)
    end

    it 'redirects to the wineries list' do
      delete :destroy, { id: winery.id }, valid_session
      expect(response).to redirect_to(wineries_url)
    end
  end

end

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    { name: 'John Doe', email: 'john@example.com', password: 'password123', cellphone: '1234567890', admin: false, oab: '12345' }
  end

  let(:invalid_attributes) do
    { name: '', email: 'invalid_email', password: '', cellphone: '', admin: nil, oab: '' }
  end

  let!(:user) { User.create!(valid_attributes) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the created user' do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(User.last)
      end
    end

    context 'with invalid parameters' do
      xit 'does not create a new User' do
        expect do
          post :create, params: { user: invalid_attributes }
        end.not_to change(User, :count)
      end

      xit 'renders the new template' do
        post :create, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'Jane Doe' } }

      it 'updates the requested user' do
        patch :update, params: { id: user.id, user: new_attributes }
        user.reload
        expect(user.name).to eq('Jane Doe')
      end

      it 'redirects to the user' do
        patch :update, params: { id: user.id, user: new_attributes }
        expect(response).to redirect_to(user)
      end
    end

    context 'with invalid parameters' do
      xit 'does not update the user' do
        patch :update, params: { id: user.id, user: invalid_attributes }
        user.reload
        expect(user.name).to eq('John Doe')
      end

      xit 'renders the edit template' do
        patch :update, params: { id: user.id, user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      expect do
        delete :destroy, params: { id: user.id }
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to(users_path)
    end
  end
end

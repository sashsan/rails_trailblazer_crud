# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListsController, type: :request do
  let!(:list1) { create :list }
  let!(:list2) { create :list }

  context 'GET #index' do
    let(:path) { '/lists' }

    it 'returns http success' do
      get path

      expect(response).to have_http_status(:success)
    end

    it 'returns the correct lists' do
      get path

      expect(response).to have_http_status(:success)
      expect(response.body).to include(list1.todo)
    end
  end

  context 'GET #show' do
    let(:path) { "/lists/#{list1.id}" }

    it 'return the correct list' do
      get path

      expect(response).to have_http_status(:success)
      expect(response.body).to include(list1.todo)
    end
  end

  context 'GET #new' do
    it 'renders the new template' do
      get new_list_url

      assert_response :success
    end
  end

  context 'POST #create' do
    let(:path) { '/lists' }
    let(:params) { { list: { todo: 'New list' } } }

    it 'creates new list' do
      post path, params: params

      expect(List.last.todo).to eq('New list')
    end
  end

  context 'PATCH #update' do
    let(:path) { "/lists/#{list1.id}" }
    let(:params) { { list: { todo: 'some' } } }

    it 'updates list' do
      patch path, params: params

      list1.reload

      expect(list1.todo).to eq('some')
    end
  end

  context 'DELETE #delete' do
    let(:path) { "/lists/#{list1.id}" }

    it 'deletes list' do
      delete path

      expect(List.count).to eq(1)
    end
  end
end

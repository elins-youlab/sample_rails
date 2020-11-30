# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'уникальность логина' do
    it 'проверяется' do
      User.create!(login: 'vasya')

      user = User.new(login: 'vasya')
      expect(user).to_not be_valid
      expect(user.errors.messages[:login]).to include('Пользователь с таким логином уже существует')
    end
  end
end

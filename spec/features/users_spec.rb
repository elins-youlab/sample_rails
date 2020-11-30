# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Страница со списком пользователей', type: :feature do
  describe 'список всех пользовтателей' do
    before do
      User.create!(first_name: 'Вася', last_name: 'Пупкин', login: 'vasya')
      User.create!(first_name: 'Петя', last_name: 'Вовкин', login: 'petya')
    end

    it 'отображает корректно' do
      visit users_path

      expect(page).to have_text('Вася')
      expect(page).to have_text('Петя')
    end
  end

  it 'позволяет создать пользователя' do
    visit users_path

    click_link 'Создать пользователя'

    fill_in 'Имя', with: 'Вася'
    fill_in 'Фамилия', with: 'Пупкин'
    click_button 'Сохранить'

    expect(page).to have_text('Вася Пупкин')
  end

  it 'не позволяет добавлять пользователей с одинаковыми логинами' do
    User.create!(last_name: 'Пупкин', first_name: 'Вася', login: 'admin', admin: true)

    visit new_user_path

    fill_in 'Имя', with: 'Петя'
    fill_in 'Фамилия', with: 'Васькин'
    fill_in 'Логин', with: 'admin'

    click_button 'Сохранить'

    expect(page).to have_text('Пользователь с таким логином уже существует')
  end
end

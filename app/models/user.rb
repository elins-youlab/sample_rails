class User < ApplicationRecord
  validates :login,
            uniqueness: {
              message: 'Пользователь с таким логином уже существует'
            }
end
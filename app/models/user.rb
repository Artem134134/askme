class User < ApplicationRecord
	has_secure_password # тоже проверяет на присутствие.

  validates :email, presence: true, uniqueness: {case_sensitive: false}




end

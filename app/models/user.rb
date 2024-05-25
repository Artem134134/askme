class User < ApplicationRecord
	has_secure_password # тоже проверяет на присутствие.

	before_save :downcase_nickname
	
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def downcase_nickname
  	nickname.downcase!
  end
end
class User < ApplicationRecord
	has_secure_password # тоже проверяет на присутствие.
	
	before_save :downcase_nickname
	
  validates :email, presence: true, uniqueness: true

	#validates :name, presence: true, length: { in: 2..20, wrong_length: "%{count} Неверная длина поля имя!" }
	
	#validates :nickname, presence: true, length: {in: 2..20, wrong_length: "%{count} Неверная длина поля псевдоним!" }  
  

  def downcase_nickname
  	nickname.downcase!
  end

end
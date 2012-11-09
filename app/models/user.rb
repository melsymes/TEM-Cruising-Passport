class User < ActiveRecord::Base
  rolify

  has_one :marina, :class_name => 'Marina'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me


  validates_uniqueness_of :passport_code



    #Add passport code - overload .new
  def initialize(*args)
    super(*args)
    self.passport_code ||= generate_passport_code(5)
    #puts self.generate_passport_code
  end


  #  abcdefghijklmnopqrstuwxyz
  #  a + c..h jk + m..q + r..z
  def generate_passport_code(length = 5, non_ambiguous = false)
    #characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    #characters = 'acdefghjkmnprtuvwxyz'.to_a + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.to_a + ('0'..'9').to_a
    characters = ('A'..'A').to_a + ('C'..'H').to_a + ('J'..'K').to_a + ('M'..'Q').to_a + ('R'..'Z').to_a + ('0'..'9').to_a
    characters = characters + ('a'..'a').to_a + ('c'..'h').to_a + ('j'..'k').to_a + ('m'..'q').to_a + ('r'..'z').to_a
    %w{I O l 0 1}.each{ |ambiguous_character|
      characters.delete ambiguous_character
      } if non_ambiguous

      (0...length).map{
      characters[SecureRandom.random_number(characters.size)]
      }.join

  end

end

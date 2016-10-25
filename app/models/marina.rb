class Marina < ActiveRecord::Base


  #has_many :pending_managers, :class_name => 'User', :foreign_key => 'pending_user'
  has_many :users, :inverse_of => :marina
  has_many :pending_users, :class_name => 'User', :foreign_key => 'pending_user'
  has_many :active_managers, :class_name => 'User', :foreign_key => 'active_manager'
  has_many :active_users, :class_name => 'User', :foreign_key => 'active_user'
  has_many :expired_managers, :class_name => 'User', :foreign_key => 'expired_manager'
  has_many :expired_users, :class_name => 'User', :foreign_key => 'expired_user'


  attr_accessible :address, :address1, :country, :county, :name, :postcode, :town
  has_friendly_id :name, :use_slug => true



  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def to_param
    self.name.downcase.gsub(' ', '-')
  end

  def count_managers
    self.active_managers.count
  end

  def count_users
    self.active_users.count
  end

  def connect_pending(user)
    self.pending_users << user
    #user.marina = self
  end

  def create_user(anemail)


  if anemail =~ /@/
      new_user = User.create :email => anemail.to_s, :password => 'password', :password_confirmation => 'password'
      #new_user.skip_confirmation_notification!  let the user confirm the account
      new_user.confirm!
      new_user.save!
      self.pending_users<< new_user
      new_user.marina_state = "PENDING"
      #why!
      self.users << new_user
      #self.save!
      #new_user.save!
  end
  end

end

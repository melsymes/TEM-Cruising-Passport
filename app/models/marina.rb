class Marina < ActiveRecord::Base


  has_many :pending_managers, :class_name => 'User', :foreign_key => 'marina'
  has_many :pending_users, :class_name => 'User', :foreign_key => 'marina'
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

  def connect_pending(user)
    self.pending_users << user
    #user.marina = self

  end

end

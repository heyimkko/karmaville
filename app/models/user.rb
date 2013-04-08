class User < ActiveRecord::Base
  has_many :karma_points
  
  attr_accessible :first_name, :last_name, :email, :username, :total_karma_points
  # before_create :total_karma
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    # total_karma
    self.order('total_karma_points DESC')
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
  end

  def total_karma
    self.total_karma_points
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  

  # def update
    # User.all.each {|user| user.update_attribute(total_karma_points, user.karma_points.pluck(:value).sum)  }
  # end

end

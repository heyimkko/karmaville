class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user
  after_create :update_user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true


  def update_user
    user.update_attributes(:total_karma_points => (user.total_karma_points.to_i + self.value.to_i))
  end
end

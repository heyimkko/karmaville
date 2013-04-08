class AddDefaultToTotalKarmaPoints < ActiveRecord::Migration
  def change
    change_column :users, :total_karma_points, :integer, :default => 0
  end
end

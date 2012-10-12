class ChangeDefaultValueOfOrderInLinkages < ActiveRecord::Migration
  def change
    change_column :linkages, :order, :integer, default: 0
  end
end

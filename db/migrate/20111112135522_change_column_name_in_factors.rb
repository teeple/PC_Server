class ChangeColumnNameInFactors < ActiveRecord::Migration
  def self.up
    rename_column :what_factors, :default, :default_flag
    rename_column :when_factors, :default, :default_flag
    rename_column :where_factors, :default, :default_flag
    rename_column :who_factors, :default, :default_flag
  end

  def self.down
    rename_column :what_factors, :default_flag, :default
    rename_column :when_factors, :default_flag, :default
    rename_column :where_factors, :default_flag, :default
    rename_column :who_factors, :default_flag, :default
  end
end

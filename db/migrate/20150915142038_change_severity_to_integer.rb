class ChangeSeverityToInteger < ActiveRecord::Migration
  def change
    change_column :ratings, :severity, :integer
  end
end

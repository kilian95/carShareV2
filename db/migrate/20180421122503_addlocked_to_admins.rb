class AddlockedToAdmins < ActiveRecord::Migration[5.1]
  def change
		add_column :admins, :locked_at, :datetime
  end
end

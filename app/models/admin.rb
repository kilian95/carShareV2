class Admin < ApplicationRecord
  # since its for admins, account is lockable after so many failed attempts of login.
  #also logs out after period of inactivity
  devise :database_authenticatable, :trackable, :timeoutable
end

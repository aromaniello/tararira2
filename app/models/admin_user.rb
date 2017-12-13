class AdminUser < ActiveRecord::Base
	devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable
end

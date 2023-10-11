class DashboardController < ApplicationController
  before_action :authenticate_admin_user!
  layout 'admin'
  def home
  end
  def admin_users
    @admin_users = AdminUser.all
  end
end

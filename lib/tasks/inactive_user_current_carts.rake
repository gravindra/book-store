## rake delete:inactive_user_current_carts

namespace :delete do
  desc "Delete user current cart which was last updated at 2days ago"
  task :inactive_user_current_carts => :environment do
    inactive_carts = CurrentCart.where("updated_at <= ?", 2.days.ago)
    inactive_carts.destroy_all
  end
end
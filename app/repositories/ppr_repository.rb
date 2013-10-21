module PprRepository
  extend ActiveSupport::Concern

  included do
#    scope :admin, where(:admin => true)
#    scope :non_admin, where(:admin => false)
#    scope :active, where(:state => :active)
#    scope :non_blocked, where(:state => [:waiting_email_confirmation, :active])
    scope :user, lambda {|value| where(:user_id => value)}
  end

end
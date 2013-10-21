module UserRepository
  extend ActiveSupport::Concern

  included do
    scope :active, where(:state => :active)
    scope :non_blocked, where(:state => [:waiting_email_confirmation, :active])


    scope :root, where(:type => 'Root')
    scope :admin, where(:type => 'Admin')
    scope :client, where(:type => 'Client')

    scope :other_roles, lambda{|value| where("role_id not in (#{value})")}
  end

end

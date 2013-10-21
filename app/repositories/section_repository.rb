module SectionRepository
  extend ActiveSupport::Concern

  included do
    scope :group, lambda { |group| where(:group_id => group) }
    scope :section, lambda { |section| where(:section => section) }
  end

end
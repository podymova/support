class Role::Right < ActiveRecord::Base
  include UserRepository

  attr_accessible :full_name, :model_id, :role_id, :ashow, :aedit, :adelete

  belongs_to :role
  belongs_to :model, :class_name => 'Special::Model'

  scope :active, where(:ashow => true)
  scope :filtered_by_section, lambda {|value, model| joins("INNER JOIN #{model.table_name} ON #{model.table_name}.id = #{self.table_name}.model_id AND #{model.table_name}.section = '#{value}' AND #{model.table_name}.state = 'active'").order("#{model.table_name}.full ASC")}
end

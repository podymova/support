module GeneralRepository
  extend ActiveSupport::Concern

  included do
    attribute_names.each do |a|
      scope "by_#{a}", order("#{quoted_table_name}.#{a} Desc")
      scope "asc_by_#{a}", order("#{quoted_table_name}.#{a} Asc")
    end
  end



end
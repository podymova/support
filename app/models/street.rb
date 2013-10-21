class Street < ActiveRecord::Base
  attr_accessible :name, :short, :state, :state_event

  validates :short, :presence => true, :uniqueness => true

  has_many :houses
  has_one :ppr #, :class_name => 'Inventory::Ppr'

  validates :name, :presence => true
  validates :short, :presence => true, :uniqueness => true

#  define_index do
#    indexes content
#    indexes :short
#    indexes :name
    #indexes comments.content, :as => :comment_content
    #indexes [author.first_name, author.last_name], :as => :author_name

    #has id
#  end

  state_machine :state, :initial => :active do
    event :block do
      transition all - :blocked => :blocked
    end

    event :activate do
      transition all - :active => :active
    end
  end

  scope :active, where(:state => :active)
  scope :blocked, where(:state => :blocked)

  scope :street_filter, lambda { |value|
      where('short ILIKE :value OR  name ILIKE :value', :value => "%#{value}%")
    }

  def self.get_street(street)
    street = find_by_id(street)
    if street
      street.name
    else
      nil
    end
  end



end

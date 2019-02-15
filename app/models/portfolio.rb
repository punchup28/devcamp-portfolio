class Portfolio < ApplicationRecord
  has_many :technologies
    # data validation to input technology attribute
    # reject_if: lambda { |attrs| attrs['name']} => do not accept it if add attribute name ?? if attribute name is blankk don't let it pass through
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank?}

  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where( subtitle: "Angular")
  end
    # ให้ผลเหมือน self.angular
    # -> => for encapsulate entire process
  scope :ruby_on_rails_portfolio_items, -> {where( subtitle: "Ruby on rails")}

  after_initialize :set_defaults

  def set_defaults
      # ||== mean => if self.main_image == nil
      #               self.main_image = "https://via.placeholder.com/600x400
      #              end
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '300', width: '150')
  end
end

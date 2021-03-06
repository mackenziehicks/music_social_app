class Concert < ActiveRecord::Base
  #newsfeed gem
  include PublicActivity::Common
  # tracked owner: ->(controller, model) {controller && controller.current_user}

  has_many :bandtogethers, dependent: :destroy
  resourcify
  validates_presence_of :city

  def full_address
    @address = address
    @city = city
    @state = state
    @full_address = @address + " " + @city + " " + @state
  end

  geocoded_by :full_address
  after_validation :geocode
end

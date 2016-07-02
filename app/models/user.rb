class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :phone_number, presence: true, numericality: true, uniqueness: true
  validates :first_name, presence: true, numericality: false
  validates :last_name, presence: true, numericality: false
  validates_length_of :phone_number, :minimum => 10, :maximum => 10, :allow_blank => false


  scope :active, -> { where("sector is not null ").order("created_at desc") }

  def get_sector_id
    self.sector = loop do
      sector = rand(1..C_MAX_SEC)
      break sector unless User.exists?(sector: sector)
    end
  end

end

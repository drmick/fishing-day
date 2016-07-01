class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  scope :active, -> { where("sector is not null ").order("created_at desc") }

  def get_sector_id
    self.sector = loop do
      sector = rand(1..C_MAX_SEC)
      break sector unless User.exists?(sector: sector)
    end
  end

end

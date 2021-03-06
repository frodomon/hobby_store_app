class User < ApplicationRecord
  resourcify
  # Include default devise modules. Others available are:
  #  :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :ubigeo
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :email
  has_one_attached :avatar
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true
  validates_associated :address
  has_one :doi_type

  ROLES = %i[SuperAdmin Manager SalesForce Auctioneer User]

   def full_name
    a ="#{try(:name)}  #{try(:last_name)}".to_s                                                                                                                                                                                                                                                                                                                                                                                                                 
  end
 
  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
  	ROLES.reject do |r|
	   ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
  	roles.include?(role)
  end

end

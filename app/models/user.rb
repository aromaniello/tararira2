class User < ActiveRecord::Base

	## Authentication ##
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
	include DeviseTokenAuth::Concerns::User
	
	## Enumerations ##
	enum gender: [:male, :female, :other]
	enum spouse_gender: [:spouse_male, :spouse_female, :spouse_other]
	enum employment_status: [:employed, :independent, :unemployed, :student, :retired, :autonomous]
	enum civil_status: [:single, :married, :divorced, :widower]

	## Associations ##
	has_one :investment_account, dependent: :destroy
	has_many :bank_accounts, as: :bank_account_like, dependent: :destroy
	has_many :messages, dependent: :destroy
	has_many :actions, dependent: :destroy
	
	has_attached_file :photo_personal_id_front, :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :path => '/files/:basename.:extension'
	has_attached_file :photo_personal_id_back, :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :path => '/files/:basename.:extension'
	has_attached_file :photo_personal_id_selfie, :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :path => '/files/:basename.:extension'

	## Callbacks ##
	after_save { |user| user.create_investment_account if user.investment_account.nil? }

	before_validation do |user|
		user.personal_id = user.personal_id.gsub(/[^0-9]/, '') unless user.personal_id.nil?
		user.tax_id = user.tax_id.gsub(/[^0-9]/, '') unless user.tax_id.nil?
	end
	
	## Validations ##
	validates :personal_id, length: { in: 7..8 }, numericality: true, allow_blank: true
	validates :tax_id, length: { is: 11 }, numericality: true, allow_blank: true
	validates :phone_number, numericality: true, allow_blank: true
	
	validates_attachment_content_type :photo_personal_id_front, :content_type => /\Aimage\/.*\Z/
	validates_attachment_content_type :photo_personal_id_back, :content_type => /\Aimage\/.*\Z/
	validates_attachment_content_type :photo_personal_id_selfie, :content_type => /\Aimage\/.*\Z/

	def s3_credentials
		{ bucket: "tararira2", access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'] }
	end

	def full_name
		"#{first_name} #{last_name}"
	end
	
	def check_pin(test_pin)
		BCrypt::Password.new(self.pin_hash) == test_pin
	end

	def set_pin(new_pin_plain)
		self.update(pin_hash: BCrypt::Password.create(new_pin_plain))
	end

	def authorized?
		self.authorized
	end

	def authorize
		self.update(authorized: true)
	end

end

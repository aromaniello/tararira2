class Transaction < ActiveRecord::Base
	enum transaction_type: [:deposit, :refund]
	
	belongs_to :investment_account

	has_attached_file :proof,
		:storage => :s3,
		:s3_credentials => Proc.new{|a| a.instance.s3_credentials },
		:path => '/files/:basename.:extension'
		
	validates_attachment_content_type :proof, :content_type => /\Aimage\/.*\Z/

	def s3_credentials
		{ bucket: "tararira2", access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'] }
	end
	
	def is_deposit?
		self.transaction_type == "deposit"
	end
	
	def is_refund?
		self.transaction_type == "refund"
	end

	def approved?
		self.approved
	end

	def approve
		self.update(approved: true)
	end
end

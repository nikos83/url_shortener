class ShortUrl
  include Mongoid::Document
  include Mongoid::Timestamps
  field :original_url, type: String
  field :short_code, type: String
  field :user_id, type: BSON::ObjectId

  belongs_to :user

  validates :original_url, presence: true
  validates :short_code, presence: true, uniqueness: true

  before_validation :generate_short_code, on: :create

  private

  def generate_short_code
    self.short_code = SecureRandom.urlsafe_base64(6) if short_code.blank?
  end
end

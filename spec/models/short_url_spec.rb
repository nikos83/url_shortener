require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(email: 'test@example.com', password: 'password')
    short_url = ShortUrl.new(original_url: 'https://example.com', user:)
    expect(short_url).to be_valid
  end

  it 'is not valid without an original_url' do
    short_url = ShortUrl.new(original_url: nil)
    expect(short_url).not_to be_valid
  end

  it 'generates a short_code before validation' do
    user = User.create(email: 'test@example.com', password: 'password')
    short_url = ShortUrl.new(original_url: 'https://example.com', user:)
    short_url.valid?
    expect(short_url.short_code).not_to be_nil
  end
end

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    uri = URI.parse(value)
    record.errors.add(attribute, 'must be a valid URL') unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  rescue URI::InvalidURIError
    record.errors.add(attribute, 'must be a valid URL')
  end
end

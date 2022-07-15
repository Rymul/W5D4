# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint           not null, primary key
#  long_url     :string           not null
#  short_url    :string           not null
#  submitter_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ShortenedUrl < ApplicationRecord

    validates :long_url, :short_url, presence: true

    def self.random_code
        short_url = SecureRandom.urlsafe_base64(16)
        while ShortenedUrl.exists?(:short_url => short_url)
            short_url = SecureRandom.urlsafe_base64(16)
        end
        short_url
        # SecureRandom::urlsafe_base64(16)
    end

    after_initialize :generate_short_url

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name: :User



    private

    def generate_short_url
        self.short_url ||= ShortenedUrl.random_code
    end
end

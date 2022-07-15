# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  url_id     :bigint           not null
#  visitor_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Visit < ApplicationRecord
  validates :url_id, :visitor_id, presence: true

  belongs_to :visitors,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :User

  belongs_to :visited_urls,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortendUrl
end

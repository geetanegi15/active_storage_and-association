class Student < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_and_belongs_to_many :courses   # association


  # has_many :through association..........
  has_many :student_projects
  has_many :projects , through: :student_projects


  # active storage testing ..................
  has_one_attached :profile_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  has_one_attached :profile_video do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(profile_image.blob)
  end
end

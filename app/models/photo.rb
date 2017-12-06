class Photo < ApplicationRecord
	belongs_to :user
	has_attached_file :attachment, styles: { thumb: ["64x64#", :jpg], original: ['500x500>', :jpg] }
  validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}, size: { in: 0..500.kilobytes }
end

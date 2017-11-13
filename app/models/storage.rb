class Storage < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
end

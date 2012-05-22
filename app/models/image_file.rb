class ImageFile < ActiveRecord::Base
  attr_accessible :binary_data, :content_type, :description, :filename
end

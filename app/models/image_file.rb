# == Schema Information
#
# Table name: image_files
#
#  id           :integer         primary key
#  description  :string(255)
#  content_type :string(255)
#  filename     :string(255)
#  binary_data  :binary
#  created_at   :timestamp       not null
#  updated_at   :timestamp       not null
#

class ImageFile < ActiveRecord::Base
  attr_accessible  :description, :image_file #, :filename, :binary_data, :content_type,
  def image_file=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
end

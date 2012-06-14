# == Schema Information
#
# Table name: site_configurations
#
#  id                                 :integer         not null, primary key
#  location_name                      :string(255)
#  image_file_id                      :integer
#  logo_text                          :string(255)
#  logo_text_color                    :string(255)
#  top_bar_gradient_start_color       :string(255)
#  top_bar_gradient_end_color         :string(255)
#  secondary_bar_gradient_start_color :string(255)
#  secondary_bar_gradient_end_color   :string(255)
#  page_background_color              :string(255)
#  secondary_header_text_color        :string(255)
#  patient_info_box_background_color  :string(255)
#  created_at                         :datetime        not null
#  updated_at                         :datetime        not null
#

class SiteConfiguration < ActiveRecord::Base
  attr_accessible :image_file_id, :location_name, :logo_text, :logo_text_color, :page_background_color, :page_background_color, :patient_info_box_background_color, :secondary_bar_gradient_end_color, :secondary_bar_gradient_start_color, :secondary_header_text_color, :top_bar_gradient_end_color, :top_bar_gradient_start_color
end

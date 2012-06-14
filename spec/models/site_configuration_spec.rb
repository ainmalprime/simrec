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

require 'spec_helper'

describe SiteConfiguration do
  pending "add some examples to (or delete) #{__FILE__}"
end

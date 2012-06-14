class CreateSiteConfigurations < ActiveRecord::Migration
  def change
    create_table :site_configurations do |t|
      t.string :location_name
      t.integer :image_file_id
      t.string :logo_text
      t.string :logo_text_color
      t.string :top_bar_gradient_start_color
      t.string :top_bar_gradient_end_color
      t.string :secondary_bar_gradient_start_color
      t.string :secondary_bar_gradient_end_color
      t.string :page_background_color
      t.string :secondary_header_text_color
      t.string :page_background_color
      t.string :patient_info_box_background_color

      t.timestamps
    end
  end
end

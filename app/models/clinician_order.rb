class ClinicianOrder < ActiveRecord::Base
  attr_accessible :ordernote, :ordertype, :retainOnReset, :status, :timeprocessed, :timerecorded, :visit_id
end

class Search # < ActiveRecord::Base
  # attr_accessible :title, :body
  def initialize(model, options)
  	@model = model
  	@options = options || {}
  end

  def lastName
  	options[:last_name]
  end

  def mrNumber
  	options[:mrNumber]
  end

  def has_lastName?
  	lastName.present?
  end


end

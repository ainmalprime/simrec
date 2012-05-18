require 'spec_helper'

describe "Static pages" do

  	describe "Home page" do

    	it "should have the content 'Health'" do
     		visit home_path
      		page.should have_content('Health')
    	end
  	end

	describe "Search page" do

  		it "should have the content 'search'" do
   	   		visit search_path
    		page.should have_content('Search')
    	end
 	end

end


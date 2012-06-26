class StaticPagesController < ApplicationController
   include SessionsHelper #load up the SessionsHelper functions to help manage the user session
   before_filter :clear_patient  #clear out the selected patient because the user has browsed away from the patient detail page
   before_filter :check_site_configuration #make sure a location configuration has been selected.
   before_filter :record_referrer #record referrer in a session varable for the purposes of navigating back to start point after an action is performed.

  def record_referrer
    session[:return_to] = request.url #save the current url in a session varable so the last page can be tracked for navigation and application flow
  end
  
  def home

  end

  def search
  
  end

end

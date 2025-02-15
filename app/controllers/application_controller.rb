class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session


  protected

    def authenticate_student_or_instructor!
      if student_signed_in?
        authenticate_student!
      elsif instructor_signed_in?
        authenticate_instructor!
      end
    end
  
  	def authenticate_any!
  		if student_signed_in?
  			authenticate_student!
  		elsif admin_signed_in?
  			authenticate_admin!
  		elsif instructor_signed_in?
  			authenticate_instructor!
  		end
  	end

end

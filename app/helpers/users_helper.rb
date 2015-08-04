module UsersHelper
  
  #Pre-condition: email has valid format
  def extract_username(email)    
    email_a = email.split('@')
    if email_a.length >0
      return email_a[0]
    end
  end
end

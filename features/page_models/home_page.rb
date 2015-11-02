class HomePage < PageActions

  def path
    "http://www.usps.com"
  end

  def login_button
    @browser.find_element(:id, "anchor-login")
  end

  def no_user_error_message
    @browser.find_element(:id, "error-invalid-username")
  end

  def wrong_password_error_message
    @browser.find_element(:css, 'span.error')
    #@browser.find_element(:xpath, "//*[@id='actionerrors']/div/span")
  end

    def zip_code_lookup_link
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_HyperLink2")
  end

end



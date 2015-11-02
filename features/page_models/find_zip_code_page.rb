class FindZipCodePage  < PageActions

  def path
    "https://tools.usps.com/go/ZipLookupAction_input"
  end

  def address_text_field
    @browser.find_element(:id, 'tAddress')
  end

  def city_text_field
    @browser.find_element(:id, 'tCity')
  end

  def states_dropdown
    @browser.find_element(:css, 'span.select-current-text')
  end

  def select_state (state)
    result=false
    states_dropdown.click
    state_list = @browser.find_element(:css, 'ul.select-ul').find_elements(:tag_name, 'a')

    state_list.each {|state_name|
      if state_name.text == state
        result=true
        state_name.click
        break
      end
    }
    expect(result).to be_truthy
  end

  def find_zip_code_button
    @browser. find_element(:id, 'lookupZipFindBtn')
  end

  def see_results
    @browser.find_element(:id, 'result-list').find_elements(:tag_name, 'li')

  end

  def collect_zip_codes
    zip_array = []
    see_results.each {|elm|
      zip_array << elm.find_element(:css, 'span.zip').text
    }
  end

end
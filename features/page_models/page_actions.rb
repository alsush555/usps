class PageActions
  include RSpec::Matchers
  include RSpec::Expectations

  def initialize browser
    @browser = browser
  end

  def visit
    @browser.navigate.to build_url
  end

  def build_url
    initial_url = self.path
  end

end

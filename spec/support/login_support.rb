module LoginSupport
  def sign_in_as(user)
    visit "/"
    click_link "ログイン"
    fill_in "login-email", with: user.email
    fill_in "login-password", with: user.password
    click_button "login-submit"
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end

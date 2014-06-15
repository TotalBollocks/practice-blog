module AuthenticationHelpers
  def sign_in(user)
    visit sign_in_path
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button "Sign in"
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelpers, type: :feature
end
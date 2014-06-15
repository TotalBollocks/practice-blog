RSpec::Matchers.define :have_error do |error, message|
  match do |user|
    user.should_not be_valid
    user.errors[error].include? message
  end
end
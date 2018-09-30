# As recommended here:
# http://andredieb.com/5-ways-to-speedup-rails-feature-tests.html
Devise.setup do |config|
  config.stretches = 1
end

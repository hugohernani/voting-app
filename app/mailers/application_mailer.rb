class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_USERNAME'] || 'management@blockelection.info'
  layout 'mailer'
end

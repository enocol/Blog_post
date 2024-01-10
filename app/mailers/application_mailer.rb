# frozen_string_literal: true

# ApplicationMailer module
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end

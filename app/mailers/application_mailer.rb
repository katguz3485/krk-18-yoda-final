# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'yoda_team@netguru.com'
  layout 'mailer'
end

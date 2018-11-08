# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'address@example.com'
  layout 'mailer'
end

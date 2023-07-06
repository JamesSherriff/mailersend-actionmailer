require 'mailersend-ruby'
require 'mailersend_actionmailer/railtie' if defined? Rails


module MailerSendActionMailer
  class DeliveryMethod
    DEFAULTS = {
    }

    attr_accessor :settings

    class DeliveryError < StandardError
    end

    def initialize(values)
      self.settings = self.class::DEFAULTS.merge(values)
      raise ArgumentError, ":arguments expected to be an Array of individual string args" if settings[:arguments].is_a?(String)
    end

    def deliver!(mail)
      email = Mailersend::Email.new

      mail.from.each do |from|
        email.add_from("email" => from)
      end

      mail.to.each do |to|
        email.add_recipients("email" => to)
      end

      email.add_reply_to mail.reply_to
      email.add_subject mail.subject

      if mail.mime_type == "text/plain"
        email.add_text mail.body.raw_source
      else
        email.add_html mail.body.raw_source
      end

      if mail.cc
        mail.cc.each do |cc|
          email.add_cc("email" => cc)
        end
      end

      if mail.bcc
        mail.bcc.each do |bcc|
          email.add_bcc("email" => bcc)
        end
      end

      if mail.attachments
        mail.attachments.each do |attachment|
          email.add_attachment attachment
        end
      end

      email.send
    end
  end
end
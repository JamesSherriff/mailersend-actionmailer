module MailerSendActionMailer
	class Railtie < Rails::Railtie
		initializer 'mailersend_actionmailer.add_delivery_method', before: 'action_mailer.set_configs' do
			ActiveSupport.on_load(:action_mailer) do
				ActionMailer::Base.add_delivery_method(:mailersend_actionmailer, MailerSendActionMailer::DeliveryMethod)
			end
		end
	end
end
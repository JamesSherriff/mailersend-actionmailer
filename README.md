# USAGE

- Add `mailersend-actionmailer` to your Gemfile
- Add `config.action_mailer.delivery_method = :mailersend_actionmailer` to your environment config file.
- Generate a MailerSend API token matching the domain for the from address your application will be using. Make sure it has the 'Email' permission.
- Add MAILERSEND_API_TOKEN to your .env file with the generated API token (or store as an environment variable another way)
Gem::Specification.new do |s|
  s.name        = 'mailersend-actionmailer'
  s.version     = '0.0.1'
  s.summary     = "ActionMailer delivery method for MailerSend API"
  s.description = "An ActionMailer delivery method using the MailerSend Ruby SDK to send emails with their API"
  s.authors     = ["James Sherriff"]
  s.email       = 'james.sherriff@widgit.com'
  s.files       =  Dir['lib/**/*.rb']

  s.add_dependency 'mail', '~> 2.7'
  s.add_dependency 'mailersend-ruby', '~> 1.6'
end
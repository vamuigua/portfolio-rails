class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  #hidden field to prevent span bots from filling in
  attribute :nickname,  :captcha  => true

  def headers
  	{
      :subject => "Contact Form",
      :to => "vamuigua@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end

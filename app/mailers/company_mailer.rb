class CompanyMailer < ApplicationMailer
  default from: "xxx@gmail.com"
  def shownInterest(company, user)
    @company=company
    @user=user

    mail to: company.email, subject: "GetAJob"
  end
end

require 'test_helper'

class CompanyMailerTest < ActionMailer::TestCase
  test "shownInterest" do
    mail = CompanyMailer.shownInterest
    assert_equal "Showninterest", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

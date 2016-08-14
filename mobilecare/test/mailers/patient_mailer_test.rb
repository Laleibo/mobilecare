# test "follow up" do
#   target_email = "me@example.com"
#   email = UserMailer.follow_up(target_email).deliver_now
#
#   assert_not ActionMailer::Base.deliveries.empty?
#   assert_equal [target_email], email.to
#   assert_equal "How are things going?", email.subject
#   assert_match "Twitter and Facebook", mail.body.encoded
# end

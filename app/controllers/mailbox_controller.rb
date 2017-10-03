class MailboxController < ApplicationController
  before_action :authenticate_user!

  def inbox
    @inbox = mailbox.inbox
    @active = :inbox
    skip_authorization
  end

  def sentbox
    @sent = mailbox.sentbox
    @active = :sentbox
    skip_authorization
  end

  def trash
    @trash = mailbox.trash
    @active = :trash
    skip_authorization
  end
end

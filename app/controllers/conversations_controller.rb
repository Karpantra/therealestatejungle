class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
    skip_authorization
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    binding.pry
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    create_contact(recipients)
    flash[:notice] = "Your message was successfully sent!"
    redirect_to :back
    skip_authorization
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
    skip_authorization
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
    skip_authorization
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
    skip_authorization
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
    skip_authorization
  end

  private

  def create_contact(list_of_user = [])
    list_of_user.each do |user|
      sender = Contact.new(owner: current_user, user: user)
      recipient = Contact.new(owner: user, user: current_user)
      sender.valid? ? sender.save : "Contact already exist"
      recipient.valid? ? recipient.save : "Contact already exist"
    end
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end

  def conversation_params
    params.require(:conversation).permit(:subject, :body, recipients:[])
  end
end

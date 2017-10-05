class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
    skip_authorization
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message was successfully sent!"
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

  def message_params
    params.require(:message).permit(:body, :subject)
  end

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end
end

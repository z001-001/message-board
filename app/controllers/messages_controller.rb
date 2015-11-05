class MessagesController < ApplicationController
  def index
    # Messageをすべて取得する。
    @messages = Message.all
    @message = Message.new
  end
  
  ## ここから
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: 'メッセージを保存しました'
    else
      # メッセージを保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  ## ここまで
end

class CaughtFishesController < ApplicationController
  include SessionsHelper
  before_action :set_event, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  before_action :current_user, only: [:new, :show, :edit, :destroy]
  before_action :set_caught_fish, only: [:edit, :update, :destroy]
  
  def index
    logger.debug("Debug into caught_fish index 1 -----")
    
    if !logged_in?
      redirect_to new_session_path
    end
    @caught_fishes = CaughtFish.where(event_id: @event.id)
    #binding.pry # ブレークポイントを設定
  end

  def new
    logger.debug("Debug into caught_fish new 1 -----")
    
    if !logged_in?
      redirect_to new_session_path
    end
  
    if params[:back]
      @caught_fish = CaughtFish.new(caught_fish_params)
      @caught_fish.event_id = @event.id
      
      if !params[:cache].nil? && params[:cache][:image].present?
        # Feedテーブルの中に、imageのカラム（画像アップロード用のカラム）以外のものがある場合、
        # Feed.newではなくFeed.new(feed_params)にする。
        @fish_images = FishImage.new(fish_image_params)
        # 画像保存（create）の際に、キャッシュから画像を復元してnewに入れる
        # newに戻る際も、createと同様に復元処理が必要となる。
        @fish_image.image.retrieve_from_cache! params[:cache][:image]
      end
      
    else
      @caught_fish = CaughtFish.new
      @fish_image = FishImage.new()
    end

  logger.debug("Debug caught_fish new2-----")
  logger.debug(@caught_fish)
  logger.debug(@fish_image)

  end
  
  def create
    logger.debug("Debug into caught_fish create 1 -----")
    @caught_fish = CaughtFish.new(caught_fish_params)
    @caught_fish.event_id = @event.id
    @caught_fish.caught_number = params[:caught_fish][:caught_number].tr('０-９', '0-9')

    #binding.pry # ブレークポイントを設定
    logger.debug("Debug caught_fish create1-----")
    logger.debug(@event)
    logger.debug(@caught_fish)
    logger.debug(@fish_image)
    
    if !params[:caught_fish].nil? && params[:caught_fish][:fish_image][:image].present?
      
      logger.debug("Debug fish_image create-----")
      @fish_image = FishImage.new({:image => params[:caught_fish][:fish_image][:image]})
      logger.debug("Debug caught_fish create2-----")
      logger.debug(@fish_image)
      #@fish_image.image.retrieve_from_cache! params[:cache][:image]
    end

    if @caught_fish.save
      #binding.pry # ブレークポイントを設定
      if !params[:caught_fish].nil? && params[:caught_fish][:fish_image][:image].present?
        @fish_image.event_id = @caught_fish.event_id
        @fish_image.caught_fish_id = @caught_fish.id
        @fish_image.save
      end
      
      # 一覧画面へ遷移して"釣果を登録しました！"とメッセージを表示します。
      redirect_to caught_fishes_path, notice: "釣果を登録しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
    
  end
  
  def show
    logger.debug("Debug into caught_fish show 1 -----")
    if !logged_in?
      redirect_to new_session_path
    end
    redirect_to caught_fishes_path
  end
  
  def edit
    logger.debug("Debug into caught_fish edit 1 -----")
    if !logged_in?
      redirect_to new_session_path
    end
    @fish_images = @caught_fish.fish_images.where(caught_fish_id: @caught_fish.id)
  end
  
  def update
    logger.debug("Debug into caught_fish update 1 -----")
    #binding.pry # ブレークポイントを設定
    if !params[:caught_fish].nil? && params[:caught_fish][:fish_image][:image].present?
      
      logger.debug("Debug fish_image create-----")
      @fish_image = FishImage.new({:image => params[:caught_fish][:fish_image][:image]})
      logger.debug("Debug caught_fish create2-----")
      logger.debug(@fish_image)
      #@fish_image.image.retrieve_from_cache! params[:cache][:image]
    end
    
    if @caught_fish.update(caught_fish_params)
      #binding.pry # ブレークポイントを設定
      if !params[:caught_fish].nil? && params[:caught_fish][:fish_image][:image].present?
        @fish_image.event_id = @caught_fish.event_id
        @fish_image.caught_fish_id = @caught_fish.id
        @fish_image.save
      end
      
      redirect_to caught_fishes_path, notice: "釣果を更新しました！"
    else
      redirect_to edit_caught_fish_path(@event,id: @caught_fish.id)
      #render 'edit'
    end
  end
  
  def destroy
    if !logged_in?
      redirect_to new_session_path
    end
    @caught_fish.destroy
    redirect_to caught_fishes_path, notice:"釣果を削除しました！"
  end
  
#  def confirm
#    @caught_fish = CaughtFish.new(caught_fish_params)
#    @caught_fish.event_id = @event.id
#    
#    logger.debug("Debug caught_fish confirm-----")
#    logger.debug(@caught_fish)
#    @fish_image = FishImage.new(fish_image_params)
#    
#    logger.debug("Debug fish_image confirm-----")
#    logger.debug(@fish_image)
#
#    render :new if @caught_fish.invalid?
#  end
  
  private
  def caught_fish_params
    params.require(:caught_fish).permit(:name,
    :size, :weight, 
    :tackle, :bait, 
    :caught_number, :caught_time,
    :description,
    fish_image_attributes: [:image,  :image_cache]
    )
  end
  
  def fish_image_params
    params.require(:fish_image).permit(:image, :image_cache)
  end

  
  private
  def set_event
    @event = Event.find(params[:event_id])
  end
  
  private
  def set_caught_fish
    @caught_fish = CaughtFish.find(params[:id])
  end
  
end

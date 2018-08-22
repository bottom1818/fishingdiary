class EventsController < ApplicationController
  include SessionsHelper
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:new, :show, :edit, :destroy]
  
  def index
    if params[:search]
      #binding.pry # ブレークポイントを設定
      @events = Event.search(params[:search])
      logger.debug("Debug into search-----")
      logger.debug(@event)
    else
      @events = Event.all
      logger.debug("Debug out of search-----")
      logger.debug(@event)
    end
    
  end

  def new
    if !logged_in?
      redirect_to new_session_path
    end
    if params[:back]
      @event = Event.new(event_params)
      #@event_option = EventOption.new(event_option_params)
      
      #binding.pry # ブレークポイントを設定
    else
      @event = Event.new
      #@event_option = EventOption.new()
    end
    @submit = '確認'
    #binding.pry # ブレークポイントを設定
    #@event.build_event_option
    @event.user = current_user

  logger.debug("Debug event new-----")
  logger.debug(@event)
  logger.debug(@event.user)

  end
  
  def create
    @event = Event.new(event_params)
    #@event_option = EventOption.new(event_option_params)
    #@event.build_event_option
    @event.user = current_user
    
    #binding.pry # ブレークポイントを設定
    logger.debug("Debug event create-----")
    logger.debug(@event)
    logger.debug(@event.user)
    
    if @event.save
      #@event_option.event_id = @event.id
      #@event_option.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to events_path, notice: "日記を作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
    
  end
  
  def show
    if !logged_in?
      redirect_to new_session_path
    end
    @favorite = current_user.favorites.find_by(event_id: @event.id)
  end
  
  def edit
    if !logged_in?
      redirect_to new_session_path
    end
    @submit = '更新'
    @event.start_date = @event.start_date.strftime("%Y-%m-%d")
    unless @event.end_date.blank?
      @event.end_date = @event.end_date.strftime("%Y-%m-%d")
    end
    #@event_option = @event.event_options.find_by(event_id: @event.id)
  end
  
  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "日記を編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    if !logged_in?
      redirect_to new_session_path
    end
    @event.destroy
    redirect_to events_path, notice:"日記を削除しました！"
  end
  
  def confirm
    @event = Event.new(event_params)
    @event.user = current_user
    
    #@event.build_event_option(event_params)
    
    #binding.pry # ブレークポイントを設定
    logger.debug("Debug event confirm-----")
    logger.debug(@event)
    logger.debug(@event.user)
    logger.debug(@event.event_option)
    logger.debug(@event.event_option.weather)
    logger.debug(@event.event_option.first_low_tide)

    @submit = '登録'
    render :new if @event.invalid?
  end
  
  private
  def event_params
    params.require(:event).permit(:spot_name,
    :start_date, :end_date, 
    :method, :target, :tackle, :bait, 
    :description,
    event_option_attributes: [:weather, 
    :max_temperature, :min_temperature, 
    :wind_speed, :wind_direction, 
    :wave_height,
    :location_latitude, :location_longitude, 
    :tide, :first_low_tide, :first_high_tide, :second_low_tide, :second_high_tide]
    )
  end
  
  def event_option_params
    params.require(:event_option).permit(:weather, :max_temperature, :min_temperature, :wind_speed, :wind_direction, :wave_height,
    :location_latitude, :location_longitude, :tide, :first_low_tide, :first_high_tide, :second_low_tide, :second_high_tide)
  end

  
  private
  def set_event
    @event = Event.find(params[:id])
  end


end

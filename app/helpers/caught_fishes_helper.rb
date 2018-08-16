module CaughtFishesHelper
  def caught_fish_choose_new_or_edit
    logger.debug("Debug into caught_fish_choose_new_or_edit 1 -----")
    if action_name == 'new'
      create_caught_fish_path(@event)
    elsif action_name == 'edit'
      logger.debug("Debug into caught_fish_choose_new_or_edit edit 1 -----")
      update_caught_fish_path(@event, id: @caught_fish.id)
    end
  end
end

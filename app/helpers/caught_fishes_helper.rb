module CaughtFishesHelper
  def caught_fish_choose_new_or_edit
    if action_name == 'new'
      create_caught_fish_path(@event)
    elsif action_name == 'edit'
      update_caught_fish_path(@event,id: @caught_fish.id)
    end
  end
end

module Helpers
  def active_copy(obj, active_id)
    obj.id == active_id ? 'active' : ''
  end
end


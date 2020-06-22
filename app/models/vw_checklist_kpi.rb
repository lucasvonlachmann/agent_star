class VwChecklistKpi < ActiveRecord::Base
  def readonly?
    true
  end

  belongs_to :scale
end

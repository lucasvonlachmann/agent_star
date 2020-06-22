class VwChecklistRootCause < ActiveRecord::Base
  def readonly?
    true
  end

  belongs_to :scale
  belongs_to :checklist
end

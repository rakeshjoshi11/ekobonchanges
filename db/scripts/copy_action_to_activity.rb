require 'rubygems'

Action.all.each do |a|
  activity = Activity.create(
    :project_name => a.project_name,
    :carbonoffset => a.carbonoffset,
    :offsetamount => a.offsetamount,
    :transaction_id => a.transaction_id,
    :partner_id => a.partner_id
  )
  activity.save!
end
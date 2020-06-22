select
s.id scale_id,
s.carrier_id,
ca.name carrier_name,
s.port_id,
p.name port_name,
s.vessel_id,
v.name vessel_name,
s.voyage,
s.service,
c.draft_arrival,
c.tugs_arrival,
c.eosp,
c.pob_arrival,
c.berthed,
c.gangway_ready,
c.started_ops,
c.completed_ops,
c.terminal_requested,
c.pob_departure,
c.last_line,
c.draft_departure,
c.tugs_departure,
c.remarks,
(c.berthed - c.eosp) waiting_time,
(c.started_ops - c.berthed) idle_time_arrival,
(c.last_line - c.completed_ops) idle_time_departure
from scales s
join checklists c on s.id = c.scale_id
join ports p on s.port_id = p.id
join carriers ca on s.carrier_id = ca.id
join vessels v on s.vessel_id =v.id

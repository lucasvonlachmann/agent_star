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
(DATE_PART('day', c.berthed::timestamp - c.eosp::timestamp) * 24 +
 DATE_PART('hour', c.berthed::timestamp - c.eosp::timestamp)) * 60 +
 DATE_PART('minute', c.berthed::timestamp - c.eosp::timestamp) waiting_time,
(DATE_PART('day', c.started_ops::timestamp - c.berthed::timestamp) * 24 +
 DATE_PART('hour', c.started_ops::timestamp - c.berthed::timestamp)) * 60 +
 DATE_PART('minute', c.started_ops::timestamp - c.berthed::timestamp) idle_time_arrival,
(DATE_PART('day', c.last_line::timestamp - c.completed_ops::timestamp) * 24 +
 DATE_PART('hour', c.last_line::timestamp - c.completed_ops::timestamp)) * 60 +
 DATE_PART('minute', c.last_line::timestamp - c.completed_ops::timestamp) idle_time_departure
from scales s
join checklists c on s.id = c.scale_id
join ports p on s.port_id = p.id
join carriers ca on s.carrier_id = ca.id
join vessels v on s.vessel_id =v.id

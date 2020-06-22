with aux as (
select
vc.scale_id,
vc.carrier_id,
vc.carrier_name,
vc.port_id,
vc.port_name,
vc.waiting_time,
vc.idle_time_arrival,
vc.idle_time_departure,
kt.id kpi_type_id,
kt.name kpi_name,
k.id kpi_id,
k.target kpi_target,
case
when kt.vw_name = 'idle_time_arrival' then k.target - vc.idle_time_arrival
when kt.vw_name = 'idle_time_departure' then k.target - vc.idle_time_departure
when kt.vw_name = 'waiting_time' then k.target - vc.waiting_time
else 0 end
as target_minus_actual
from vw_checklists vc
join kpis k on k.carrier_id =vc.carrier_id and k.port_id = vc.port_id
join kpi_types kt on kt.id = k.kpi_type_id)
select
scale_id,
carrier_id,
carrier_name,
port_id,
port_name,
waiting_time,
idle_time_arrival,
idle_time_departure,
kpi_type_id,
kpi_name,
kpi_id,
kpi_target,
target_minus_actual,
case
when target_minus_actual >= 0 then 'In'
when target_minus_actual < 0 then 'Out'
else 'x' end
as target_in_out
from aux

select
s.id scale_id,
c.id checklist_id,
rc.id root_cause_id,
rc.name,
kt.id kpi_type_id,
kt.name kpi_type_name
from checklist_root_causes crc
join checklists c on crc.checklist_id = c.id
join scales s on s.id = c.scale_id
join root_causes rc on crc.root_cause_id = rc.id
join kpi_types kt on kt.id = rc.kpi_type_id

#users
u1 = User.create!(email: "agent@mail.com", password: "123456")
puts "users created"

# ports
p1 = Port.create!(name: "RIO DE JANEIRO")
p2 = Port.create!(name: "SANTOS")
p3 = Port.create!(name: "ITAJAI")
puts "ports created"

# vessels
v1 = Vessel.create!(name: "VESSEL 1")
v2 = Vessel.create!(name: "VESSEL 2")
v3 = Vessel.create!(name: "VESSEL 3")
puts "vessels created"

# carriers
maersk = Carrier.create!(name: "MAERSK")
alianca = Carrier.create!(name: "ALIANÇA")
puts "carriers created"

# kpi types
wt = KpiType.create!(name: "WAITING TIME", vw_name: "waiting_time")
ia = KpiType.create!(name: "IDLE TIME ARRIVAL", vw_name: "idle_time_arrival")
id = KpiType.create!(name: "IDLE TIME DEPARTURE", vw_name: "idle_time_departure")
puts "kpis types created"

# root causes
RootCause.create!(kpi_type: wt, name: "MINIMUM SPEED")
RootCause.create!(kpi_type: wt, name: "MANEUVERS")
RootCause.create!(kpi_type: wt, name: "BERTH CONGESTION")
RootCause.create!(kpi_type: ia, name: "TERMINAL")
RootCause.create!(kpi_type: ia, name: "PRE STOWAGE PLAN")
RootCause.create!(kpi_type: ia, name: "LINE DECISION")
RootCause.create!(kpi_type: id, name: "MANEUVERS")
RootCause.create!(kpi_type: id, name: "REEFER MALFUNCTION")
RootCause.create!(kpi_type: id, name: "TIDE RESTRICTION")
puts "root causes created"

# kpis
Carrier.all.each do |carrier|
  Port.all.each do |port|
    KpiType.all.each do |kpi_type|
      Kpi.create!(carrier: carrier,
                  port: port,
                  kpi_type: kpi_type,
                  target: [60, 80, 100, 120, 140].sample,
                  max_limit: 0, min_limit: 0)
    end
  end
end
puts "kpis created"

# scales
counter = 1
Carrier.all.each do |carrier|
  Port.all.each do |port|
    Vessel.all.each do |vessel|
      Scale.create!(carrier: carrier,
                  port: port,
                  vessel: vessel,
                  voyage: "VOYAGE - #{counter}",
                  service: ["SERVICE - 1", "SERVICE - 2", "SERVICE - 3", "SERVICE - 4"].sample)
      counter += 1
    end
  end
end
puts "scales created"

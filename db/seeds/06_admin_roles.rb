roles = [
  {name: "super_admin"},
  {name: "admin"},
  {name: "staff"},
  {name: "customer"}
]

Role.bulk_insert(values: roles) if Role.count.zero?
 
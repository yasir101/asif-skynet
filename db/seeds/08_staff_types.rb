staff_types = [
  {name: "Admin"},
  {name: "Line Man"},
  {name: "Recovery"},
  {name: "Helper"}
]

StaffType.bulk_insert(values: staff_types) if StaffType.count.zero?
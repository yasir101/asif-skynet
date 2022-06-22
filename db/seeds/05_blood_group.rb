groups = [
  {name: "A+"},
  {name: "A-"},
  {name: "B+"},
  {name: "B-"},
  {name: "O+"},
  {name: "O-"},
  {name: "AB+"},
  {name: "AB-"}
]

BloodGroup.bulk_insert(values: groups) if BloodGroup.count.zero?
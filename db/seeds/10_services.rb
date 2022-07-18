services = [
  {name: 'Internet'},
  {name: 'Cable'},
  {name: 'Both'}
]

Service.bulk_insert(values: services) if Service.count.zero?
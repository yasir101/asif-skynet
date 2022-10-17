services = [
  {name: 'Internet'},
  {name: 'Cable'}
]

Service.bulk_insert(values: services) if Service.count.zero?
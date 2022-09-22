services = [
  {name: 'Internet'},
  {name: 'FTTH'},
  {name: 'Cable'}
]

Service.bulk_insert(values: services) if Service.count.zero?
internet_type = [
  {name: 'Ethernet'},
  {name: 'FTTH'}
]

InternetType.bulk_insert(values: internet_type) if InternetType.count.zero?
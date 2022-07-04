companies = [
  {name: 'Leo'}
]

Company.bulk_insert(values: companies) if Company.count.zero?
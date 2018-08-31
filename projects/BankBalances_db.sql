select 'Balances',
  concat ('$', format(sum(Balance), 2)) as 'Balance Total',
  concat ('$', format(sum(Fees), 2)) as 'Fees Total'
  from accounts
  

  
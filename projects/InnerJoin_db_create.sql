-- inner join
select Account_holder, balance, fees, Amount, Txn_type
  from
   transactions t
      inner join
    accounts accts
	on accts.ID = t.account_ID;
    -- on accts.ID = t.AccountID; aligns the columns from both columns.
    
-- left outer join (acts like and "or")
select Account_holder, balance, fees, Amount, Txn_type
  from accounts accts
  left outer join transactions t
    on accts.id = t.account_id;


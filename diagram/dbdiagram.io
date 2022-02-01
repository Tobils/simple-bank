Table Accounts as A {
  id bigserial [pk]
  owner varchar [not null]
  balance bigint [not null]
  currency varchar [not null]
  created_at timestamptz [default: 'now()']

  Indexes {
    owner
  }
}

Table entries {
  id bigserial [pk]
  account_id bigint [ref: > A.id]
  amount bigint [not null, note: 'Can be negative or positive']
  created_at timestamptz [default: 'now()']

  Indexes {
    account_id
  }
}

Table transfers {
  id bigint [pk]
  from_account_id bigint [ref: > A.id]
  to_account_id bigint [ref: > A.id]
  amount bigint [not null, note: 'It must be positive']
  created_at timestamptz [default: 'now()']

  Indexes {
    from_account_id
    to_account_id
    (from_account_id, to_account_id)
  }
}


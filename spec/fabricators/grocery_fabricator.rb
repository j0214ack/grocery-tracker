Fabricator(:grocery) do
  name { %w(milk steak onion pork coke juice egg).sample }
  count { Array(1..10).sample }
  unit { %w(g kg L bottle piece).sample }
  exp_date { Date.today }
  user
end

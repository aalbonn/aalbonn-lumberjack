local Translations = {
  blip = {
    lumj = 'Lumberjack',
    pwood = 'Process Wood',
    swood = 'Sell Wood',
  },
  error = {
    no_wood = 'You don\'t have the wood',
    no_tallwood = 'You don\'t have the tallwood',
  },
  success = {
    sc_wood = 'You have successfully cut the wood',
    sp_wood = 'The wood successfully processed',
    sold_wood ='Successfully sold for $%{money}'
  },
  target = {
    cwood = 'Cut Wood',
    pwood = 'Processing Wood',
    tt_seller = 'Talk to Seller'
  },
  menu = {
    lj_seller = 'LumberJack Seller',
    sl_wood = '🪓 Selling Wood',
    close = 'Close',
  },
  info = {
    cut_wood = "Cutting Wood",
    proc_wood = "Processing Wood",
    polish_wood = "Polishing Wood",
    sell_wood = "Selling Wood",
    no_item = "You dont have Right item",
  },
}

Lang = Locale:new({
  phrases = Translations,
  warnOnMissing = true,
})
databasemenu = {
  { "sqlcheck",     "urxvt -e sh -c 'sqlcheck -h ; bash'" },
  { "sqldata",      "urxvt -e sh -c 'sqldata -h ; bash'" },
  { "getsids",      "urxvt -e sh -c 'getsids ; bash'" },
  { "metacoretex",  "urxvt -e sh -c 'metacoretex ; bash'" },
  { "mysql2sqlite", "urxvt -e sh -c 'mysql2sqlite -h ; bash'" },
  { "pgdbf",        "urxvt -e sh -c 'pgdbf -h ; bash'" },
  { "unibrute",     "urxvt -e sh -c 'unibrute ; bash'" },
}

return databasemenu

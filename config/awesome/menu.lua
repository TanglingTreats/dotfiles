local awful = require("awful")
local beautiful = require("beautiful")

-- Create a laucher widget and a main menu
myawesomemenu = {
  { "manual",      terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart",     awesome.restart },
  { "quit",        awesome.quit }
}

termmenu = {
  { "alacritty",     "alacritty" },
  { "term (grey)",   "urxvt -bg black -fg grey" },
  { "term (red)",    "urxvt -bg black -fg red" },
  { "term (green)",  "urxvt -bg black -fg green" },
  { "term (yellow)", "urxvt -bg black -fg yellow" },
  { "term (white)",  "urxvt -bg black -fg white" }
}

browsermenu = {
  { "firefox",  "firefox" },
  { "chromium", "chromium --no-sandbox" }
}

networkmenu = {
  { "wifi-radar",        "wifi-radar" },
  { "wifi-radar-polkit", "wifi-radar-polkit" }
}

blackarchmenu = {
  { "anti-forensic", antiforensicmenu },
  { "automation",    automationmenu },
  { "automobile",    automobilemenu },
  { "backdoor",      backdoormenu },
  { "binary",        binarymenu },
  { "bluetooth",     bluetoothmenu },
  { "code-audit",    codeauditmenu },
  { "config",        configmenu },
  { "cracker",       crackermenu },
  { "crypto",        cryptomenu },
  { "database",      databasemenu },
  { "debugger",      debuggermenu },
  { "decompiler",    decompilermenu },
  { "defensive",     defensivemenu },
  { "disassembler",  disassemblermenu },
  { "dos",           dosmenu },
  { "drone",         dronemenu },
  { "exploitation",  exploitationmenu },
  { "fingerprint",   fingerprintmenu },
  { "firmware",      firmwaremenu },
  { "forensic",      forensicmenu },
  { "fuzzer",        fuzzermenu },
  { "hardware",      hardwaremenu },
  { "honeypot",      honeypotmenu },
  { "ids",           idsmenu },
  { "keylogger",     keyloggermenu },
  { "malware",       malwaremenu },
  { "misc",          miscmenu },
  { "mobile",        mobilemenu },
  { "networking",    networkingmenu },
  { "nfc",           nfcmenu },
  { "packer",        packermenu },
  { "proxy",         proxymenu },
  { "radio",         radiomenu },
  { "recon",         reconmenu },
  { "reversing",     reversingmenu },
  { "scanner",       scannermenu },
  { "scanners",      scannersmenu },
  { "sniffer",       sniffermenu },
  { "social",        socialmenu },
  { "spoof",         spoofmenu },
  { "stego",         stegomenu },
  { "tunnel",        tunnelmenu },
  { "unpacker",      unpackermenu },
  { "voip",          voipmenu },
  { "webapp",        webappmenu },
  { "windows",       windowsmenu },
  { "wireless",      wirelessmenu },
}

mymainmenu = awful.menu({
  items = {
    { "awesome",   myawesomemenu, beautiful.awesome_icon },
    { "terminals", termmenu },
    { "browsers",  browsermenu },
    { "network",   networkmenu },
    { "blackarch", blackarchmenu }
  }
})

return mymainmenu

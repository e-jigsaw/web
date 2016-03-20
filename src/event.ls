req, sender, callback <- chrome.runtime.on-message.add-listener

if req.cmd is \get
  chrome.tabs.query do
    last-focused-window: true
    active: true
    (tab)-> callback tab

if req.cmd is \open
  date = new Date!
  chrome.tabs.create do
    url: "https://github.com/e-jigsaw/web/edit/master/data/#{date.get-full-year!}/#{date.get-month! + 1}/index.json"

true

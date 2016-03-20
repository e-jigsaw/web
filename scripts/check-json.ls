require! {
  fs: {read-file-sync}
}

date = new Date!
target = read-file-sync "./data/#{date.get-full-year!}/#{date.get-month! + 1}/index.json" .to-string!

JSON.parse target

vim.filetype.add({
  extension = {
    http = 'http',
    d2 = 'd2',
    png = 'png',
    jpg = 'jpg',
    gif = 'gif',
    mp4 = 'mp4',
    webm = 'webm',
    pdf = 'pdf',
  },
  pattern = {
    ['*.*xaml'] = 'xml',
  },
  filename = {
    ['.swcrc'] = 'json',
    lfrc = 'lf',
  }
})

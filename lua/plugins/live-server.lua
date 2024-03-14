return {
  'barrett-ruth/live-server.nvim',
  build = 'npm install -g live-server',
  enabled = true,
  config = function ()
    require('live-server').setup()
  end
}

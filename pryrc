# vim: ft=ruby
Pry.config.theme = "monokai"
Pry.prompt = [
  proc { |target_self, nest_level, pry|
    "[#{pry.input_array.size}] (\001\e[0;33m\002#{Pry.view_clip(target_self)}\001\e[0m\002)#{":#{nest_level}" unless nest_level.zero?}> "
  },
  proc { |target_self, nest_level, pry|
    "[#{pry.input_array.size}] (\001\e[1;33m\002#{Pry.view_clip(target_self)}\001\e[0m\002)#{":#{nest_level}" unless nest_level.zero?}* "
  }
]
Pry.config.editor = proc { |file, line| "env MDX_CHAMELEON_MODE=ruby nvim #{file} +#{line}" }

local present, comment = pcall(require, "Comment")

if not present then
  return
end

local config = {
  mappings = false
}

comment.setup(config)

local present, nvim_comment = pcall(require, "Comment")

if not present then
  return
end

local config = {
  padding = false,
}

nvim_comment.setup(config)

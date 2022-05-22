local customFinders = {}
exec = function(command)
	local handle = io.popen(command)
	local result = handle:read("*a"):gsub("\n","")
	handle:close()
	return result
end
getPwd = function()
	isGit = exec('git rev-parse --is-inside-work-tree')
	if isGit == 'true' then
		pwd = exec('git rev-parse --show-toplevel', true)
	else 
		pwd = exec('pwd')
	end
	return pwd
end
customFinders.search_project = function()
    require("telescope.builtin").find_files({
        prompt_title = "Files in Project";
	cwd = getPwd()
    })
end


customFinders.grep_project = function()
    require("telescope.builtin").live_grep({
        prompt_title = "Text in project files";
	cwd = getPwd()
    })
end

customFinders.grep_reference = function()
    require("telescope.builtin").live_grep({
        prompt_title = "<Find Files>";
        search = "test";
	cwd = getPwd()
    })
end

return customFinders

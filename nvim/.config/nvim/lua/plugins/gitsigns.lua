return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, { desc = "Jump To Next Git [C]hange" })

                map("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, { desc = "Jump To Previous Git [C]hange" })

                -- Actions
                -- visual mode
                map("v", "<leader>gs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "stage git hunk" })
                map("v", "<leader>gr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "reset git hunk" })
                -- normal mode
                map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[G]it [S]tage Hunk" })
                map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[G]it [R]eset Hunk" })
                map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[G]it [S]tage Buffer" })
                map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[G]it [R]eset Buffer" })
                map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "[G]it [U]ndo Stage Hunk" })
                map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[G]it [P]review Hunk" })
                map("n", "<leader>gb", gitsigns.blame_line, { desc = "[G]it [B]lame" })
                map("n", "<leader>gd", gitsigns.diffthis, { desc = "[G]it [D]iff" })
                map("n", "<leader>gD", function()
                    gitsigns.diffthis("@")
                end, { desc = "[G]it [D]iff Last Commit" })
                -- Toggles
                map("n", "<leader>gbt", gitsigns.toggle_current_line_blame, { desc = "[G]it [B]lame [T]oggle" })
                map("n", "<leader>gbd", gitsigns.toggle_deleted, { desc = "[G]it [D]eleted [T]oggle" })
            end,
        },
    },
}

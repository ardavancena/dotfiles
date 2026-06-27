hl.config({
    input = {
        kb_layout = "us,ir",
        kb_variant = ",winkeys",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
    },
})

-- 3. Key Repeat Rate (Highly recommended for fast typing/navigation)
hl.config({
    input = {
        repeat_rate = 45,
        repeat_delay = 500,
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
        },
    },
})

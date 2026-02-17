# Read the CSS file
$filePath = "C:\Users\Admin\AppData\Roaming\Equicord\dev\themes\Fluent-Discord.css"
$content = Get-Content $filePath -Raw
# Define section comments to insert BEFORE specific CSS selectors/lines
# Format: [unique target string] => [comment to insert before it]
$insertions = [ordered]@{
    # ===== ROOT / VARIABLES =====
    # Line ~8 after the header comment block - the misplaced comment at line 9 already exists, skip
    # ===== FONTS =====
    '@font-face {' = "/* =============================================================`r`n * Fonts`r`n * ============================================================= */`r`n"
    # ===== ACRYLIC BACKGROUND =====
    '.theme-dark .app__5765e::before {' = "/* =============================================================`r`n * Acrylic Background`r`n * ============================================================= */`r`n"
    # ===== TITLEBAR =====
    '.theme-dark .bar_c38106 {' = "/* =============================================================`r`n * Titlebar`r`n * ============================================================= */`r`n"
    # ===== SCROLLBAR =====
    '.theme-dark ::-webkit-scrollbar {' = "/* =============================================================`r`n * Scrollbar`r`n * ============================================================= */`r`n"
    # ===== TEXT INPUTS =====
    '.theme-dark .input__3f21e {' = "/* =============================================================`r`n * Text Inputs`r`n * ============================================================= */`r`n"
    # ===== BUTTONS =====
    '.theme-dark .button__201d5 {' = "/* =============================================================`r`n * Buttons`r`n * ============================================================= */`r`n"
    # ===== CONTEXT MENU =====
    '.theme-dark .menu_c1e9c4 {' = "/* =============================================================`r`n * Context Menu`r`n * ============================================================= */`r`n"
    # ===== TOGGLE / CHECKBOX =====
    '.theme-dark .container__3a18a {' = "/* =============================================================`r`n * Toggle / Checkbox`r`n * ============================================================= */`r`n"
    # ===== TOOLTIP =====
    '.theme-dark .tooltip__46f72 {' = "/* =============================================================`r`n * Tooltip`r`n * ============================================================= */`r`n"
    # ===== USER PANEL =====
    '.theme-dark .panels__5e434 {' = "/* =============================================================`r`n * User Panel (Bottom Left)`r`n * ============================================================= */`r`n"
    # ===== CHANNEL LIST / SIDEBAR =====
    '.theme-dark .sidebar_e44312 {' = "/* =============================================================`r`n * Channel List / Sidebar`r`n * ============================================================= */`r`n"
    # ===== CHAT AREA / MESSAGES =====
    '.theme-dark .chat_ee72fa {' = "/* =============================================================`r`n * Chat Area / Messages`r`n * ============================================================= */`r`n"
    # ===== EMBEDS =====
    '.theme-dark .embedFull__33d30 {' = "/* =============================================================`r`n * Embeds`r`n * ============================================================= */`r`n"
    # ===== GUILD / SERVER BAR =====
    '.theme-dark .wrapper_a6ce15 {' = "/* =============================================================`r`n * Guild / Server Bar`r`n * ============================================================= */`r`n"
    # ===== MEMBERS LIST =====
    '.theme-dark .membersWrap_c8ffbb {' = "/* =============================================================`r`n * Members List`r`n * ============================================================= */`r`n"
    # ===== SEARCH BAR =====
    '.theme-dark .search_e0a55d {' = "/* =============================================================`r`n * Search Bar`r`n * ============================================================= */`r`n"
    # ===== HEADER / TOOLBAR =====
    '.theme-dark .container__9293f {' = "/* =============================================================`r`n * Header / Toolbar`r`n * ============================================================= */`r`n"
    # ===== NOW PLAYING =====
    '.theme-dark .container_6sXIoE {' = "/* =============================================================`r`n * Now Playing / Spotify`r`n * ============================================================= */`r`n"
    # ===== DMs =====
    '.theme-dark .channel__17938 {' = "/* =============================================================`r`n * Direct Messages`r`n * ============================================================= */`r`n"
    # ===== PROFILE PANEL / USER POPOUT =====
    '.theme-dark .userProfileOuterThemed__1fc21 {' = "/* =============================================================`r`n * Profile Panel / User Popout`r`n * ============================================================= */`r`n"
    # ===== FRIENDS LIST =====
    '.theme-dark .peopleList__5ec2f {' = "/* =============================================================`r`n * Friends List`r`n * ============================================================= */`r`n"
    # ===== GUILD DISCOVERY =====
    '.theme-dark .pageWrapper__6b1e4 {' = "/* =============================================================`r`n * Guild Discovery`r`n * ============================================================= */`r`n"
    # ===== LOADING SCREEN =====
    '.theme-dark .container_ee7776 {' = "/* =============================================================`r`n * Loading Screen`r`n * ============================================================= */`r`n"
    # ===== MODALS =====
    '.theme-dark .modal__2700d {' = "/* =============================================================`r`n * Modals`r`n * ============================================================= */`r`n"
    # ===== QUICKSWITCHER =====
    '.theme-dark .quickswitcher_ccbbab {' = "/* =============================================================`r`n * Quickswitcher`r`n * ============================================================= */`r`n"
    # ===== REACTIONS =====
    '.theme-dark .reaction_ec6b19 {' = "/* =============================================================`r`n * Reactions`r`n * ============================================================= */`r`n"
    # ===== EMOJI PICKER =====
    '.theme-dark .contentWrapper__08434 {' = "/* =============================================================`r`n * Emoji / Sticker / GIF Picker`r`n * ============================================================= */`r`n"
    # ===== SETTINGS SIDEBAR =====
    '.theme-dark .sidebar__409aa {' = "/* =============================================================`r`n * Settings Sidebar`r`n * ============================================================= */`r`n"
    # ===== SYNTAX HIGHLIGHTING =====
    '.theme-dark .hljs {' = "/* =============================================================`r`n * Syntax Highlighting (Code Blocks)`r`n * ============================================================= */`r`n"
    # ===== BETTERDISCORD =====
    '#bd-editor-controls {' = "/* =============================================================`r`n * BetterDiscord Styles`r`n * ============================================================= */`r`n"
    # ===== VENCORD =====
    '.vc-settings-quickActions-card {' = "/* =============================================================`r`n * Vencord Styles`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS (Fluent Icons) ΓÇö User Panel =====
    'html[lang^=en-].theme-dark .panels__5e434 .button__201d5[aria-label=Deafen]' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö User Panel Buttons`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Message Action Bar =====
    'html[lang^=en-].theme-dark .wrapper_f7ecac .button_f7ecac[aria-label=Reply]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Message Action Bar`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Toolbar =====
    'html[lang^=en-].theme-dark .toolbar__9293f .iconWrapper__9293f[aria-label=Threads]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Toolbar Icons`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Settings Cog Menu =====
    '.theme-dark .menu_c1e9c4 .item_c1e9c4[id=user-settings-cog-My_Account]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Settings Cog Menu`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö User Context Menu =====
    '.theme-dark .menu_c1e9c4 .item_c1e9c4[id=user-context-user-profile]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö User Context Menu`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Guild Header Menu =====
    '.theme-dark .menu_c1e9c4 .item_c1e9c4[id=guild-header-popout-premium-subscribe]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Guild Header Menu`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Channel Context Menu =====
    '.theme-dark .menu_c1e9c4 .item_c1e9c4[id=channel-context-mark-channel-read]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Channel Context Menu`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Guild Context Menu =====
    '.theme-dark .menu_c1e9c4 .item_c1e9c4[id=guild-context-mark-guild-read]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Guild Context Menu`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Message Context Menu =====
    '.theme-dark .menu_c1e9c4 .item_c1e9c4[id=message-add-reaction]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Message Context Menu`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Thread Context Menu =====
    '.theme-dark .menu_c1e9c4 .item_c1e9c4[id=thread-context-join-thread]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Thread Context Menu`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Textarea Context Menu =====
    '.theme-dark .menu_c1e9c4 .item_c1e9c4[id=textarea-context-suggestions]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Textarea Context Menu`r`n * ============================================================= */`r`n"
    # ===== ICON REPLACEMENTS ΓÇö Channel Attach Menu =====
    '.theme-dark .menu_c1e9c4 .item_c1e9c4[id=channel-attach-upload-file]::before {' = "/* =============================================================`r`n * Fluent Icon Replacements ΓÇö Channel Attach Menu`r`n * ============================================================= */`r`n"
    # ===== LOADING SPINNER =====
    '.spinner__46696 .inner__46696:not(.pulsingEllipsis__46696) {' = "/* =============================================================`r`n * Loading Spinner`r`n * ============================================================= */`r`n"
    # ===== USER OPTIONS =====
    # Already exists at line 11610
    # ===== KEYFRAMES =====
    '@keyframes fluent-loading-circle {' = "/* =============================================================`r`n * Loading Animation Keyframes`r`n * ============================================================= */`r`n"
}
# Process insertions - only insert before the FIRST occurrence
$lines = $content -split "`r`n"
$processedTargets = @{}
foreach ($entry in $insertions.GetEnumerator()) {
    $target = $entry.Key
    $comment = $entry.Value
    # Find the first occurrence that doesn't already have a section comment above it
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i].TrimStart().StartsWith($target)) {
            # Check if the line above is already a section comment
            $prevLine = if ($i -gt 0) { $lines[$i-1].Trim() } else { "" }
            $prevPrevLine = if ($i -gt 1) { $lines[$i-2].Trim() } else { "" }
            $alreadyHasComment = $prevLine -match '^\*/' -or $prevLine -match '^\* ===' -or $prevPrevLine -match '^\* ==='
            if (-not $alreadyHasComment -and -not $processedTargets.ContainsKey($target)) {
                # Insert comment before this line
                $commentLines = $comment -split "`r`n"
                $newLines = @()
                for ($j = 0; $j -lt $i; $j++) {
                    $newLines += $lines[$j]
                }
                $newLines += $commentLines
                for ($j = $i; $j -lt $lines.Count; $j++) {
                    $newLines += $lines[$j]
                }
                $lines = $newLines
                $processedTargets[$target] = $true
                Write-Host "Inserted comment before: $target (line $($i+1))"
                break
            } else {
                $processedTargets[$target] = $true
                Write-Host "Skipped (already has comment): $target (line $($i+1))"
                break
            }
        }
    }
}
# Write back
$result = $lines -join "`r`n"
[System.IO.File]::WriteAllText($filePath, $result, [System.Text.Encoding]::UTF8)
Write-Host "`nDone! Total lines: $($lines.Count)"

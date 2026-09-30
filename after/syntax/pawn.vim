runtime! syntax/c.vim
unlet! b:current_syntax
 
" ---------------------------------------------------------------------------
" Core Pawn language keywords
" ---------------------------------------------------------------------------
syn keyword pawnKeyword public forward native stock state new const static
syn keyword pawnKeyword tagof sizeof defined __pragma
syn keyword pawnType Float bool String Text Text3D Text3D_S PlayerText PlayerText3D
syn keyword pawnConstant true false EOS INVALID_PLAYER_ID INVALID_VEHICLE_ID
syn keyword pawnConstant INVALID_OBJECT_ID INVALID_TEXT_DRAW INVALID_3DTEXT_ID
syn keyword pawnConstant INVALID_MENU INVALID_ACTOR_ID
 
" ---------------------------------------------------------------------------
" Gamemode / filterscript entry points
" ---------------------------------------------------------------------------
syn keyword pawnCallback OnGameModeInit OnGameModeExit OnFilterScriptInit OnFilterScriptExit
syn keyword pawnCallback OnRconCommand OnRconLoginAttempt
 
" ---------------------------------------------------------------------------
" Player callbacks
" ---------------------------------------------------------------------------
syn keyword pawnCallback OnPlayerConnect OnPlayerDisconnect OnPlayerSpawn OnPlayerDeath
syn keyword pawnCallback OnPlayerText OnPlayerCommandText OnPlayerRequestClass
syn keyword pawnCallback OnPlayerEnterVehicle OnPlayerExitVehicle OnPlayerStateChange
syn keyword pawnCallback OnPlayerEnterCheckpoint OnPlayerLeaveCheckpoint
syn keyword pawnCallback OnPlayerEnterRaceCheckpoint OnPlayerLeaveRaceCheckpoint
syn keyword pawnCallback OnPlayerRequestSpawn OnPlayerPickUpPickup OnPlayerSelectedMenuRow
syn keyword pawnCallback OnPlayerExitedMenu OnPlayerInteriorChange OnPlayerKeyStateChange
syn keyword pawnCallback OnPlayerUpdate OnPlayerStreamIn OnPlayerStreamOut
syn keyword pawnCallback OnDialogResponse OnPlayerClickMap OnPlayerClickTextDraw
syn keyword pawnCallback OnPlayerClickPlayerTextDraw OnPlayerClickPlayer
syn keyword pawnCallback OnPlayerEditObject OnPlayerEditAttachedObject OnPlayerSelectObject
syn keyword pawnCallback OnPlayerWeaponShot OnPlayerGiveDamage OnPlayerTakeDamage
syn keyword pawnCallback OnPlayerFinishedDownloading OnPlayerRequestDownload
syn keyword pawnCallback OnPlayerConnectGameMode OnPlayerDisconnectGameMode
syn keyword pawnCallback OnPlayerCameraTarget OnPlayerObjectMoved OnPlayerAttachedObjectEdited
syn keyword pawnCallback OnIncomingConnection OnTrailerUpdate OnUnoccupiedVehicleUpdate
 
" ---------------------------------------------------------------------------
" Vehicle / object / server callbacks
" ---------------------------------------------------------------------------
syn keyword pawnCallback OnVehicleSpawn OnVehicleDeath OnVehicleMod OnVehiclePaintjob
syn keyword pawnCallback OnVehicleRespray OnVehicleDamageStatusUpdate OnVehicleStreamIn
syn keyword pawnCallback OnVehicleStreamOut OnVehicleSirenStateChange OnVehicleTires
syn keyword pawnCallback OnObjectMoved OnPlayerObjectMoved
syn keyword pawnCallback OnActorStreamIn OnActorStreamOut
syn keyword pawnCallback OnPlayerCommandPerformed OnScriptInit
 
" ---------------------------------------------------------------------------
" Plugin: streamer (samp-incognito/samp-streamer-plugin)
" naming convention: Create/Destroy/Is/Get/Set/Move/Stop/Attach/Edit + Dynamic*
" ---------------------------------------------------------------------------
syn match pawnPluginFunc "\<CreateDynamic\w*\>"
syn match pawnPluginFunc "\<DestroyDynamic\w*\>"
syn match pawnPluginFunc "\<IsValidDynamic\w*\>"
syn match pawnPluginFunc "\<IsDynamic\w*\>"
syn match pawnPluginFunc "\<IsPlayerInDynamic\w*\>"
syn match pawnPluginFunc "\<GetDynamic\w*\>"
syn match pawnPluginFunc "\<SetDynamic\w*\>"
syn match pawnPluginFunc "\<MoveDynamic\w*\>"
syn match pawnPluginFunc "\<StopDynamic\w*\>"
syn match pawnPluginFunc "\<AttachDynamic\w*\>"
syn match pawnPluginFunc "\<AttachCameraToDynamic\w*\>"
syn match pawnPluginFunc "\<EditDynamic\w*\>"
syn match pawnPluginFunc "\<GetPlayerVisibleDynamic\w*\>"
syn match pawnPluginFunc "\<GetPlayerCameraTargetDyn\w*\>"
syn match pawnPluginFunc "\<Streamer_\w*\>"
syn keyword pawnConstant STREAMER_TYPE_OBJECT STREAMER_TYPE_PICKUP STREAMER_TYPE_CP
syn keyword pawnConstant STREAMER_TYPE_RACE_CP STREAMER_TYPE_MAP_ICON STREAMER_TYPE_3D_TEXT_LABEL
syn keyword pawnConstant STREAMER_TYPE_AREA STREAMER_TYPE_ACTOR
 
" ---------------------------------------------------------------------------
" Plugin: sscanf
" ---------------------------------------------------------------------------
syn keyword pawnPluginFunc sscanf
 
" ---------------------------------------------------------------------------
" Plugin: MySQL (BlueG / R44 mysql plugin) + cache_ functions
" ---------------------------------------------------------------------------
syn match pawnPluginFunc "\<mysql_\w*\>"
syn match pawnPluginFunc "\<cache_\w*\>"
 
" ---------------------------------------------------------------------------
" YSI / foreach iterators
" ---------------------------------------------------------------------------
syn keyword pawnPluginFunc foreach
syn match pawnPluginFunc "\<Iter_\w*\>"
syn match pawnPluginFunc "\<Y_\w*\>"
 
" ---------------------------------------------------------------------------
" zcmd / command processors: CMD:name(playerid, params[])
" ---------------------------------------------------------------------------
syn match pawnPluginFunc "\<CMD:\w*\>"
syn match pawnPluginFunc "\<COMMAND:\w*\>"
 
" ---------------------------------------------------------------------------
" Generic ALL_CAPS constants (SA-MP define convention: colors, weapons,
" dialog styles, player states, fight styles, etc.) — catches anything
" not explicitly listed above without needing an exhaustive list.
" ---------------------------------------------------------------------------
syn match pawnConstant "\<[A-Z][A-Z0-9]*\(_[A-Z0-9]\+\)\+\>"
 
" ---------------------------------------------------------------------------
" Highlight links
" ---------------------------------------------------------------------------
hi def link pawnKeyword    Keyword
hi def link pawnType       Type
hi def link pawnCallback   Function
hi def link pawnPluginFunc Function
hi def link pawnConstant   Constant
 
let b:current_syntax = "pawn"


Config = Config or {}

Config.DrawTextPosition = 'left'

Config.Title = '~g~Green Zone'

Config.SafeZoneLocations = {
    ['legionzone'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(240.53318786621, -821.82708740234),
                vector2(199.42294311523, -805.91107177734),
                vector2(230.56591796875, -725.1083984375),
                vector2(273.99462890625, -739.98522949219),
                vector2(265.07943725586, -769.07318115234),
                vector2(258.54092407227, -787.49444580078)
            },
            ['minZ'] = 29.11,
            ['maxZ'] = 34.64,
        },
        label = "Legion Safe Zone",
        showBlip = false,
        blipcoords = vector3(931.11, -3182.04, 5.9),
        blipName = "Green Zone",
        blipNumber = 489,
        blipColor = 2,
        type = 'green',
        drawText = 'Green Zone',
        debug = false,
    },
    ['pillboxzone'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(298.30651855469, -614.20422363281),
                vector2(269.59454345703, -603.12976074219),
                vector2(288.99291992188, -554.76043701172),
                vector2(295.32189941406, -554.52856445312),
                vector2(375.73916625977, -561.32110595703),
                vector2(355.15493774414, -609.73461914062)
            },
            ['minZ'] = 28.82,
            ['maxZ'] = 45.45,
        },
        label = "Pillbox Safe Zone",
        showBlip = false,
        blipcoords = vector3(911.03, -3187.47, 5.9),
        blipName = "Green Zone",
        blipNumber = 489,
        blipColor = 2,
        type = 'green',
        drawText = 'Green Zone',
        debug = false,
    },
}
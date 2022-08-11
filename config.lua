Config = {}

Config.Blips = {
    [1] = {
        coords = vector3(-531.17, 5369.73, 70.29),
        label = Lang:t('blip.lumj'),
        sprite = 238,
        scale = 0.6,
        color = 10,
    },
    [2] = {
        coords = vector3(-551.19, 5329.92, 73.76),
        label = Lang:t('blip.pwood'),
        sprite = 238,
        scale = 0.6,
        color = 10,
    },
    [3] = {
        coords = vector3(-1046.02, -2015.17, 12.16),
        label =  Lang:t('blip.swood'),
        sprite = 642,
        scale = 0.6,
        color = 10,
    }
}

Config.Prices = {
    ['tallwood'] = math.random(190,245)
}

Config.Locations = {
    ["lumberjack"] = {
        [1] = {
            coords = vector4(-531.17, 5369.73, 70.29, 71.47),
            heading = 250.0,
            length = 10.0,
            width = 5.0,
            label = Lang:t('blip.lumj'),
            sprite = 77,
            scale = 0.6,
            color = 77,
        },
    },
    ["process1"] = {
        [1] = {
            coords = vector4(-551.19, 5329.92, 73.76, 161.8),
            heading = 250.0,
            length = 6.0,
            width = 4.0,
            label = Lang:t('blip.pwood'),
            sprite = 238,
            scale = 0.6,
            color = 5,
        },
    },
    ["seller"] = {
        [1] = {
            coords = vector4(-1046.02, -2015.17, 12.16, 141.87),
            heading = 250.0,
            length = 1.0,
            width = 1.0,
            label =  Lang:t('blip.swood'),
            sprite = 642,
            scale = 0.6,
            color = 37,
        },
    }
}

local KLItems = {
    Materials = { 'Sticks', 'Stone', 'Leaves', 'PureWater'},
    Items = {
        Weapons = { 
            ['StoneSword'] = {
                ['TypeOfItem'] = 'Weapons',
                ['MaterialsNeeded'] = {
                    ['Sticks'] = 2,
                    ['Stone'] = 2,
                },
            },
        },
        Tools = {
            ['StoneAxe'] = {
                ['TypeOfItem'] = 'Tools',
                ['MaterialsNeeded'] = {
                    ['Sticks'] = 1,
                    ['Stone'] = 1,
                },
            },
            ['StonePick'] = {
                ['TypeOfItem'] = 'Tools',
                ['MaterialsNeeded'] = {
                    ['Sticks'] = 2,
                    ['Stone'] = 1
                },
            },
        },
        Potions = {
            ['HalfPot'] = {
                ['TypeOfItem'] = 'Potion',
                ['MaterialsNeeded'] = {
                    ['Leaves'] = 1,
                    ['PureWater'] = 1,
                },
                ['Stats'] = {
                    amount = 0,
                    value = 50,
                },
            },
            ['FullPot'] = {
                ['TypeOfItem'] = 'Potion',
                ['MaterialsNeeded'] = {
                    ['Leaves'] = 1,
                    ['PureWater'] = 1,
                },
                ['Stats'] = {
                    amount = 0,
                    value = 100
                },
            },
        }
    },
}

return KLItems
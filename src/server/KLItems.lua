local KLItems = {
    Materials = { 'Sticks', 'Stone', },
    CraftingItems = {
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
        }
    },
}

return KLItems
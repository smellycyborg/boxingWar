local KLItems = {
    Materials = { 'Sticks', 'Stone', },
    CraftingItems = {
        Weapons = { 
            ['StoneAxe'] = {
                ['TypeOfItem'] = 'Weapons',
                ['MaterialsNeeded'] = {
                    ['Sticks'] = 1,
                    ['Stone'] = 1,
                },
            },
            ['StoneSword'] = {
                ['TypeOfItem'] = 'Weapons',
                ['MaterialsNeeded'] = {
                    ['Sticks'] = 2,
                    ['Stone'] = 2,
                },
            },
        },
    },
}

return KLItems
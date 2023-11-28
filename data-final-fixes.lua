local function simplifyTechnology(name)
  local technology = data.raw.technology[name]
  -- In case mod of technology is not loaded.
  if not technology then
    print('Technology not found, skipping: ' .. name)
    return
  else
    print('Simplifying technology: ' .. name)
  end

  for i = #technology.unit.ingredients, 1, -1 do
    ingredient = technology.unit.ingredients[i][1]
    if ingredient == 'production-science-pack' or
       ingredient == 'se-rocket-science-pack' or
       ingredient == 'space-science-pack' or
       ingredient == 'utility-science-pack' then

      print('- Removing ingredient ' .. ingredient)
      table.remove(technology.unit.ingredients, i)
    end
  end

  if technology.prerequisites then
    for i, prerequisite in pairs(technology.prerequisites) do
      if prerequisite == 'production-science-pack' or
         prerequisite == 'se-rocket-science-pack' or
         prerequisite == 'space-science-pack' or
         prerequisite == 'utility-science-pack' then

        print('- Replacing prequisite ' .. prerequisite .. ' with chemical-science-pack.')
        technology.prerequisites[i] = 'chemical-science-pack'
      end
    end
  end
end

simplifyTechnology('aai-storehouse-logistic')
simplifyTechnology('aai-strongbox-logistic')
simplifyTechnology('aai-warehouse-logistic')
simplifyTechnology('logistic-robotics')
simplifyTechnology('logistic-system')

local isDisplayed = true
local cardProp = nil


RegisterCommand('mcard', function()
    Citizen.CreateThread(function()
        local display = true
        local startTime = GetGameTimer()
        local delay = 120000
        local playerPed = PlayerPedId()
        local dict = "amb@code_human_wander_clipboard@male@base"
        
        RequestAnimDict(dict)
        if cardProp == nil then
          cardProp = CreateObject(GetHashKey('prop_cs_r_business_card'), GetEntityCoords(playerPed), 1, 1, 1)
          AttachEntityToEntity(cardProp, playerPed, GetPedBoneIndex(playerPed, 60309), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end

        while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
        if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
            TaskPlayAnim(playerPed,dict, "static", 1.0,-1.0, 120000, 1, 1, true, true, true)
        end

        SendNUIMessage({
            type = "mcard",
            display = true
          })

          while display do
            Citizen.Wait(1)
            SetTextComponentFormat("STRING")
            AddTextComponentString('Press ~INPUT_CONTEXT~ to put card away.')
            DisplayHelpTextFromStringLabel(0, 0, 0, -1)
            if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
              display = false
                SendNUIMessage({
                    type = "mcard",
                    display = false
                })
            end
            if (IsControlJustPressed(1, 51)) then
                display = false
                    SendNUIMessage({
                        type = "mcard",
                        display = false
                    })
                StopAnimTask(GetPlayerPed(-1), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0)
                DeleteEntity(cardProp)
                ClearPedTasks(playerPed)
                cardProp = nil
              end
          end
      end)
  end)

  RegisterCommand('vcard', function()
    Citizen.CreateThread(function()
        local display = true
        local startTime = GetGameTimer()
        local delay = 120000
        local playerPed = PlayerPedId()
        local dict = "amb@code_human_wander_clipboard@male@base"
        
        RequestAnimDict(dict)
        if cardProp == nil then
          cardProp = CreateObject(GetHashKey('prop_cs_r_business_card'), GetEntityCoords(playerPed), 1, 1, 1)
          AttachEntityToEntity(cardProp, playerPed, GetPedBoneIndex(playerPed, 60309), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end

        while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
        if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
            TaskPlayAnim(playerPed,dict, "static", 1.0,-1.0, 120000, 1, 1, true, true, true)
        end

        SendNUIMessage({
            type = "vcard",
            display = true
          })

          while display do
            Citizen.Wait(1)
            SetTextComponentFormat("STRING")
            AddTextComponentString('Press ~INPUT_CONTEXT~ to put card away.')
            DisplayHelpTextFromStringLabel(0, 0, 0, -1)
            if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
              display = false
                SendNUIMessage({
                    type = "vcard",
                    display = false
                })
            end
            if (IsControlJustPressed(1, 51)) then
                display = false
                    SendNUIMessage({
                        type = "vcard",
                        display = false
                    })
                StopAnimTask(GetPlayerPed(-1), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0)
                DeleteEntity(cardProp)
                ClearPedTasks(playerPed)
                cardProp = nil
              end
          end
      end)
  end)

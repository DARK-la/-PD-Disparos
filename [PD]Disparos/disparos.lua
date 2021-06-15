--Dark
addEventHandler ("onPlayerWeaponFire", root, 
   function (weapons)
         if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(source)), aclGetGroup ("Policial")) then return end
         if  (getElementData(source, "Fire")) then return end
         setElementData(source, "Fire", true)

        

         local x,y,z = getElementPosition(source)
         local weaponName = getWeaponNameFromID(weapons)
         local Zona_Disparado = getZoneName(x, y, z)
         
         for _, p in ipairs (getElementsByType("player")) do
             if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(p)), aclGetGroup ("Policial")) then
                 
                  outputChatBox ("#2980B9[911] #FDFEFEDisparos en la zona: #82E0AA" .. Zona_Disparado .." #FDFEFEArma:#82E0AA"..weaponName.."." , p, 112, 128, 144 ,true)
                   
                  local blip = createBlip ( x,y,z, 18 , 0, 0, 0, 255)
                setElementVisibleTo(blip, root, false)
                setElementVisibleTo(blip, p, true)
                playSoundFrontEnd ( p, 44 )
        

        setTimer(setElementData,30000,1,source,"Fire",false)
       
                
                setTimer ( function()
                    destroyElement(blip)
                end, 30000, 1)
                
            else
            
            end
        end
         
        
         end)



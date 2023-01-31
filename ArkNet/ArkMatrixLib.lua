
  function addVec3(v1, v2, _retVec)
    _retVec = (_retVec or {})
    _retVec[1],_retVec[2],_retVec[3]
      = v1[1]+v2[1]
      , v1[2]+v2[2]
      , v1[3]+v2[3]
    return _retVec
  end
  
  function mulMat3Vec3(rm, vec3, _retVec, _x, _y, _z)
    _retVec, _x, _y, _z = (_retVec or {}), unpack(vec3)
    for i=1,3 do
      _retVec[i]= _x*rm[i]+_y*rm[i+3]+_z*rm[i+6]
    end
    --[[_retVec[1],_retVec[2],_retVec[3]
      = _x*rm[1]+_y*rm[4]+_z*rm[7]
      , _x*rm[2]+_y*rm[5]+_z*rm[8]
      , _x*rm[3]+_y*rm[6]+_z*rm[9] ]]
    return _retVec
  end
  function invMat3(rm, _retInv, _v1)
    _retInv, _v1 = _retInv or {}, {unpack(rm)}
    for i=0,2 do for j=0,2 do
      _retInv[1+i+j*3]= _v1[1+j+i*3]
    end end
    --[[_retVec[1],_retVec[2],_retVec[3]
      = _x*rm[1]+_y*rm[4]+_z*rm[7]
      , _x*rm[2]+_y*rm[5]+_z*rm[8]
      , _x*rm[3]+_y*rm[6]+_z*rm[9] ]]
    return _retInv
  end


  function matOps(opType, ...) 
    --mulMat3Vec3(rm, vec3, _retVec, _x, _y, _z)
    if opType==0 then
    _retVec, _x, _y, _z = (_retVec or {}), unpack(vec3)
    for i=1,3 do
      _retVec[i]= _x*rm[i]+_y*rm[i+3]+_z*rm[i+6]
    end
    --[[_retVec[1],_retVec[2],_retVec[3]
      = _x*rm[1]+_y*rm[4]+_z*rm[7]
      , _x*rm[2]+_y*rm[5]+_z*rm[8]
      , _x*rm[3]+_y*rm[6]+_z*rm[9] ]]
    return _retVec
    end
  end
  ! C interface
  interface
     function C_kvs_StructuredVolumeObject_new()&
          bind( C, name="StructuredVolumeObject_new" )
       import
       type( C_ptr ) :: C_kvs_StructuredVolumeObject_new
     end function C_kvs_StructuredVolumeObject_new

     subroutine C_kvs_StructuredVolumeObject_delete ( this )&
          bind( C, name="StructuredVolumeObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_delete

     subroutine C_kvs_StructuredVolumeObject_setGridTypeToUniform( this )&
          bind( C, name="StructuredVolumeObject_setGridTypeToUniform" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_setGridTypeToUniform

     subroutine C_kvs_StructuredVolumeObject_setResolution ( this, dimx, dimy, dimz )&
          bind( C, name="StructuredVolumeObject_setResolution" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: dimx
       integer( C_int ), value :: dimy
       integer( C_int ), value :: dimz
     end subroutine C_kvs_StructuredVolumeObject_setResolution

     subroutine C_kvs_StructuredVolumeObject_setVeclen ( this, veclen )&
          bind( C, name="StructuredVolumeObject_setVeclen" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: veclen
     end subroutine C_kvs_StructuredVolumeObject_setVeclen

     subroutine C_kvs_StructuredVolumeObject_setValues ( this, values, nvalues )&
          bind( C, name="StructuredVolumeObject_setValues" )
       import
       type( C_ptr ), value :: this
       real( C_float ) :: values(nvalues)
       integer( C_int ), value :: nvalues
     end subroutine C_kvs_StructuredVolumeObject_setValues

     subroutine C_kvs_StructuredVolumeObject_updateMinMaxCoords ( this )&
          bind( C, name="StructuredVolumeObject_updateMinMaxCoords" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_updateMinMaxCoords

     subroutine C_kvs_StructuredVolumeObject_updateMinMaxValues ( this )&
          bind( C, name="StructuredVolumeObject_updateMinMaxValues" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_updateMinMaxValues
  end interface

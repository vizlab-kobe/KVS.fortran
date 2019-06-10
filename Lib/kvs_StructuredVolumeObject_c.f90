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

     subroutine C_kvs_StructuredVolumeObject_print ( this )&
          bind( C, name="StructuredVolumeObject_print" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_print

     subroutine C_kvs_StructuredVolumeObject_read( this, filename )&
          bind( C, name="StructuredVolumeObject_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_StructuredVolumeObject_read

     subroutine C_kvs_StructuredVolumeObject_write( this, filename )&
          bind( C, name="StructuredVolumeObject_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_StructuredVolumeObject_write

     function C_kvs_StructuredVolumeObject_numberOfNodes( this )&
          bind( C, name="StructuredVolumeObject_numberOfNodes" )
       import
       type( C_ptr ), value :: this
       integer( C_size_t ) :: C_kvs_StructuredVolumeObject_numberOfNodes
     end function C_kvs_StructuredVolumeObject_numberOfNodes

     function C_kvs_StructuredVolumeObject_copy( other )&
          bind( C, name="StructuredVolumeObject_copy" )
       import
       type( C_ptr ) :: C_kvs_StructuredVolumeObject_copy
       type( C_ptr ), value :: other
     end function C_kvs_StructuredVolumeObject_copy

  end interface

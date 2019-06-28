  ! C interface
  interface
     function C_kvs_OrthoSlice_new()&
          bind( C, name="OrthoSlice_new" )
       import
       type( C_ptr ) :: C_kvs_OrthoSlice_new
     end function C_kvs_OrthoSlice_new

     subroutine C_kvs_OrthoSlice_delete( this )&
          bind( C, name="OrthoSlice_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OrthoSlice_delete

     subroutine C_kvs_OrthoSlice_setPlane( this, pos, axis )&
          bind( C, name="OrthoSlice_setPlane" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: pos
       integer( c_int ), value :: axis
     end subroutine C_kvs_OrthoSlice_setPlane

     subroutine C_kvs_OrthoSlice_setTransferFunction( this, tf )&
          bind( C, name="OrthoSlice_setTransferFunction" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: tf
     end subroutine C_kvs_OrthoSlice_setTransferFunction

     function C_kvs_OrthoSlice_exec( this, volume )&
          bind( C, name="OrthoSlice_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: volume
       type( C_ptr ) :: C_kvs_OrthoSlice_exec
     end function C_kvs_OrthoSlice_exec
  end interface

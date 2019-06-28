  ! C interface
  interface
     function C_kvs_SlicePlane_new()&
          bind( C, name="SlicePlane_new" )
       import
       type( C_ptr ) :: C_kvs_SlicePlane_new
     end function C_kvs_SlicePlane_new

     subroutine C_kvs_SlicePlane_delete( this )&
          bind( C, name="SlicePlane_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_SlicePlane_delete

     subroutine C_kvs_SlicePlane_setPlane( this, point, normal )&
          bind( C, name="SlicePlane_setPlane" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: point
       type( C_ptr ), value :: normal
     end subroutine C_kvs_SlicePlane_setPlane

     subroutine C_kvs_SlicePlane_setTransferFunction( this, tf )&
          bind( C, name="SlicePlane_setTransferFunction" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: tf
     end subroutine C_kvs_SlicePlane_setTransferFunction

     function C_kvs_SlicePlane_exec( this, volume )&
          bind( C, name="SlicePlane_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: volume
       type( C_ptr ) :: C_kvs_SlicePlane_exec
     end function C_kvs_SlicePlane_exec
  end interface

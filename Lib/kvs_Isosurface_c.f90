  ! C interface
  interface
     function C_kvs_Isosurface_new()&
          bind( C, name="Isosurface_new" )
       import
       type( C_ptr ) :: C_kvs_Isosurface_new
     end function C_kvs_Isosurface_new

     subroutine C_kvs_Isosurface_delete( this )&
          bind( C, name="Isosurface_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Isosurface_delete

     subroutine C_kvs_Isosurface_setIsolevel( this, isolevel )&
          bind( C, name="Isosurface_setIsolevel" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: isolevel
     end subroutine C_kvs_Isosurface_setIsolevel

     function C_kvs_Isosurface_exec( this, volume )&
          bind( C, name="Isosurface_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: volume
       type( C_ptr ) :: C_kvs_Isosurface_exec
     end function C_kvs_Isosurface_exec
  end interface

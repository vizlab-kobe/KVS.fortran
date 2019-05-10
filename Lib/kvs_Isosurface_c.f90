  ! C interface
  interface
     function C_kvs_Isosurface_new ()&
          bind( C, name="Isosurface_new" )
       import
       type( C_ptr ) :: C_kvs_Isosurface_new
     end function C_kvs_Isosurface_new

     subroutine C_kvs_Isosurface_delete ( this )&
          bind( C, name="Isosurface_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Isosurface_delete

     subroutine C_kvs_Isosurface_setIsolevel ( this, isolevel )&
          bind( C, name="Isosurface_setIsolevel" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: isolevel
     end subroutine C_kvs_Isosurface_setIsolevel
  end interface

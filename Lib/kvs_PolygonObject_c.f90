  ! C interface
  interface
     function C_kvs_PolygonObject_new()&
          bind( C, name="PolygonObject_new" )
       import
       type( C_ptr ) :: C_kvs_PolygonObject_new
     end function C_kvs_PolygonObject_new

     subroutine C_kvs_PolygonObject_delete( this )&
          bind( C, name="PolygonObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PolygonObject_delete
  end interface

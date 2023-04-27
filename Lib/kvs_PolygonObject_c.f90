  ! C interface
  interface

     function C_kvs_PolygonObject_new()&
          bind( C, name="PolygonObject_new" )
       import
       type( C_ptr ) :: C_kvs_PolygonObject_new
     end function C_kvs_PolygonObject_new

     function C_kvs_PolygonObject_copy( other )&
          bind( C, name="PolygonObject_copy" )
       import
       type( C_ptr ) :: C_kvs_PolygonObject_copy
       type( C_ptr ), value :: other
     end function C_kvs_PolygonObject_copy

     subroutine C_kvs_PolygonObject_delete( this )&
          bind( C, name="PolygonObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PolygonObject_delete

     subroutine C_kvs_PolygonObject_print( this )&
          bind( C, name="PolygonObject_print" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PolygonObject_print

     subroutine C_kvs_PolygonObject_read( this, filename )&
          bind( C, name="PolygonObject_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_PolygonObject_read

     subroutine C_kvs_PolygonObject_write( this, filename )&
          bind( C, name="PolygonObject_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_PolygonObject_write

  end interface

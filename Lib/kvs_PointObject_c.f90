  ! C interface
  interface
     function C_kvs_PointObject_new()&
          bind( C, name="PointObject_new" )
       import
       type( C_ptr ) :: C_kvs_PointObject_new
     end function C_kvs_PointObject_new

     function C_kvs_PointObject_copy( other )&
          bind( C, name="PointObject_copy" )
       import
       type( C_ptr ) :: C_kvs_PointObject_copy
       type( C_ptr ), value :: other
     end function C_kvs_PointObject_copy

     subroutine C_kvs_PointObject_delete( this )&
          bind( C, name="PointObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PointObject_delete

     subroutine C_kvs_PointObject_print( this )&
          bind( C, name="PointObject_print" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PointObject_print

     subroutine C_kvs_PointObject_read( this, filename )&
          bind( C, name="PointObject_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_PointObject_read

     subroutine C_kvs_PointObject_write( this, filename )&
          bind( C, name="PointObject_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_PointObject_write

     subroutine C_Kvs_PointObject_setCoords( this, coords, size )&
          bind( C, name="PointObject_setCoords" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: coords
       integer( C_int ), value :: size
     end subroutine C_kvs_PointObject_setCoords
  end interface

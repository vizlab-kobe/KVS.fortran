  ! C interface
  interface
     function C_kvs_ColorImage_new()&
          bind( C, name="ColorImage_new" )
       import
       type( C_ptr ) :: C_kvs_ColorImage_new
     end function C_kvs_ColorImage_new

     function C_kvs_ColorImage_copy( other )&
          bind( C, name="ColorImage_copy" )
       import
       type( C_ptr ) :: C_kvs_ColorImage_copy
       type( C_ptr ), value :: other
     end function C_kvs_ColorImage_copy

     subroutine C_kvs_ColorImage_delete( this )&
          bind( C, name="ColorImage_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ColorImage_delete

     subroutine C_kvs_ColorImage_read( this, filename )&
          bind( C, name="ColorImage_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_ColorImage_read

     subroutine C_kvs_ColorImage_write( this, filename )&
          bind( C, name="ColorImage_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_ColorImage_write
  end interface

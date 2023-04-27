  ! C interface
  interface

     function C_kvs_Screen_new()&
          bind( C, name="Screen_new" )
       import
       type( C_ptr ) :: C_kvs_Screen_new
     end function C_kvs_Screen_new

     subroutine C_kvs_Screen_delete( this )&
          bind( C, name="Screen_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_delete

     subroutine C_kvs_Screen_registerObject( this, object, renderer )&
          bind( C, name="Screen_registerObject" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: object
       type( C_ptr ), value :: renderer
     end subroutine C_kvs_Screen_registerObject

     subroutine C_kvs_Screen_draw( this )&
          bind( C, name="Screen_draw" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_draw

     function C_kvs_Screen_capture( this )&
          bind( C, name="Screen_capture" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ) :: C_kvs_Screen_capture
     end function C_kvs_Screen_capture

  end interface

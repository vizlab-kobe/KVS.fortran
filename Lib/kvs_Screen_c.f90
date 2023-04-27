  ! C interface
  interface

     function C_kvs_Screen_new( app )&
          bind( C, name="Screen_new" )
       import
       type( C_ptr ), value :: app
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

     subroutine C_kvs_Screen_create( this )&
          bind( C, name="Screen_create" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_create

     subroutine C_kvs_Screen_show( this )&
          bind( C, name="Screen_show" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_show

     subroutine C_kvs_Screen_hide( this )&
          bind( C, name="Screen_hide" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_hide

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

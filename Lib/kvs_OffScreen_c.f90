  ! C interface
  interface

     function C_kvs_OffScreen_new()&
          bind( C, name="OffScreen_new" )
       import
       type( C_ptr ) :: C_kvs_OffScreen_new
     end function C_kvs_OffScreen_new

     subroutine C_kvs_OffScreen_delete( this )&
          bind( C, name="OffScreen_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_delete

     subroutine C_kvs_OffScreen_registerObject( this, object, renderer )&
          bind( C, name="OffScreen_registerObject" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: object
       type( C_ptr ), value :: renderer
     end subroutine C_kvs_OffScreen_registerObject

     subroutine C_kvs_OffScreen_create( this )&
          bind( C, name="OffScreen_create" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_create

     subroutine C_kvs_OffScreen_show( this )&
          bind( C, name="OffScreen_show" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_show

     subroutine C_kvs_OffScreen_hide( this )&
          bind( C, name="OffScreen_hide" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_hide

     subroutine C_kvs_OffScreen_draw( this )&
          bind( C, name="OffScreen_draw" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_draw

     function C_kvs_OffScreen_capture( this )&
          bind( C, name="OffScreen_capture" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ) :: C_kvs_OffScreen_capture
     end function C_kvs_OffScreen_capture

  end interface

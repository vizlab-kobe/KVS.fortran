  ! C interface
  interface

     function C_kvs_LineRenderer_new( glsl )&
          bind( C, name="LineRenderer_new" )
       import
       type( C_ptr ) :: C_kvs_LineRenderer_new
       logical :: glsl
     end function C_kvs_LineRenderer_new

     subroutine C_kvs_LineRenderer_delete( this )&
          bind( C, name="LineRenderer_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_LineRenderer_delete

     subroutine C_kvs_LineRenderer_setAntiAliasingEnabled( this, enable )&
          bind( C, name="LineRenderer_setAntiAliasingEnabled" )
       import
       type( C_ptr ), value :: this
       logical, value :: enable
     end subroutine C_kvs_LineRenderer_setAntiAliasingEnabled

  end interface

  ! C interface
  interface

     function C_kvs_RayCastingRenderer_new( glsl )&
          bind( C, name="RayCastingRenderer_new" )
       import
       type( C_ptr ) :: C_kvs_RayCastingRenderer_new
       logical :: glsl
     end function C_kvs_RayCastingRenderer_new

     subroutine C_kvs_RayCastingRenderer_delete( this )&
          bind( C, name="RayCastingRenderer_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_RayCastingRenderer_delete

     subroutine C_kvs_RayCastingRenderer_setTransferFunction( this, tfunc )&
          bind( C, name="RayCastingRenderer_setTransferFunction" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: tfunc
     end subroutine C_kvs_RayCastingRenderer_setTransferFunction

  end interface

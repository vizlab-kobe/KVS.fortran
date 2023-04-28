  ! C interface
  interface

     function C_kvs_PointRenderer_new( glsl )&
          bind( C, name="PointRenderer_new" )
       import
       type( C_ptr ) :: C_kvs_PointRenderer_new
       logical :: glsl
     end function C_kvs_PointRenderer_new

     subroutine C_kvs_PointRenderer_delete( this )&
          bind( C, name="PointRenderer_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PointRenderer_delete

     subroutine C_kvs_PointRenderer_setAntiAliasingEnabled( this, enable )&
          bind( C, name="PointRenderer_setAntiAliasingEnabled" )
       import
       type( C_ptr ), value :: this
       logical, value :: enable
     end subroutine C_kvs_PointRenderer_setAntiAliasingEnabled

     subroutine C_kvs_PointRenderer_setTwoSideLightingEnabled( this, enable )&
          bind( C, name="PointRenderer_setTwoSideLightingEnabled" )
       import
       type( C_ptr ), value :: this
       logical, value :: enable
     end subroutine C_kvs_PointRenderer_setTwoSideLightingEnabled

  end interface

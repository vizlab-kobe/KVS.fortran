  ! C interface
  interface

     function C_kvs_PolygonRenderer_new( glsl )&
          bind( C, name="PolygonRenderer_new" )
       import
       type( C_ptr ) :: C_kvs_PolygonRenderer_new
       logical :: glsl
     end function C_kvs_PolygonRenderer_new

     subroutine C_kvs_PolygonRenderer_delete( this )&
          bind( C, name="PolygonRenderer_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PolygonRenderer_delete

     subroutine C_kvs_PolygonRenderer_setAntiAliasingEnabled( this, enable )&
          bind( C, name="PolygonRenderer_setAntiAliasingEnabled" )
       import
       type( C_ptr ), value :: this
       logical, value :: enable
     end subroutine C_kvs_PolygonRenderer_setAntiAliasingEnabled

     subroutine C_kvs_PolygonRenderer_setTwoSideLightingEnabled( this, enable )&
          bind( C, name="PolygonRenderer_setTwoSideLightingEnabled" )
       import
       type( C_ptr ), value :: this
       logical, value :: enable
     end subroutine C_kvs_PolygonRenderer_setTwoSideLightingEnabled

  end interface

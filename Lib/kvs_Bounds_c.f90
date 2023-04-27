  ! C interface
  interface

     function C_kvs_Bounds_new()&
          bind( C, name="Bounds_new" )
       import
       type( C_ptr ) :: C_kvs_Bounds_new
     end function C_kvs_Bounds_new

     subroutine C_kvs_Bounds_delete( this )&
          bind( C, name="Bounds_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Bounds_delete

     subroutine C_kvs_Bounds_setType( this, bounds_type )&
          bind( C, name="Bounds_setType" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: bounds_type
     end subroutine C_kvs_Bounds_setType

     subroutine C_kvs_Bounds_setLineWidth( this, width )&
          bind( C, name="Bounds_setLineWidth" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: width
     end subroutine C_kvs_Bounds_setLineWidth

     subroutine C_kvs_Bounds_setCornerScale( this, scale )&
          bind( C, name="Bounds_setCornerScale" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: scale
     end subroutine C_kvs_Bounds_setCornerScale

     subroutine C_kvs_Bounds_setCircleDivision( this, division )&
          bind( C, name="Bounds_setCircleDivision" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: division
     end subroutine C_kvs_Bounds_setCircleDivision

     subroutine C_kvs_Bounds_enableAntiAliasing( this )&
          bind( C, name="Bounds_enableAntiAliasing" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Bounds_enableAntiAliasing

     subroutine C_kvs_Bounds_disableAntiAliasing( this )&
          bind( C, name="Bounds_disableAntiAliasing" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Bounds_disableAntiAliasing

     subroutine C_kvs_Bounds_show( this )&
          bind( C, name="Bounds_show" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Bounds_show

     subroutine C_kvs_Bounds_hide( this )&
          bind( C, name="Bounds_hide" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Bounds_hide

     function C_kvs_Bounds_outputLineObject( this, object )&
          bind( C, name="Bounds_outputLineObject" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: object
       type( C_ptr ) :: C_kvs_Bounds_outputLineObject
     end function C_kvs_Bounds_outputLineObject

     ! RendererBase
     subroutine C_kvs_Bounds_enableShading( this )&
          bind( C, name="Bounds_enableShading" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Bounds_enableShading

     subroutine C_kvs_Bounds_disableShading( this )&
          bind( C, name="Bounds_disableShading" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Bounds_disableShading

  end interface

  ! C interface
  interface

     function C_kvs_ArrowGlyph_new()&
          bind( C, name="ArrowGlyph_new" )
       import
       type( C_ptr ) :: C_kvs_ArrowGlyph_new
     end function C_kvs_ArrowGlyph_new

     subroutine C_kvs_ArrowGlyph_delete( this )&
          bind( C, name="ArrowGlyph_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_delete

     subroutine C_kvs_ArrowGlyph_setArrowType( this, arrow_type )&
          bind( C, name="ArrowGlyph_setArrowType" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: arrow_type
     end subroutine C_kvs_ArrowGlyph_setArrowType

     subroutine C_kvs_ArrowGlyph_setArrowTypeToLine( this )&
          bind( C, name="ArrowGlyph_setArrowTypeToLine" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_setArrowTypeToLine

     subroutine C_kvs_ArrowGlyph_setArrowTypeToTube( this )&
          bind( C, name="ArrowGlyph_setArrowTypeToTube" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_setArrowTypeToTube

     ! GlyphBase
     subroutine C_kvs_ArrowGlyph_setSizeMode( this, mode )&
          bind( C, name="ArrowGlyph_setSizeMode" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: mode
     end subroutine C_kvs_ArrowGlyph_setSizeMode

     subroutine C_kvs_ArrowGlyph_setDirectionMode( this, mode )&
          bind( C, name="ArrowGlyph_setDirectionMode" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: mode
     end subroutine C_kvs_ArrowGlyph_setDirectionMode

     subroutine C_kvs_ArrowGlyph_setColorMode( this, mode )&
          bind( C, name="ArrowGlyph_setColorMode" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: mode
     end subroutine C_kvs_ArrowGlyph_setColorMode

     subroutine C_kvs_ArrowGlyph_setOpacityMode( this, mode )&
          bind( C, name="ArrowGlyph_setOpacityMode" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: mode
     end subroutine C_kvs_ArrowGlyph_setOpacityMode

     subroutine C_kvs_ArrowGlyph_setCoords( this, coords, size )&
          bind( C, name="ArrowGlyph_setCoords" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: coords ! float array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setCoords

     subroutine C_kvs_ArrowGlyph_setSizes( this, sizes, size )&
          bind( C, name="ArrowGlyph_setSizes" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: sizes ! float array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setSizes

     subroutine C_kvs_ArrowGlyph_setDirections( this, directions, size )&
          bind( C, name="ArrowGlyph_setDirections" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: directions ! float array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setDirections

     subroutine C_kvs_ArrowGlyph_setColors( this, colors, size )&
          bind( C, name="ArrowGlyph_setColors" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: colors ! uint8_t array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setColors

     subroutine C_kvs_ArrowGlyph_setOpacities( this, opacities, size )&
          bind( C, name="ArrowGlyph_setOpacities" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: opacities ! uint8_t array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setOpacities

     subroutine C_kvs_ArrowGlyph_setScale( this, scale )&
          bind( C, name="ArrowGlyph_setScale" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: scale
     end subroutine C_kvs_ArrowGlyph_setScale

     subroutine C_kvs_ArrowGlyph_setTransferFunction( this, tfunc )&
          bind( C, name="ArrowGlyph_setTransferFunction" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: tfunc
     end subroutine C_kvs_ArrowGlyph_setTransferFunction

     ! RendererBase
     subroutine C_kvs_ArrowGlyph_enableShading( this )&
          bind( C, name="ArrowGlyph_enableShading" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_enableShading

     subroutine C_kvs_ArrowGlyph_disableShading( this )&
          bind( C, name="ArrowGlyph_disableShading" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_disableShading

  end interface

  ! C interface
  interface

     function C_kvs_ColorMap_new() result( this )&
          bind( C, name="ColorMap_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_new

     subroutine C_kvs_ColorMap_delete( this )&
          bind( C, name="ColorMap_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ColorMap_delete

     subroutine C_kvs_ColorMap_setRange( this, min_value, max_value )&
          bind( C, name="ColorMap_setRange" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: min_value
       real( C_float ), value :: max_value
     end subroutine C_kvs_ColorMap_setRange

     subroutine C_kvs_ColorMap_setResolution( this, resolution )&
          bind( C, name="ColorMap_setResolution" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: resolution
     end subroutine C_kvs_ColorMap_setResolution

     subroutine C_kvs_ColorMap_create( this )&
          bind( C, name="ColorMap_create" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ColorMap_create

     function C_kvs_ColorMap_Rainbow( resolution ) result( this )&
          bind( C, name="ColorMap_Rainbow" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Rainbow

     function C_kvs_ColorMap_CoolWarm( resolution ) result( this )&
          bind( C, name="ColorMap_CoolWarm" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_CoolWarm

     function C_kvs_ColorMap_BrewerBrBG( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerBrBG" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerBrBG

     function C_kvs_ColorMap_BrewerPiYG( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerPiYG" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerPiYG

     function C_kvs_ColorMap_BrewerPRGn( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerPRGn" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerPRGn

     function C_kvs_ColorMap_BrewerPuOr( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerPuOr" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerPuOr

     function C_kvs_ColorMap_BrewerRdBu( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerRdBu" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerRdBu

     function C_kvs_ColorMap_BrewerRdGy( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerRdGy" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerRdGy

     function C_kvs_ColorMap_BrewerRdYlBu( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerRdYlBu" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerRdYlBu

     function C_kvs_ColorMap_BrewerRdYlGn( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerRdYlGn" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerRdYlGn

     function C_kvs_ColorMap_BrewerSpectral( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerSpectral" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerSpectral

     function C_kvs_ColorMap_Viridis( resolution ) result( this )&
          bind( C, name="ColorMap_Viridis" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Viridis

     function C_kvs_ColorMap_Plasma( resolution ) result( this )&
          bind( C, name="ColorMap_Plasma" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Plasma

     function C_kvs_ColorMap_Inferno( resolution ) result( this )&
          bind( C, name="ColorMap_Inferno" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Inferno

     function C_kvs_ColorMap_Magma( resolution ) result( this )&
          bind( C, name="ColorMap_Magma" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Magma

     function C_kvs_ColorMap_Cividis( resolution ) result( this )&
          bind( C, name="ColorMap_Cividis" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Cividis

  end interface

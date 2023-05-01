  ! C interface
  interface

     function C_kvs_TransferFunction_new () result( this )&
          bind( C, name="TransferFunction_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_TransferFunction_new

     subroutine C_kvs_TransferFunction_delete ( this )&
          bind( C, name="TransferFunction_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_TransferFunction_delete

     subroutine C_kvs_TransferFunction_read( this, filename )&
          bind( C, name="TransferFunction_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_TransferFunction_read

     subroutine C_kvs_TransferFunction_write( this, filename )&
          bind( C, name="TransferFunction_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_TransferFunction_write

     subroutine C_kvs_TransferFunction_setColorMap( this, cmap )&
          bind( C, name="TransferFunction_setColorMap" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: cmap
     end subroutine C_kvs_TransferFunction_setColorMap

     subroutine C_kvs_TransferFunction_setRange( this, min_value, max_value )&
          bind( C, name="TransferFunction_setRange" )
       import
       type( C_ptr ),   value :: this
       real( C_float ), value :: min_value, max_value
     end subroutine C_kvs_TransferFunction_setRange

  end interface

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

  end interface

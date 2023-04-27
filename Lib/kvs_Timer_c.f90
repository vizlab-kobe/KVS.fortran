  ! C interface
  interface

     function C_kvs_Timer_new () result( this )&
          bind( C, name="Timer_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_Timer_new

     subroutine C_kvs_Timer_delete ( this )&
          bind( C, name="Timer_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Timer_delete

     subroutine C_kvs_Timer_start ( this )&
          bind( C, name="Timer_start" )
       import
       type( C_ptr ) :: this
     end subroutine C_kvs_Timer_start

     subroutine C_kvs_Timer_stop ( this )&
          bind( C, name="Timer_stop" )
       import
       type( C_ptr ) :: this
     end subroutine C_kvs_Timer_stop

     function C_kvs_Timer_sec (this)&
          bind( C, name="Timer_sec" )
       import
       type(C_ptr), value :: this
       real (C_double) :: C_kvs_Timer_sec
     end function C_kvs_Timer_sec

  end interface

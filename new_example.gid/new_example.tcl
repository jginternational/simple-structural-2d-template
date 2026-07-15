#################################################
#      GiD-Tcl procedures invoked by GiD        #
#################################################
proc GiD_Event_InitProblemtype { dir } {
    New_Example::SetDir $dir
    
    # Register the events that GiD launches to the problemtype
    New_Example::RegisterGiDEvents

    # Opens the data tree
    GidUtils::OpenWindow CUSTOMLIB
    
}

proc GiD_Event_EndProblemtype {} {
    GiD_UnRegisterEvents PROBLEMTYPE New_Example
}

#################################################
#      namespace implementing procedures        #
#################################################
namespace eval New_Example {
    variable problemtype_dir
}

proc New_Example::SetDir { dir } {
    variable problemtype_dir
    set problemtype_dir $dir
}


proc New_Example::RegisterGiDEvents {} {
    # Write calculation files
    GiD_RegisterEvent GiD_Event_AfterWriteCalculationFile New_Example::AfterWriteCalculationFile PROBLEMTYPE New_Example

}


proc New_Example::AfterWriteCalculationFile { filename errorflag } {
    if { ![info exists gid_groups_conds::doc] } {
        WarnWin [= "Error: data not OK"]
        return
    }
    # NOTE: Implement this function by yourself
    set err [catch { New_Example::WriteCalculationFile $filename } ret]
    if { $err } {
        WarnWin [= "Error when preparing data for analysis (%s)" $::errorInfo]
        set ret -cancel-
    }
    return $ret
}
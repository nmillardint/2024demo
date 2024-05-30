component {

    this.name = "customerdatabase";
    this.defaultdatasource="mysql";

    this.datasources["mysql"] = {
        class: 'com.mysql.cj.jdbc.Driver'
        , bundleName: 'com.mysql.cj'
        , bundleVersion: '8.0.19'
        , connectionString: 'jdbc:mysql://mysql:3306/customerdatabase?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true'
        , username: 'root'
        , password: "encrypted:91c7945dd6206f056247bbd52668b30db2fb07487049c03450e6a251a406883320756d06f297083b"

// optional settings
        , connectionLimit:100 // default:-1
        , liveTimeout:60 // default: -1; unit: minutes
        , alwaysSetTimeout:true // default: false
        , validate:false // default: false
    };
}

component {
  this.name = "gsapp";
  this.defaultdatasource="mysql";
  this.datasources["mysql"] = {
      class: 'com.mysql.cj.jdbc.Driver'
    , bundleName: 'com.mysql.cj'
    , bundleVersion: '8.0.19'
    , connectionString: 'jdbc:mysql://mysql:3306/mysql?characterEncoding=UTF-8&serverTimezone=Europe/Berlin&maxReconnects=3'
    , username: 'root'
    , password: "my-secret-pw"
    // optional settings
    , connectionLimit:100 // default:-1
    , liveTimeout:60 // default: -1; unit: minutes
    , alwaysSetTimeout:true // default: false
    , validate:false // default: false
};
}

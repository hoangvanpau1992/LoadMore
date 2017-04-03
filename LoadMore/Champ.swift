//
//	RootClass.swift
//
//	Create by Trương Thắng on 31/3/2017
//	Copyright © 2017 Trương Thắng. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

import Foundation

struct Characters {
    var id_Champ:String = ""
    var level_Champ:String = ""
    var nameEN_Champ:String = ""
    var nameVN_Champ:String = ""
    var url_Champ:String = ""
    
    
    init(dict: Dictionary<AnyHashable, Any>) {
        guard let id_Champ =  dict["id_Champ"] as? String else { return }
        guard let level_Champ =  dict["level_Champ"] as? String else { return }
        guard let nameEN_Champ =  dict["nameEN_Champ"] as? String else { return }
        guard let nameVN_Champ =  dict["nameVN_Champ"] as? String else { return }
        guard let url_Champ =  dict["url_Champ"] as? String else { return }
        
        self.id_Champ = id_Champ
        self.level_Champ = level_Champ
        self.nameEN_Champ = nameEN_Champ
        self.nameVN_Champ = nameVN_Champ
        self.url_Champ = url_Champ
    }
}

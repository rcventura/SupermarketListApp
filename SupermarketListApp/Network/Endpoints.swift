//
//  Endpoints.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import Foundation

enum Endpoints: String {
    case apikey =  "eyJhbGciOiJBMjU2S1ciLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiemlwIjoiREVGIn0.3zGXXNFkrT60CaeSlMIxE3NEPBffulN0QQy2hCBDr_jG2EYmWHsM3qCKo1FDSare77hzicxeQNnYxAbWFuQXipXblK3KSVy1.c1WXTONUlb4yAV-sYYrSZg.0dtHqdYd7y2pWNta0stVCMDQkzbNREBE3StZ5CthSrOj8zqSAHopzAIvhkUCNULdcQxmg7t5Z4Uq5Hh1pdNm4oiL-INPfV-0wmvu6O2u8g8Hf-i6AtAtNaZy5lpGI_JYFsLmeqvcuuuGFgaxd3HBels7z6aOFxlYUyxohXCq1-w.wuCfLDuT77Bdu6fsQlFxFVMAMXyAo3dCei_H3t4qE3k"
    case baseURL = "https://x8ki-letl-twmt.n7.xano.io/api:H1NcPhNd"
    // Endpoits for authentication
    case loginUser = "/auth/login"
    case createUser = "/auth/signup"
    
    // Endpoints for categories
    case listCategories = "/categories"
    case listItemsByCategoryID = "/itemslists/itemslists_id?categories_id="
}

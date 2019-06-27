//
//  APIConstant.swift
//  YoYoHaul
//
//  Created Manoj Saini on 6/15/18.
//  Copyright © 2018 MDS. All rights reserved.
//
//

import UIKit

func baseURL() -> String {
    return "http://api.yoyomon.com/"//"http://192.168.20.109:8080/"//"//http://35.185.73.151/
}

//MARK: - APIS
let kDispatcherLoginApi  =   "api/v1/users/login/dispatcher"
let kDriverLoginApi  =   "api/v1/users/login/driver"
let kShipperLoginApi  =   "api/v1/users/login/shipper"
let kGetPriceQuotesApi  =   "api/v1/transports/dispatcher/price-quotes"
let kGetPriceQuoteInfoByIDApi  =   "api/v1/transports/quote/"
let kSendPriceQuoteApi  =   "api/v1/transports/quote/"
let kGetPriceQuoteByDispatcherApi  =   "api/v1/transports/dispatcher/quotes-by-dispatcher"
let kDeclineAcceptedQuoteApi  =   "api/v1/transports/decline-quote/"
let kScheduleAcceptedQuoteApi  =   "api/v1/transports/schedule-quote/"
let kGetCurrentUserProfileApi  =   "api/v1/users"
let kGetUserAllDriverApi  =   "api/v1/users/driver"
let kRegisterlDriverApi  =   "api/v1/users/register/driver"
let kGetStatesApi  =   "api/v1/utils/states"
let kGetVehicleMakesApi  =   "api/v1/utils/makes"
let kGetVINInfoApi  =   "api/v1/utils/vin"
let kAddTruckApi  =   "api/v1/users/truck"
let kSaveCompanyInfoApi  =   "api/v1/users/dispatcher"
let kDispatcherDocumentApi  =   "api/v1/users/dispatcher/documents/"
let kGetShippingRequestFormApi  =   "api/v1/transports/shipping-request-form"
let kGetQuotesByDispatcherApi  =   "api/v1/transports/dispatcher/quotes-by-dispatcher"
let kReScheduleAcceptedQuoteApi  =   "api/v1/transports/reschedule-quote/"
let kTrackingAndDeliveryLoadApi  =   "api/v1/transports/tracking-and-delivery/"
let kNearByLoadApi  =   "api/v1/transports/near-by-loads"
let kAllLoadCountApi  =   "api/v1/transports/count-loads"
let kAllAvailabilityLoadCountApi  =   "api/v1/transports/availabiltyCountLoads"
let kGetPresignedUrlsApi  =   "api/v1/utils/pre-signed-url"
let kCancelByDispatcherQuoteApi  =   "api/v1/transports/cancel-by-dispatcher/"
let kDeliveryDoneApi  =   "api/v1/transports/delivery-done/"
let kDeliveryDamageApi  =   "api/v1/transports/delivery-damage/"
let kVehicleInspectionApi  =   "api/v1/transports/bill-of-ladding/inspect/"
let kPickUpLoadApi  =   "api/v1/transports/pickup/"
let kSearchDeliveredVehiclesApi  =   "api/v1/transports/search-delivered-vehicles"
let kSearchLoadsApi  =   "api/v1/subscriptions/search"
let kAutoSearchLoadsApi  =   "api/v1/subscriptions"
let kAutoSearchLoadsCountApi  =   "api/v1/subscriptions?count=true"
let kGetQuotesAroundMeApi  =   "api/v1/transports/quotes-around-me"
let kGetAvailabilityByDateApi  =   "api/v1/transports/availability-by-date"
let kGetPostedByPriceApi  =   "api/v1/transports/posted-by-search-price"
let kGetSortedByPriceApi  =   "api/v1/transports/sort-by-price"
let kGetListPickupDeliverySearchCardApi = "api/v1/transports/pickup-and-delivery"
let kGetNotificationsCountApi  =   "api/v1/subscriptions/count"

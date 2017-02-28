//
//  ViewController.swift
//  HealthKitTest
//
//  Created by 莫锹文 on 2017/1/16.
//  Copyright © 2017年 莫锹文. All rights reserved.
//

import UIKit

import HealthKit
import HealthKitUI

class ViewController: UIViewController {

    var healthStore: HKHealthStore?

    override func viewDidLoad() {
        super.viewDidLoad()

        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore = HKHealthStore()
        }
    }

    @IBAction func btn1_clickHandler(_ sender: Any) {

        if let healthStore = self.healthStore {

            let readList: Set<HKObjectType> =
                [
                    // 体征
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMassIndex)!, // 身高体重指数
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyFatPercentage)!, // 体脂率
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!, // 身高
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!, // 体重
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.leanBodyMass)!, // 去脂体重

                    // 健康
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!, // 步数
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!, // 步行+跑步距离
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!, // 骑车距离
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWheelchair)!, // 轮椅距离
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!, // 静息能量
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!, // 活动能量
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!, // 已爬楼层
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.nikeFuel)!,
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!, // 锻炼分钟数
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.pushCount)!, // 推动次数
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceSwimming)!, // 游泳距离
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.swimmingStrokeCount)!, // 划水次数

                    // 命脉
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!, // 心率
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyTemperature)!, // 体温
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalBodyTemperature)!, // 基础体温
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodPressureSystolic)!, // 收缩压
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodPressureDiastolic)!, // 舒张压
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.respiratoryRate)!, // 呼吸速率

                    // 结果
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.oxygenSaturation)!, // 血氧饱和度
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peripheralPerfusionIndex)!, // 末梢灌注指数
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodGlucose)!, // 血糖
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.numberOfTimesFallen)!, // 摔倒次数
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.electrodermalActivity)!, // 皮电活动
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.inhalerUsage)!, // 吸入剂用量
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodAlcoholContent)!, // 血液酒精含量
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.forcedVitalCapacity)!, // 最大肺活量|用力肺活量
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.forcedExpiratoryVolume1)!, // 第一秒用力呼气量
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peakExpiratoryFlowRate)!, // 呼气流速峰值

                    // Nutrition
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryFatTotal)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryFatPolyunsaturated)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryFatMonounsaturated)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryFatSaturated)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryCholesterol)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietarySodium)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryCarbohydrates)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryFiber)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietarySugar)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryEnergyConsumed)!, // Energy, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryProtein)!, // Mass,   Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryVitaminA)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryVitaminB6)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryVitaminB12)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryVitaminC)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryVitaminD)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryVitaminE)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryVitaminK)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryCalcium)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryIron)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryThiamin)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryRiboflavin)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryNiacin)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryFolate)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryBiotin)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryPantothenicAcid)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryPhosphorus)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryIodine)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryMagnesium)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryZinc)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietarySelenium)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryCopper)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryManganese)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryChromium)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryMolybdenum)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryChloride)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryPotassium)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryCaffeine)!, // Mass, Cumulative
                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryWater)!, // Volume, Cumulative

                    HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.uvExposure)!, // Scalar (Count), Discrete

                    // HKCharacteristicType
                    // 个人信息
                    HKQuantityType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!, // 生物学性别
                    HKQuantityType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.bloodType)!, // 血型
                    HKQuantityType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth)!, // 出生日期
                    HKQuantityType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.fitzpatrickSkinType)!, // 日光反应型皮肤类型
                    HKQuantityType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.wheelchairUse)!, // 是否使用轮椅

                ]

            let writeList: Set<HKSampleType> = [
                HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!, // 步数

            ]

            // 请求权限，有读、写两种
            healthStore.requestAuthorization(toShare: writeList, read: readList, completion: { (state, error) in
                if state {
                    print("success")
                } else {
                    print("fail")
                }
            })

        }
    }

    @IBAction func btn2_clickHandler(_ sender: Any) {

        let past = Date.distantPast
        let now = Date()

        // 过滤器
        let mostRecentPredicate = HKQuery.predicateForSamples(withStart: past, end: now, options: HKQueryOptions.strictEndDate)

        // 排序器
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        // 限制条目
        let limit = 10

        // 类型
        let type = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)! // 步数

        let sampleQuery = HKSampleQuery(sampleType: type, predicate: mostRecentPredicate, limit: limit, sortDescriptors: [sortDescriptor], resultsHandler: {
            (sample: HKSampleQuery, results: [HKSample]?, error: Error?) in

            if let queryError = error {
                print(queryError)

                return
            }

            for value in results! {
                let newValue = value as! HKQuantitySample

                print("type:", newValue.quantityType, "value:", newValue.quantity)

            }

        })

        self.healthStore?.execute(sampleQuery)

    }

    @IBAction func btn3_clickHandler(_ sender: Any) {

        let type = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        let quantity = HKQuantity(unit: HKUnit.count(), doubleValue: 9527)
        let sample = HKQuantitySample(type: type, quantity: quantity, start: Date(), end: Date())

        self.healthStore?.save(sample, withCompletion: { (state, error) in
            if let saveError = error {
                print(saveError)
                return
            }

            print(state ? "save success" : "save failure")
        })
    }

    @IBAction func btn4_clickHandler(_ sender: Any) {

        let quantityType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        var dateComponent = DateComponents()

        dateComponent.day = 1

        let collectionQuery = HKStatisticsCollectionQuery(quantityType: quantityType, quantitySamplePredicate: nil, options: [.cumulativeSum, .separateBySource], anchorDate: Date.init(timeIntervalSince1970: 0), intervalComponents: dateComponent)

        collectionQuery.initialResultsHandler = {
            query, results, error in

            print(query, results, error)

            if let result = results {

                for statistic: HKStatistics in result.statistics() {

                    for source: HKSource in statistic.sources! {
                        print("source:", source)
                    }

                }

            }

        }

        self.healthStore?.execute(collectionQuery)
    }

}

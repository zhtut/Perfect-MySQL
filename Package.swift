// swift-tools-version:5.5
//  Package.swift
//  Perfect-MySQL
//
//  Created by Kyle Jessup on 3/22/16.
//	Copyright (C) 2016 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PackageDescription

#if os(macOS)
let clientPackage = "Perfect-mysqlclient"
#else
let clientPackage = "Perfect-mysqlclient-Linux"
#endif

let package = Package(
	name: "PerfectMySQL",
    platforms: [
        .macOS(.v10_15),
    ],
	products: [
		.library(name: "PerfectMySQL", targets: ["PerfectMySQL"])
	],
	dependencies: [
		.package(name: "PerfectCRUD", url: "https://github.com/PerfectlySoft/Perfect-CRUD.git", from: "1.2.2"),
//		.package(name: "mysqlclient", url: "https://github.com/PerfectlySoft/\(clientPackage).git", from: "2.0.0"),
        .package(name: "mysqlclient", path: "../\(clientPackage)"),
		],
	targets: [
		.target(name: "PerfectMySQL", dependencies: ["PerfectCRUD", "mysqlclient"]),
		.testTarget(name: "PerfectMySQLTests", dependencies: ["PerfectMySQL"])
	]
)

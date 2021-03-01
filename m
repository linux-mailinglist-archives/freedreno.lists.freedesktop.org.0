Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DD328307
	for <lists+freedreno@lfdr.de>; Mon,  1 Mar 2021 17:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D226E7E5;
	Mon,  1 Mar 2021 16:06:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D8F6E7EC
 for <freedreno@lists.freedesktop.org>; Mon,  1 Mar 2021 16:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SH+/zULB/U32dpSCtVroeELdoB66jjTtk2vhfSSE8z3v/L9lbct4F04QZs5F5koL6O0tn2mUeGr2p/Aq/kmbPDCYoejg5d6cpo1Vz70766MLNxeM14PkfRwCLiKSE+fO4Yq9bOHEGpczHfJcLvVPWYJke1My2kaKWHMAyRpuvld3mlbCZS+TIcnqNNtpeMXhQk/eiEri6Fighxt8yf1n2C9iGG9ULFDYaxPKgxs8NE+IkqHGPs+wVoirReZ19c1qsv3bEEPD85zQsaaiTjeFLL98kQSfhvlT6LnRiyLk19txUjwv8bDH2PeGzLW38X8E8EBFzECc3cmIc3o2TAcC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF55qSoxQOGEbayxURNGwezG4c4OAtOW6PCmn2k3o3M=;
 b=HBV28N9Pi5+Uz5JBsvvfre4b2ux3bB4Uc3oYK74q5+CNFqjIl5GqYy8QZXAtSZVy4NC1A5V4ckhn+YNOQCOSx0EY9p8VYpeuvYUBi2ehJbMMeHfEa+nyQpeFsdbOvtelCQGvQ6HrCbaWbk2B2aXNlsqNYs20GQisZoiehwIhytDwZFv72w843SeYbGWBEUa23jnqnedaClG17ELlLLMoNn1u+ebfpvYqmNeRe56B9HSGW3DFgS1Yso7jVoq4riKzw/otoojrImp3zmOuPpqx0uMDEU80ay7XP9/riJdaUsMCu3L7X3Tvbuyc3G/TzwCQhvOns4vpvjTZLfM5leSgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF55qSoxQOGEbayxURNGwezG4c4OAtOW6PCmn2k3o3M=;
 b=YuZnOAh8t0yi/FiAKYrxX7n4l/orMrFvJOFsekB4eoDHrpHNLHQ39eIuFyaIiDZ04n2igSUjaoOXP/X71AWVPHhVWahcZHalRa/ACJ3/AmJerZt64Y7HieyQH/Z9mrm/AoVRmMYbtqbOfhZLExeJ8RtYZUnzzo5APUPyxvd7CHk=
Authentication-Results: x.org; dkim=none (message not signed)
 header.d=none;x.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 16:06:36 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b%3]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 16:06:36 +0000
To: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <d213f1f2-452c-11df-7202-ec27d39a9170@amd.com>
Date: Mon, 1 Mar 2021 11:06:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49)
 To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.25 via Frontend Transport; Mon, 1 Mar 2021 16:06:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb913eb5-3c71-4369-4b88-08d8dccbfd66
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4553C70A1F87B9988653A0408C9A9@MW3PR12MB4553.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q636UhRGA3Fip1F+qqDjV0srzUMHLYU2IdEHjyVnv6QfF30oQowau8h7chKeLu/a20LJb6IYNllt5ehccvhLE0KRTahGS16H6MP2gP7NcIuQmNkinwXARKXejfQnQRpzjSJHrJmXCNGop6Frvk7jEOJ24h5df+G6sYLyuX52P/b+AaTXY9uEItDQBcdXhmMg2AwsiLXchvpFND8nqFH775Qh8ZoVdY3N2gBGI24HMQzeXx9zzzH+JJgXgDK7wKPCJgerCaWhd3PM6E6EpjuVFzEzoEgN1NnECxboBIO0zIKjaWJpUknl9gQyd8MWUXQBgJboRDlNJaTNeI4wyeZP5xahf5yeIFUcVKmnsurfoZQ1ZoCC5IxsW4VmX21dguX9jpyOElMNwJiJ5QJiqWfYdpvAjP5v4XXxAA9sOLOBKcCLvXP/l+DyNoMgGdDY6iPgmICP5s5dltMRXLju8LB8e+ZqRi8z0udQl1mejZQbdhXO5oX6ivTyzF2vyhlfLGaZS7OB98LoZmOVSdGIbPjUCGgrSZaYEib3/IrjltK4ToZyk9EleQSrgNFla3xdq6uHrWVW9+bjTQ9C9O2mb1LJHZ75hLVJNQEScR37XcWNMew=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(86362001)(316002)(186003)(478600001)(6486002)(36756003)(26005)(16576012)(16526019)(52116002)(31686004)(6666004)(31696002)(66476007)(66556008)(5660300002)(956004)(2906002)(2616005)(4326008)(4744005)(44832011)(6916009)(8676002)(66946007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGNPL3Q1MnVvaWFzVDZwR2VpMVF1NXRRS011d0phWUxpbEM2TGFPNXlMdVE0?=
 =?utf-8?B?VnMrZ3YrTmZxMHE5eGVBRUFPbXhOTFhyand5RHVaR3NZZnNHUG8wVEpDd2FR?=
 =?utf-8?B?Q0lxT1BFVUg2blBla0ZwU3ZMeG1OY2pjV0xUYll0WHRsY21TNWE4akZNVFlJ?=
 =?utf-8?B?d1dqNFRWZzV5NHpNMXAvWWJKd1IxRXp0cndKZURMWHNWY3JQbVZtVjdySWNy?=
 =?utf-8?B?Yk9vZGc0R1IyWVpPaGlhOEY5aDNzUksyczlha3FEZk9RMWFWU2NINHVyQkZo?=
 =?utf-8?B?aHozNjNiVGdac2YwYitESjc2Y1l5K2krQVBSeCsxSmQwVGlCSmhMUVNCRi8w?=
 =?utf-8?B?eGt3QnJPSlkvaEJUVjNnQlQyMnJHZThvcEFlUGkwYzk1aEtxUDI2VDZjMTIr?=
 =?utf-8?B?bUJCeFpnZ2E5T0sxRDBQYlVYUEZzcVp1dTNVN3EyTWdxc1VmcnlVRk1ra1g1?=
 =?utf-8?B?M1JhM05PcVZuT1BrUU44MUpGWGRuWjZaQ25TYWRWaWRZM20zNkFoZDgwOFR2?=
 =?utf-8?B?V0Mrc3lWUmlOZ0dlRE9Cb3RTUDVhb1VYZXE3TU9obEpLZTZvbU5FaHQzYzcw?=
 =?utf-8?B?NXVxZkhWSDN0VktPRDd1MDg5YndnbzRLRC8waUc2azZxaW1GdTQyemNuVUl2?=
 =?utf-8?B?STNMWUIyaHppRVgwdzZhMnpMdlpnUFdPY1M5TUdsalZoc1hXK3BXUXpPZjk5?=
 =?utf-8?B?UzRTaThDUFd1RDRGL3lPUXd4SjJWay85S3pUYThIclBHdE5SSTZIQ2wyZmJy?=
 =?utf-8?B?cThsZlR6OGdQQkxZR0xFVVBicHg3R2dKODBPZkIwTG9TQXdSVThJWWFTSWho?=
 =?utf-8?B?eDZPUlBDcEYwRWEvS3VMcFdLTURPMVNrTGdhaUtKRzFlcDNyTTBpUnJaYlll?=
 =?utf-8?B?ak5JR0h3S1ZkK0NLeElmZ1ZZcHdqTzdXSTY5NzFZNjBPSHU1NGxnN0xtWHg0?=
 =?utf-8?B?NUFDN0hXQzA2V2hPenRaMnk1R2M2MGU2dXB3OFljY1d4UmdTUFd0cytwMVB3?=
 =?utf-8?B?UDJiZnV3MGUwKzJ6OXUvb3RKcEkzRnN2RjlSbUc3SWYxWTJvS29ndmhUNUlr?=
 =?utf-8?B?Q3BYSWtvK0E1aVZscGc4L1UxRUhFV3hlQjY0RXNKQmNVWkFQSmlacFZWcnRq?=
 =?utf-8?B?OTlTbjV6U1NUOWkyeHhHaHd2MXB4T2R1T1lnNVFlaGFjRzNkVVZvVXZ3eVM5?=
 =?utf-8?B?dWYycTVDVS8vOU9QWlZ5OTlnUDYvaVBVTE9EUSs2NCtRdDdId2RZSk8rSE4w?=
 =?utf-8?B?VmMyV2NRMVlEQnNGWGhuYVpsdWZHUGlZNjByZzVlRGR2YjhnREpraFJISzk1?=
 =?utf-8?B?cE1WYzZEc2F0M3JLZTd1dzlETUZoMlMxWERCK3FtWExma0VLNDhOUEpOT3ZY?=
 =?utf-8?B?MFkwc2F1VFJjMXcxUDk0YTJ6Nm96aHFQb0ZBVEd0Z01oZTVpaDNiWlBrQUlQ?=
 =?utf-8?B?MEFYVkwvdUxsRHl2ZjRCWGwzL0JKZk50c1krUFBSc0NvWTZOZVlMcnlDY2Jy?=
 =?utf-8?B?U1FtZXFMVGpLUTFSYWtQQXlEcWMxL3BsQTdUclZ5NDZwTHFzSlA4SG4yUlpQ?=
 =?utf-8?B?UldoM1MwL1BjYUlQc1cvT2I4SG1Rem05TVE5U2RuUE5KSkM3SENuc3dxdmxL?=
 =?utf-8?B?QUlsejgvSFB4WnkzNStySDNBNWNYMFBqL2ZmeU1KVnRkMG5BTE1TYjRKTDBO?=
 =?utf-8?B?dGlJMW5kb2haU3pvbDc2SjRUWjIzUkJ2OTJtVk1SRmxMRUtkelg3c3ltVHNr?=
 =?utf-8?Q?2Rp1M+DkHksJGUww21HAIyx3qnzZIWQFlzwAU3M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb913eb5-3c71-4369-4b88-08d8dccbfd66
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 16:06:36.3046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6u0yzoqUZdNtL6fa4XRth9/J5sCQaG01hVIpaoxX6oc/wTDyzwrnNoVQcjmCSjxR3lM21ChnynWmPjoESnYBNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4553
Subject: [Freedreno] 2021 X.Org Board of Directions Nomination period ends
 next Sunday
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: elections <elections@x.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Unfortunately my previous email seems to not have been received by many 
people. I will send this email separately to each mailing list to 
hopefully get better coverage.

The nomination period is currently ongoing. So far we have received 3 
nominations and will need at least 4 to fill the vacant spots on the 
board. We hope you will consider putting your nomination forward.

To nominate yourself or someone else please send the nomination, along 
with a personal statement to elections at x dot org.

** Election Schedule **

Nomination period Start: Mon 22nd February
Nomination period End: Sun 7th March
Deadline of X.Org membership application or renewal: Thu 11th March
Publication of Candidates & start of Candidate QA: Mon 15th March
Election Planned Start: Mon 22nd March anywhere on earth
Election Planned End: Sun 4th April anywhere on earth

** Election Committee **

* Eric Anholt
* Mark Filion
* Keith Packard
* Harry Wentland

Cheers,
Harry Wentland,
on behalf of the X.Org elections committee
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

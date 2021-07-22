Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDCA3D22C7
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 13:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386966EE77;
	Thu, 22 Jul 2021 11:33:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2044.outbound.protection.outlook.com [40.107.101.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7716EE43;
 Thu, 22 Jul 2021 11:33:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRyVwnk6mTREduU/hAkyMFrYIZkAPcUlA2/6B4iG+IscI4DHI50Y6Kqg8kd6yQq1F3LRnx6l1xKO7Tk3XCOetwt/fBTVXpQXF1QD3N2jVbZdP+oh4z1Gb4HPlVZAGpWuIKqFE7u29lZ5YEcaoyKlkEF/r6VmVmhaS+8bI7+dvFP6O5SQq2Y1fQaOdjNW/2FM4Hynykw2sa39UQqVBfF1HzIjS5BvjY3zlB7UbzDxklfGrseTNfo3Fa10KF5vlY3Hl72o26viHqaeoeiJ/5aYGd2KENCxqoeRBRiH71WAT9Ve9Hy8vAz0tu4tLtfebPLwHEDhatEaRJ1ftYw/mm36MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv3Oixu36v78xoFH1kWYWCLxZyQxgg3OvtcwE1rJpeo=;
 b=HWPHaOUidAJQ0PJMhT8w3vu+sv0Rt0U/ntozJGIeOhoiNQHwjU0FWmsudSxrvqyDPK3Uj8AYCwR2cEgk+043IQZX4u2SzAHY34lxmlgBLNff38Qu6plltTtbXMuXMeKhpLKx7EPuVt/aBwSTkXlqO0YcQirL+j/C8mJL8lOxUZ279BvP+iU21Xgpt/pHOeWeg5smQMkbay0jQMX6Ss2WDy7IE8/lKfi9w9vYZyfCa2mh8M/NYQqq6KdwIoFsdhYSYqIxV+2/U7eYURokJqx/2CeKWMX8OOmgXChS12qZoIM/kBkKF2ERe8MUf9tMhj+DFmZvHcgeETPE/DgywUD9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv3Oixu36v78xoFH1kWYWCLxZyQxgg3OvtcwE1rJpeo=;
 b=LCBB3RhvxH+LgnjdMSPoLv6D+SUkVNO8y3f+dJlR6+Z3jKd40a+l54eBZ1v3SVOp2k8hYByA+LoFHgffKQQkJIRZPb3l9q4PPv70P6hOhXYKMHBniHUe0LLgrDT8Zzhbg/+V5x3XwaMIDgQvSQiShmocuzEtFrQXjre0lryfgDs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2577.namprd12.prod.outlook.com (2603:10b6:207:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.32; Thu, 22 Jul
 2021 11:33:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:33:24 +0000
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local>
 <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
 <YPk1izQFR+tRV8js@phenom.ffwll.local>
 <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
 <YPlMpoGbXYKUFwCq@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ada9767a-5f7b-6e5a-8c08-ceee251c6fae@amd.com>
Date: Thu, 22 Jul 2021 13:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YPlMpoGbXYKUFwCq@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b706:b115:9c6f:aeee]
 (2a02:908:1252:fb60:b706:b115:9c6f:aeee) by
 FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.13 via Frontend Transport; Thu, 22 Jul 2021 11:33:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c814c36f-19ba-4729-48e3-08d94d048462
X-MS-TrafficTypeDiagnostic: BL0PR12MB2577:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2577D1D5217FE74C3EAEB77C83E49@BL0PR12MB2577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCCGJYn1VBViSRj9NlJtr4jGBRs7vHybfF3I5ovbeV22P5oT1w87phSz0S7CHTXeUuj2xvIpOisBufZqIvtsaMA1roJZYqBAzgzrmr5AohGWYWuqDYB1YSwOP0xaWRvx7ISWJu3CNOX+Fd0GY7p/g6KSs8xor+AHxJqhnyk2j8FMkZAlHYUBBPCucrG2WgDSQcsXCDMAJ9G/QrE2HTepm5LAq4aI7dxVxjm2nYckpfp2JHOFMhd3MU0PHgRI2ZDn3Rn3YYTBpIMPRTqvBsnrIG2w48ktsjCr8BNBJGWLFr+8gg3afBM64xLSk5y4DoiNdbBLSBG9bxZWWr0svCRH17sdJNkSlmeKbNWkBysyZcSWL9Mz0tGWck6ocDx+pZec39TKPjkiwGq0xvnjhbLMysYtMHQxU/T/D9txYC4kIXgBeWD0/9jDC07RavORKwhrN3wTztuQ1MAbjZ6TBRUHWTUJPI3ubPux2nxSXl9M+Rq//q/wrUtUrElY2clrKXKKkePT4axkUVdJErrCtaZ+bYeYeidxZeC/AYAxPWavl171TV8IXbYkL6XH/S3ykhpF0vu2AKPrTFHKowec4l8TSWjS3d4k2WOSEVHIMpFjpMyVtlo7a5KA0yNICVfZn4PKocTm5xiEpEtysS2PYIH43HFho3eHySBCTmVsEetSKguFmpyRJkk7ajm/J+La0Llh/AGj/7toeRMl4JYeMwfJD0mymGc5G860w/y3Ath8cMK1QcRxkGKuUNS8v8x5Rv18
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(110136005)(5660300002)(316002)(31686004)(86362001)(31696002)(38100700002)(921005)(83380400001)(66476007)(66556008)(7416002)(6486002)(478600001)(8676002)(2906002)(2616005)(8936002)(36756003)(66574015)(66946007)(6666004)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU41N2lkNXVUdGEwSW5abGYzclVLb1JZc0JMWmQzeGhqZ2tjelhkamJ5RmV2?=
 =?utf-8?B?YVk2ZjNiN3pzUVlqNGFka1pXU2tZdXliazdCQlN2aW9PYmIrb01sUW1HenMz?=
 =?utf-8?B?R0JLZmU1eWRsWi9pa3NWRGVxaEZXbkJLakNMMWVxM01DRTZwKzJwYyt3SUVs?=
 =?utf-8?B?ZURzekVSb1V5cW5JMjRKV3J1SVVxeXVmOWJLVjJjUG50dG56bUltYk8wdVh1?=
 =?utf-8?B?d1o2VHUxaHRvYytjSFc5aTJBcjlmKy9LWVBZSG1yYk85Q05abDFQUHJBOGMw?=
 =?utf-8?B?YWVxZmVZZ212VGFBbzd6UGFsLzhnWE5KTm1BT0hYbmo2cC9yckNrRlVvdUNJ?=
 =?utf-8?B?dWpqcFk3em56aXM3dzJJbXB1V0QxOUxhSWdhNkc0eXZVNzdvUDM4VndsMHRl?=
 =?utf-8?B?MWJDMTEzcjFNOWtQZzBONDJ1RWEveTNtRTRxSHBXY3R4SlVyVlZpNEVQTjlX?=
 =?utf-8?B?UUpwS0p2MjhSOTF2RldDQ2gyNmlINGM0cjdJQURYeEpFUGV1bjZ1NWRBazBK?=
 =?utf-8?B?SDJUVElKaytuQkhjVVZ3YnUxWGFOMjhtTDh5NGNqYUloN09aZktmRWFRMmEv?=
 =?utf-8?B?dmVsTGVWa0Zsb0tLMVV1dEVHUzVzYnhNcE1iR2hpZWVIQnZQWWNOVUY5OS8z?=
 =?utf-8?B?MFUwSzM5N21lTVFadWFoZ1BvWHhESzU1VU5QSVJKeFI5MkZUOXJ2VXJVNFcy?=
 =?utf-8?B?WVBrZHFNUW9KMnBUYy8wK3ltR2ZpT091OGlad2p3bHpNU1ZzMVBWaDg4V1B4?=
 =?utf-8?B?Z2pWZFpOdDQyNTcvODJ5WTVnVitPZTR1akdPTmFzL2FSb002UWlBb0NpanZZ?=
 =?utf-8?B?aUxSTysxVVZnYzdaZlp5WmFFdSt2YUVLWDN5d083NFNOVnlyT2xQV3lHU1dU?=
 =?utf-8?B?MHljV1BmZE5tdk5HNlc0YzBWLzhVNVdVKzhaWlJkTTM4aVM0dXNYMkJtbUt6?=
 =?utf-8?B?ZEkwSzRDcm1tbCtRSG9WMkhqU3NvZjQ4SWhDTmhwRWNqcERBRVlzV0JTQkE2?=
 =?utf-8?B?U3ZiWU1Ydys1alRlZHBQZkVGS04vOWhlZlZzbGloSUZBZHBZTVZ2dWl1Y2o2?=
 =?utf-8?B?YlFUWlBmb3EybmwxSlhqTEJwNDhpNitwaG44cDc5QW9HdnBkcUk0ZVpZWVZp?=
 =?utf-8?B?ZUZuSTI2dGR3bjB4ZkFENERlLzc4VW5CSDBvdXJLOWlyMjNFQjhuSWxwZ3VG?=
 =?utf-8?B?YnBqL3VIcnhCRTZqS3FHWHF2L1JjcC9pSThzK0hoMW9HUVgvblNxWXVVNHRH?=
 =?utf-8?B?LzVSZ2s1alhQK1hlRHByaEphOFZnYXg5NG5MUjJ1SFNhRm9RSmQ3c1dsb1g5?=
 =?utf-8?B?UXVsdWkwclVTT3JsRGlOVFkxdkdUaEV0Z3VOdXJkVUpWQTBxRkw2TXNGeXNR?=
 =?utf-8?B?akwzeWVQYVJNZy85MEZvWUEvN1pzakdvcU5vdFNGbEw0YTVCK1FCdWt3L0k4?=
 =?utf-8?B?VzJVRmpleThHV0EwRExPQmVCdGpDb2hVQUtlN0VtQmtJVU82a1lRSXhrc3dF?=
 =?utf-8?B?RTZhOUtia1dtMmYySHlvYXNxOVo1alRyY1JVZlFRS1NDNkJCUXRPZStCTmpE?=
 =?utf-8?B?Y1crUjRGUUwrSXhSbHhFREpFR1p0NXNIWTVEVSsrV0todVJVdnN0VjhtNjdB?=
 =?utf-8?B?UHc2S3BFYzNjMmswdGRJRlRKUjJLZXZXb0xSZ0lIbmhva1JsWjl1MGNJbDhS?=
 =?utf-8?B?Q1BDK05kK0R6MG1KSE1FdnVlSWZYQnJyaVp1OVhMdnNFNStzeTlFbmZPaE9k?=
 =?utf-8?B?eGF1akdIQXRrTG9hbTFkQUJab2QrWkN0V1BuYXd4a29meG5rUnVCekVFeDNr?=
 =?utf-8?B?NVBlOFU4QlJKMEdvS09Fd3JBdjg0MVlFWTN1aGpkb2tNblpLY205OEV5VXZs?=
 =?utf-8?Q?olMUP1uphw0lQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c814c36f-19ba-4729-48e3-08d94d048462
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:33:24.7116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T+D1BPqFLivJ5P4B+xwBfk9x98vLh3QCr2/dNx8Z/VRDFsz4N/PAfxApD5bwAvN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
Subject: Re: [Freedreno] [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait()
 op
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QW0gMjIuMDcuMjEgdW0gMTI6NDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgSnVs
IDIyLCAyMDIxIGF0IDExOjI4OjAxQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDIyLjA3LjIxIHVtIDExOjA4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IFtTTklQXQo+
Pj4+IEFzIGZhciBhcyBJIGtub3cgd2FrZV91cF9zdGF0ZSgpIHRyaWVzIHRvIHJ1biB0aGUgdGhy
ZWFkIG9uIHRoZSBDUFUgaXQgd2FzCj4+Pj4gc2NoZWR1bGVkIGxhc3QsIHdoaWxlIHdhaXRfZXZl
bnRfKiBtYWtlcyB0aGUgdGhyZWFkIHJ1biBvbiB0aGUgQ1BVIHdobwo+Pj4+IGlzc3VlcyB0aGUg
d2FrZSBieSBkZWZhdWx0Lgo+Pj4+Cj4+Pj4gQW5kIHllcyBJJ3ZlIGFsc28gbm90aWNlZCB0aGlz
IGFscmVhZHkgYW5kIGl0IHdhcyBvbmUgb2YgdGhlIHJlYXNvbiB3aHkgSQo+Pj4+IHN1Z2dlc3Rl
ZCB0byB1c2UgYSB3YWl0X3F1ZXVlIGluc3RlYWQgb2YgdGhlIGhhbmQgd2lyZWQgZG1hX2ZlbmNl
X3dhaXQKPj4+PiBpbXBsZW1lbnRhdGlvbi4KPj4+IFRoZSBmaXJzdCB2ZXJzaW9ucyBoYWQgdXNl
ZCB3YWl0X3F1ZXVlLCBidXQgaWlyYyB3ZSBoYWQgc29tZSBpc3N1ZXMgd2l0aAo+Pj4gdGhlIGNh
bGxiYWNrcyBhbmQgc3R1ZmYgYW5kIHRoYXQgd2FzIHRoZSByZWFzb25zIGZvciBoYW5kLXJvbGxp
bmcuIE9yCj4+PiBtYXliZSBpdCB3YXMgdGhlIGludGVncmF0aW9uIG9mIHRoZSBsb2NrbGVzcyBm
YXN0cGF0aCBmb3IKPj4+IGRtYV9mZW5jZV9pc19zaWduYWxsZWQoKS4KPj4+Cj4+Pj4gW1NOSVBd
Cj4+Pj4gV2VsbCBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZXIgaWYgd2UgdXNlZCB0aGUgZXhpc3Rp
bmcgaW5mcmFzdHJ1Y3R1cmUgaW5zdGVhZAo+Pj4+IG9mIHJlLWludmVudGluZyBzdHVmZiBmb3Ig
ZG1hX2ZlbmNlLCBidXQgdGhhdCBjaGFuY2UgaXMgbG9uZyBnb25lLgo+Pj4+Cj4+Pj4gQW5kIHlv
dSBkb24ndCBuZWVkIGEgZG1hX2ZlbmNlX2NvbnRleHQgYmFzZSBjbGFzcywgYnV0IHJhdGhlciBq
dXN0IGEgZmxhZyBpbgo+Pj4+IHRoZSBkbWFfZmVuY2Vfb3BzIGlmIHlvdSB3YW50IHRvIGNoYW5n
ZSB0aGUgYmVoYXZpb3IuCj4+PiBJZiB0aGVyZSdzIHNvbWV0aGluZyBicm9rZW4gd2Ugc2hvdWxk
IGp1c3QgZml4IGl0LCBub3QgZm9yY2UgZXZlcnlvbmUgdG8KPj4+IHNldCBhIHJhbmRvbSBmbGFn
LiBkbWFfZmVuY2Ugd29yayBsaWtlIHNwZWNpYWwgd2FpdF9xdWV1ZXMsIHNvIGlmIHdlCj4+PiBk
aWZmZXIgdGhlbiB3ZSBzaG91bGQgZ28gYmFjayB0byB0aGF0Lgo+PiBXYWl0IGEgc2Vjb25kIHdp
dGggdGhhdCwgdGhpcyBpcyBub3QgYnJva2VuLiBJdCdzIGp1c3QgZGlmZmVyZW50IGJlaGF2aW9y
Cj4+IGFuZCB0aGVyZSBhcmUgZ29vZCBhcmd1bWVudHMgZm9yIGJvdGggc2lkZXMuCj4gT2ggSSBr
bm93LCBidXQgc2luY2UgZG1hX2ZlbmNlIGlzIG1lYW50IHRvIGJlIGEgd2FpdF9xdWV1ZSB3aXRo
IGh3Cj4gc3VwcG9ydCwgdGhleSByZWFsbHkgc2hvdWxkIHdvcmsgdGhlIHNhbWUgYW5kIGhhdmUg
dGhlIHNhbWUgdHVuaW5nLgo+Cj4+IElmIGEgd2FpdCBpcyBzaG9ydCB5b3UgY2FuIGhhdmUgc2l0
dWF0aW9ucyB3aGVyZSB5b3Ugd2FudCB0byBzdGFydCB0aGUKPj4gdGhyZWFkIG9uIHRoZSBvcmln
aW5hbCBDUFUuCj4+ICDCoMKgwqAgVGhpcyBpcyBiZWNhdXNlIHlvdSBjYW4gYXNzdW1lIHRoYXQg
dGhlIGNhY2hlcyBvbiB0aGF0IENQVSBhcmUgc3RpbGwgaG90Cj4+IGFuZCBoZWF0aW5nIHVwIHRo
ZSBjYWNoZXMgb24gdGhlIGxvY2FsIENQVSB3b3VsZCB0YWtlIGxvbmdlciB0aGFuIGFuIGludGVy
Cj4+IENQVSBpbnRlcnJ1cHQuCj4+Cj4+IEJ1dCBpZiB0aGUgd2FpdCBpcyBsb25nIGl0IG1ha2Vz
IG1vcmUgc2Vuc2UgdG8gcnVuIHRoZSB0aHJlYWQgb24gdGhlIENQVQo+PiB3aGVyZSB5b3Ugbm90
aWNlZCB0aGUgd2FrZSB1cCBldmVudC4KPj4gIMKgwqDCoCBUaGlzIGlzIGJlY2F1c2UgeW91IGNh
biBhc3N1bWUgdGhhdCB0aGUgY2FjaGVzIGFyZSBjb2xkIGFueXdheSBhbmQKPj4gc3RhcnRpbmcg
dGhlIHRocmVhZCBvbiB0aGUgY3VycmVudCBDUFUgKG1vc3QgbGlrZWx5IGZyb20gYW4gaW50ZXJy
dXB0Cj4+IGhhbmRsZXIpIGdpdmVzIHlvdSB0aGUgYWJzb2x1dGVseSBiZXN0IGxhdGVuY3kuCj4+
ICDCoMKgwqAgSW4gb3RoZXIgd29yZHMgeW91IHVzdWFsbHkgcmV0dXJuIGZyb20gdGhlIGludGVy
cnVwdCBoYW5kbGVyIGFuZCBqdXN0Cj4+IGRpcmVjdGx5IHN3aXRjaCB0byB0aGUgbm93IHJ1bm5p
bmcgdGhyZWFkLgo+Pgo+PiBJJ20gbm90IHN1cmUgaWYgYWxsIGRyaXZlcnMgd2FudCB0aGUgc2Ft
ZSBiZWhhdmlvci4gUm9iIGhlcmUgc2VlbXMgdG8gcHJlZmVyCj4+IG51bWJlciAyLCBidXQgd2Ug
aGF2ZSB1c2VkIDEgZm9yIGRtYV9mZW5jZSBmb3IgYSByYXRoZXIgbG9uZyB0aW1lIG5vdyBhbmQg
aXQKPj4gY291bGQgYmUgdGhhdCBzb21lIHBlb3BsZSBzdGFydCB0byBjb21wbGFpbiB3aGVuIHdl
IHN3aXRjaCB1bmNvbmRpdGlvbmFsbHkuCj4gSSB0aGluayB0aGUgZGVmYXVsdHMgYXJlIGRpZmZl
cmVudCBiZWNhdXNlIHVzdWFsbHkgaWYgeW91IHdha2UgdXAgYSB3YWl0Cj4gcXVldWUsIHRoZXJl
J3MgYSAxOjEgcmVsYXRpb25zaGlwIGJldHdlZW4gd2FrZXIgYW5kIHdhaXRlci4KPgo+IE90b2gg
aWYgeW91IGp1c3Qgd2FrZSBhIHRocmVhZCBpdCdzIHByb2JhYmx5IHNvbWUga2luZGEgb2Ygc2Vy
dmljZSB0aHJlYWQsCj4gc28gTjoxIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHdha2VyIGFuZCB3YWl0
ZXIuIEFuZCBpbiB0aGF0IGNhc2UgbW92aW5nIHRoZQo+IHdhaXRlciBpcyBhIHJlYWxseSBiYWQg
aWRlYS4KCkV4YWN0bHkgdGhhdCwgeWVzLgoKPiBJIHRoaW5rIGRtYV9mZW5jZSBpcyBnZW5lcmFs
bHkgbXVjaCBjbG9zZXIgdG8gMToxICh3aXRoIHRoZSBtb3N0IGNvbW1vbgo+IG9uZSBpcnEgaGFu
ZGxlciAtPiBzY2hlZHVsZXIgdGhyZWFkIGZvciB0aGF0IGVuZ2luZSksIHNvIGhhdmluZyB0aGUg
InNhbWUKPiBjcHUiIHdha2UgYmVoYXZpb3VyIHJlYWxseSBzb3VuZHMgbGlrZSB0aGUgcmlnaHQg
dGhpbmcgdG8gZG8uIEFuZCBub3QKPiBhbnl0aGluZyB0aGF0IGlzIHNwZWNpZmljYWxseSBhbiBp
c3N1ZSB3aXRoIGhvdyBxdWFsY29tIGdwdXMgd29yaywgYW5kCj4gaGVuY2Ugc2hvdWxkIGJlIG1z
bSBzcGVjaWZpYy4KClRoYXQncyB0aGUgcG9pbnQgSSByZWFsbHkgY2FuJ3QganVkZ2UuIEF0IGxl
YXN0IGZvciBBTUQgc3R1ZmYgd2UgdHJ5IAp2ZXJ5IGhhcmQgdG8gYXZvaWQgd2FpdGluZyBmb3Ig
dGhlIEdQVSBpbiB0aGUgZmlyc3QgcGxhY2UuCgpCdXQgeWVzIGl0IG1pZ2h0IGluZGVlZCBiZSBi
ZXR0ZXIgdG8gZG8gaXQgbGlrZSB0aGlzLCBidXQgdG8gYmUgaG9uZXN0IApubyBpZGVhIHdoYXQg
ZnVuY3Rpb25zIHNob3VsZCBhY3R1YWxseSBiZSB1c2VkIGZvciB0aGlzLgoKU28gZmVlbCBmcmVl
IHRvIGludmVzdGlnYXRlIGZ1cnRoZXIgaG93IHRvIGltcHJvdmUgdGhpcy4KCj4gSWYgaXQgdHVy
bnMgb3V0IHRvIGJlIHRoZSB3cm9uZyB0aGluZywgd2VsbCBJIGd1ZXNzIHdlJ2xsIGxlYXJuCj4g
c29tZXRoaW5nLiBBbmQgdGhlbiBtYXliZSB3ZSBoYXZlIGEgZGlmZmVyZW50IHZlcnNpb24gb2Yg
ZG1hX2ZlbmNlX3dhaXQuCgpZZWFoLCBJIHdvdWxkIHJhdGhlciB0cnkgdG8gYXZvaWQgdGhhdC4K
CkNocmlzdGlhbi4KCj4gLURhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZnJlZWRyZW5vCg==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8684D38B478
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 18:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5326F4AF;
	Thu, 20 May 2021 16:41:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04A96F4ED;
 Thu, 20 May 2021 16:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0ewTf+O7GVIU6j7kxOzXvCkBtHf3irQxatf/KEzeZiFHt5XiVPJGbCbBwMO3XLE7uYz2wW0nBfPAptMWf/lkMcEzy3qmRqqofFQJP6VK4l8RBVqNKOeMgBS9onVh5lA+iqMCIh5SIE4sviAJ42lcm3HPg188ZpNmiaKqWFrFEkBYp1w0HLKLhjAf+pozkDUMNocnIUUokbit+bkkq6yxO6QlBfOGqKJKnx8KH5Ely65k73FneYm04GC2wT605+u7mU+1MoXsBNaJEV6qzLQSEmu9iKzOZ2Qcf/iMSakdE1QCK+goejmuFoNk50TbxA7DPRGqGAh4BBBpH30P4wBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78nV8qwt55wTYZcR9USkSRjzIS/JOr1J8JlKA6x1U48=;
 b=eB67AEta6+P4oe2lLslEY1idItKRzTr6sy2c6Gm5rIA/6PW7MqJdJiVpZ/WnecI7BbwgEuXU4bDHW3FiAfJtXBQPEauxWWaX0RoayRL3+yBF5GLqktyTiyTDOBVAu6GXXslvcpsZ+Uc5HiGubjxeCm1IjRLRYFY7GEUsW5n1GyVYAXH8j2Hw5HfxkpJLC2dHNcrk/UmiGnUHpFFvJToYJ/s3RBdkIzAGTdyD4H+d8GNoDCHJHDCbJidS9HBE9Hm50i/fJ8rcPedOlPujATJlhit6TRGy7DCInnd9LP0Py019BCVXPKTLm5g9HoyB91hRx6GXJD9eRRiHnCB22tezJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78nV8qwt55wTYZcR9USkSRjzIS/JOr1J8JlKA6x1U48=;
 b=mjnDHzqCJOFQCeJSke9g+2NxMGSORrhNG3APBOHUb8h4k/pbM7eUgrqNmSiMRGlaONay0sm51hXjaO8/UlQZUBOTw3k8cmtUWzTOeeCCqKyH4rSGLyseOyJ0ZGTKNBWw7+09ZpGGlyvQ6tkptCrzeiBID96tA8QRUPz6dmKHHK8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4946.namprd12.prod.outlook.com (2603:10b6:208:1c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 16:40:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 16:40:57 +0000
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, freedreno
 <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
 <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
 <e8f3d71c-7025-deab-4dd7-14f3fa6a8810@gmail.com>
 <YKaPf3VLfjoZJRw7@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4244879a-e2b8-7994-e3fb-f63c0e115a2c@amd.com>
Date: Thu, 20 May 2021 18:40:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YKaPf3VLfjoZJRw7@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: AM0PR06CA0106.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 AM0PR06CA0106.eurprd06.prod.outlook.com (2603:10a6:208:fa::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 16:40:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0461ea9a-e53c-4016-ec4f-08d91bae0abc
X-MS-TrafficTypeDiagnostic: BL0PR12MB4946:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4946D187EB9F8AC587EB2984832A9@BL0PR12MB4946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: alQHxaebRU9EGGJNA/GmQQcOV5zCPCYgGiYyPTLol1/rM/W/nImGkrndNhwi+h0RKF29QoHlYRX6zMZ1HozDL3f7PiC+5bpZSiICQXy3Ik1QeTCHmgXjRMa3ZzEh6qqBe5rmT06BVDP13xMG26M4ldWuBjMcejI1Fm4WCjMSPHNV+Z0lx8oeFDWJjbkPHL+zj/mu80uJQpZBYEQ/B09bJsi7riWw+tIx4bbIaR7eeb1ElUstmfc2Dgx0rmdiLEm8nNYy7Ai6BMOOeAZIpMKWHR/rsytZGh6bDZJTEDLbHHlU2OHk1Ho4nzDMQKlc2XL2j7N69rXEBuk/xo8BFp3M3SbOyOoRG2OpekST7+DFqyw5BzRPgCkLzGdMjd3UgDe6nw3152PBmQwubxysh7we8H+apkUokhhV+GjLsYDW6VDSaYWxgdpF2nM5irjN/0LensvFM/TP2OkcfngUkyb692M3cmPGO2QET703gm9F1R6BYLplCCB3krXECxYbeRqBcPc3txRUZ2AAztKTTawRye1HEIPcFI7ih9vMcR09Ej/vGCkqRAtF5HGyKhJMPxDqNPKeOysJZk73pmWXkLer4hy9DfWbHkPVzB1rZr8UmIZOykfwG2QR8VCyZtJEZSlKsfdMeMWsUXoDhgSU6BuC5krhI5aezrtnaaEgKdkb4QEcKb50TD0X6sT5K4TET0iUeSd+A+LeAmpR7iwkSiSBjzfFSRuKdoR06E5jaw5Nz06a2fmicDKOPXR/a2MhXZh6LL89pE6VWw0D93Nt7TCqm5AjyCBOAkDr7wnCzJEs7MMJu8b7R0XfTQbrVpONDJIT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39850400004)(316002)(36756003)(66556008)(186003)(8936002)(31686004)(16526019)(66946007)(8676002)(66476007)(110136005)(31696002)(52116002)(2906002)(86362001)(66574015)(2616005)(83380400001)(6486002)(53546011)(5660300002)(966005)(478600001)(38100700002)(45080400002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3ZDOUowUjgySzVSZkxZdytVNGMvLy9KemNVVXNsWm4zSUNiNkgzZnEzTGlq?=
 =?utf-8?B?WEt5RSsvMW9lUkdlQkU4dmc1N1Bpd2p4UnRIcXU4YWR1UU9hNGtQdXpIek8r?=
 =?utf-8?B?SGZYOGppb0ZTenBNWXgyVFovNTN4NjJTaml2bjNFbEVtbVRhR21SOTJVNXl6?=
 =?utf-8?B?Y0s0bC9zN2RtcnlpUCt3dTRodThPTG8zaTk0Y3NQRTBUTXpLNmpoMzI0OTJ5?=
 =?utf-8?B?WmtDTytsR2FnWlBBbVFEV1JJc3pxdmp2aGZVaFJ2bjNEZUxrTEY0Smt1TGZE?=
 =?utf-8?B?V3M2NXNJNDNkTnUrUTNnU1p0Nmo0ZU53N01qTGQ2RXhlVHpZenljUkpCTzZR?=
 =?utf-8?B?TkI1KytYTGpVOUdyY1NMRjNBanNxdWc0ZlFzUmRoWExrMHZlaTAyRElTLzhU?=
 =?utf-8?B?WXBBaDhZcTNOSnIrV2JmZW5mL2pIZW5FNmN4Vi9kVi9mVmUySGZWM1VydXNR?=
 =?utf-8?B?dFlNRXVYSDlNdWJ2a1BWRGdHREZ4VGU1bmxTYVV5Z044NXNVc01qbnVnaXJK?=
 =?utf-8?B?WDZnZGViSGNhbkZnMWRvL2M1WGxVTERRU0JaMkxURmhWeWdGQ2xzS2dMOXFX?=
 =?utf-8?B?ekI2czNJaXgyS1diVWttNXVrWG40dGx6cEhxY0NoUWtoNU9RNUhBU1IvZjlJ?=
 =?utf-8?B?M21KOURIL1ZHbDNzU1lZL2s1VnJ1bXhCdGk4Mk12MlZOOFlIbUt6aTdyVjV1?=
 =?utf-8?B?TytCQ284TC94NjRXc3lsdTRvMzNuQWxONHJoTUw1Sm1ocjBFNDhEd2FxeXNy?=
 =?utf-8?B?dHdta0RaaVNGWnllbmpJOFpYUmdNK28zSmp5clVBRHZid1Urc2pyOGVjd2la?=
 =?utf-8?B?VHNkMktibDJuaUJ3cklSOHNxVXlaYlhuUzloQTdQa0J0OHRQTlMxMDVTa1dN?=
 =?utf-8?B?WEkwTTZ3VHNkSjVIdlNTQzc1VkttalRRWm93MGQ2M2xoZmh2ZVFYVWREVnlw?=
 =?utf-8?B?OVRZZVR1WVZIdlpMQnNWYW5VQmRwaURjMG5jRFV2eU9sOTJxR1Z3ekdrcU1R?=
 =?utf-8?B?ZGxCQXlYZEpRR04vbmxpOVRBMWRrbmtBQTdvTDcrWGZmV1JuNGlnVEdlS0t4?=
 =?utf-8?B?SXVTU1BLYThSY2NFUVFqeTAzYmd2TDRhMFlyVU1Iak9pUGUvb2xROEE5aGVG?=
 =?utf-8?B?Z1BUWWNGRXM2NFlkQ0k4UFZIUGhXdVBwbC9pazUxNldSaU0zdm04Z0d5TUNm?=
 =?utf-8?B?MGNyMlRzREk4ejZNTFlwU1JNMnhVUFN0MTBZNDBKelhEZ3dvNmRkSjdieS9r?=
 =?utf-8?B?U3JjLytJV2FZT2poeS9NbUxVYWxHSEZnNnVKU3dJUmFBM08yd2tkYXlNKzVv?=
 =?utf-8?B?RXJ2ZjIweURnaUh3UVNFc0JJdHRGaGlxMU1RbEFnaHZXMENrNC90alpPajRl?=
 =?utf-8?B?RzVYZ2pTNnZDQlNaUDZpY2pobHRiSUNncTZsZmdGUW5zMHhTZFVHaytsSWY0?=
 =?utf-8?B?NlRmSUFhYXdhbCt6RXhLbzNZbWxrK1RrV3JteXNCKy81YURmd2ZKem9vK290?=
 =?utf-8?B?akp1cFkvdGw0bzV4VHpWUW1udklXYlBIRVV0S3FFZmNycTBhZE5SL2dhY0pL?=
 =?utf-8?B?OXl5NTVSUnNIT2tiWHVvZVdBY2xWZFV5d0NoZnlzNUIvdzhqZU5uaWhxTkli?=
 =?utf-8?B?alpjOUI0WnZzeXR3dFRtMEpkWFpxV0VWbHhVaXlxZlFwY3BJN1ZuVUlwemtF?=
 =?utf-8?B?aTBpRkM3YUNkc25sYTRpbXpMeVo5VVVyWVVIU0FhQXNXYmF5MzhUd2d3aWY2?=
 =?utf-8?B?S0ozcGpCY1dYSlhGdmpJeGVYa2Z0aUJnUmUvaG11akYxc3NUNGdVdG1jbXkz?=
 =?utf-8?B?Mml0ZVY4RDljdGUwc004czd6N3NIYzVYc1kxb0h5UmxGNjR5R3JpVHBSMlYr?=
 =?utf-8?Q?k+S7UTM0V84eQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0461ea9a-e53c-4016-ec4f-08d91bae0abc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 16:40:57.0057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1VbLD3y1QH6W1gM02EyA58RC/aAAbeltTWPKTlcIAfL6SAUu0Wq3Xe4bY81kSj+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4946
Subject: Re: [Freedreno] [Linaro-mm-sig] [RFC 1/3] dma-fence: Add boost
 fence op
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

QW0gMjAuMDUuMjEgdW0gMTg6MzQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgTWF5
IDIwLCAyMDIxIGF0IDA2OjAxOjM5UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDIwLjA1LjIxIHVtIDE2OjU0IHNjaHJpZWIgUm9iIENsYXJrOgo+Pj4gT24gVGh1LCBNYXkg
MjAsIDIwMjEgYXQgNzoxMSBBTSBDaHJpc3RpYW4gS8O2bmlnCj4+PiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IEFtIDIwLjA1LjIxIHVtIDE2OjA3IHNjaHJpZWIg
Um9iIENsYXJrOgo+Pj4+PiBPbiBXZWQsIE1heSAxOSwgMjAyMSBhdCAxMTo0NyBQTSBDaHJpc3Rp
YW4gS8O2bmlnCj4+Pj4+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Pj4+Pj4g
VWZmLCB0aGF0IGxvb2tzIHZlcnkgaGFyZHdhcmUgc3BlY2lmaWMgdG8gbWUuCj4+Pj4+IEhvd3Nv
PyAgSSdtIG5vdCBzdXJlIEkgYWdyZWUuLiBhbmQgZXZlbiBpZiBpdCB3YXMgbm90IHVzZWZ1bCBm
b3Igc29tZQo+Pj4+PiBodywgaXQgc2hvdWxkIGJlIHVzZWZ1bCBmb3IgZW5vdWdoIGRyaXZlcnMg
KGFuZCBoYXJtIG5vIGRyaXZlcnMpLCBzbyBJCj4+Pj4+IHN0aWxsIHRoaW5rIGl0IGlzIGEgZ29v
ZCBpZGVhCj4+Pj4+Cj4+Pj4+IFRoZSBmYWxsYmFjayBwbGFuIGlzIHRvIGdvIHRoZSBpOTE1IHJv
dXRlIGFuZCBzdG9wIHVzaW5nIGF0b21pYwo+Pj4+PiBoZWxwZXJzIGFuZCBkbyB0aGUgc2FtZSB0
aGluZyBpbnNpZGUgdGhlIGRyaXZlciwgYnV0IHRoYXQgZG9lc24ndCBoZWxwCj4+Pj4+IGFueSBv
ZiB0aGUgY2FzZXMgd2hlcmUgeW91IGhhdmUgYSBzZXBhcmF0ZSBrbXMgYW5kIGdwdSBkcml2ZXIu
Cj4+Pj4gWWVhaCwgdGhhdCdzIGNlcnRhaW5seSBub3Qgc29tZXRoaW5nIHdlIHdhbnQuCj4+Pj4K
Pj4+Pj4+IEFzIGZhciBhcyBJIGNhbiBzZWUgeW91IGNhbiBhbHNvIGltcGxlbWVudCBjb21wbGV0
ZWx5IGluc2lkZSB0aGUgYmFja2VuZAo+Pj4+Pj4gYnkgc3RhcnRpbmcgYSB0aW1lciBvbiBlbmFi
bGVfc2lnbmFsaW5nLCBkb24ndCB5b3U/Cj4+Pj4+IE5vdCByZWFsbHkuLiBJIG1lYW4sIHRoZSBm
YWN0IHRoYXQgc29tZXRoaW5nIHdhaXRlZCBvbiBhIGZlbmNlIGNvdWxkCj4+Pj4+IGJlIGEgdXNl
ZnVsIGlucHV0IHNpZ25hbCB0byBncHUgZnJlcSBnb3Zlcm5vciwgYnV0IGl0IGlzIGVudGlyZWx5
Cj4+Pj4+IGluc3VmZmljaWVudC4uCj4+Pj4+Cj4+Pj4+IElmIHRoZSBjcHUgaXMgc3BlbmRpbmcg
YSBsb3Qgb2YgdGltZSB3YWl0aW5nIG9uIGEgZmVuY2UsIGNwdWZyZXEgd2lsbAo+Pj4+PiBjbG9j
ayBkb3duIHNvIHlvdSBzcGVuZCBsZXNzIHRpbWUgd2FpdGluZy4gIEFuZCBubyBwcm9ibGVtIGhh
cyBiZWVuCj4+Pj4+IHNvbHZlZC4gIFlvdSBhYnNvbHV0ZWx5IG5lZWQgdGhlIGNvbmNlcHQgb2Yg
YSBtaXNzZWQgZGVhZGxpbmUsIGFuZCBhCj4+Pj4+IHRpbWVyIGRvZXNuJ3QgZ2l2ZSB5b3UgdGhh
dC4KPj4+PiBPayB0aGVuIEkgcHJvYmFibHkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgdXNlIGNhc2Ug
aGVyZS4KPj4+Pgo+Pj4+IFdoYXQgZXhhY3RseSBkbyB5b3UgdHJ5IHRvIHNvbHZlPwo+Pj4gQmFz
aWNhbGx5IHNpdHVhdGlvbnMgd2hlcmUgeW91IGFyZSBwaW5nLXBvbmdpbmcgYmV0d2VlbiBHUFUg
YW5kIENQVS4uCj4+PiBmb3IgZXhhbXBsZSBpZiB5b3UgYXJlIGRvdWJsZSBidWZmZXJpbmcgaW5z
dGVhZCBvZiB0cmlwbGUgYnVmZmVyaW5nLAo+Pj4gYW5kIGRvaW5nIHZibGFuayBzeW5jJ2QgcGFn
ZWZsaXBzLiAgVGhlIEdQVSwgd2l0aG91dCBhbnkgZXh0cmEgc2lnbmFsLAo+Pj4gY291bGQgZ2V0
IHN0dWNrIGF0IDMwZnBzIGFuZCBhIGxvdyBncHUgZnJlcSwgYmVjYXVzZSBpdCBlbmRzIHVwIGlk
bGUKPj4+IHdoaWxlIHdhaXRpbmcgZm9yIGFuIGV4dHJhIHZibGFuayBjeWNsZSBmb3IgdGhlIG5l
eHQgYmFjay1idWZmZXIgdG8KPj4+IGJlY29tZSBhdmFpbGFibGUuICBXaGVyZWFzIGlmIGl0IGJv
b3N0ZWQgdXAgdG8gYSBoaWdoZXIgZnJlcSBhbmQKPj4+IHN0b3BwZWQgbWlzc2luZyBhIHZibGFu
ayBkZWFkbGluZSwgaXQgd291bGQgYmUgbGVzcyBpZGxlIGR1ZSB0bwo+Pj4gZ2V0dGluZyB0aGUg
bmV4dCBiYWNrLWJ1ZmZlciBzb29uZXIgKGR1ZSB0byBub3QgbWlzc2luZyBhIHZibGFuawo+Pj4g
ZGVhZGxpbmUpLgo+PiBPayB0aGUgaXMgdGhlIHdoeSwgYnV0IHdoYXQgYWJvdXQgdGhlIGhvdz8K
Pj4KPj4gSG93IGRvZXMgaXQgaGVscCB0byBoYXZlIHRoaXMgYm9vc3QgY2FsbGJhY2sgYW5kIG5v
dCBqdXN0IHN0YXJ0IGEgdGltZSBvbgo+PiBlbmFibGUgc2lnbmFsaW5nIGFuZCBzdG9wIGl0IHdo
ZW4gdGhlIHNpZ25hbCBhcnJpdmVzPwo+IEJlY2F1c2UgdGhlIHJlbmRlciBzaWRlIChvciBkcm0v
c2NoZWR1bGVyLCBpZiBtc20gd291bGQgdXNlIHRoYXQpIGhhcyBubwo+IGlkZWEgZm9yIHdoaWNo
IHZibGFuayBhIHJlbmRlcmluZyBhY3R1YWxseSBpcyBmb3IuCgpBSCEgU28gd2UgYXJlIGJhc2lj
YWxseSB0ZWxsaW5nIHRoZSBmZW5jZSBiYWNrZW5kIHRoYXQgd2UgaGF2ZSBqdXN0IAptaXNzZWQg
YW4gZXZlbnQgd2Ugd2FpdGVkIGZvci4KClNvIHdoYXQgd2Ugd2FudCB0byBrbm93IGlzIGhvdyBs
b25nIHRoZSBmcm9udGVuZCB3YW50ZWQgdG8gd2FpdCBpbnN0ZWFkIApvZiBob3cgbG9uZyB0aGUg
YmFja2VuZCB0b29rIGZvciByZW5kZXJpbmcuCgo+IFNvIGJvb3N0aW5nIHJpZ2h0IHdoZW4geW91
J3ZlIG1pc3NlZCB5b3VyIGZyYW1lIChub3Qgd2hhdCBSb2IgaW1wbGVtZW50cwo+IGN1cnJlbnRs
eSwgYnV0IGZpeGFibGUpIGlzIHRoZSByaWdodCBzZW1hbnRpY3MuCj4KPiBUaGUgb3RoZXIgaXNz
dWUgaXMgdGhhdCBmb3IgY3B1IHdhaXRzLCB3ZSB3YW50IHRvIGRpZmZlcmVudGlhdGUgZnJvbSBm
ZW5jZQo+IHdhaXRzIHRoYXQgdXNlcnNwYWNlIGRvZXMgaW50ZW50aWFsbHkgKGUuZy4gd2FpdCBp
b2N0bCkgYW5kIHdhaXRzIHRoYXQKPiByYW5kb20gb3RoZXIgdGhpbmdzIGFyZSBkb2luZyB3aXRo
aW4gdGhlIGtlcm5lbCB0byBrZWVwIHRyYWNrIG9mIHByb2dyZXNzLgo+Cj4gRm9yIHRoZSBmb3Jt
ZXIgd2Uga25vdyB0aGF0IHVzZXJzcGFjZSBpcyBzdHVjayB3YWl0aW5nIGZvciB0aGUgZ3B1LCBh
bmQgd2UKPiBwcm9iYWJseSB3YW50IHRvIGJvb3N0LiBGb3IgdGhlIGxhdHRlciB3ZSBtb3N0IGRl
ZmluaXRlbHkgZG8gX25vdF8gd2FudCB0bwo+IGJvb3N0Lgo+Cj4gT3RvaCBJIGRvIGFncmVlIHdp
dGggeW91IHRoYXQgdGhlIGN1cnJlbnQgYXBpIGlzIGEgYml0IGF3a3dhcmQsIHNvIHBlcmhhcHMK
PiB3ZSBkbyBuZWVkIGEgZG1hX2ZlbmNlX3VzZXJzcGFjZV93YWl0IHdyYXBwZXIgd2hpY2ggYm9v
c3RzIGF1dG9tYXRpY2FsbHkKPiBhZnRlciBhIGJpdC4gQW5kIHNpbWlsYXJseSBwZXJoYXBzIGEg
ZHJtX3ZibGFua19kbWFfZmVuY2Vfd2FpdCwgd2hlcmUgeW91Cj4gZ2l2ZSBpdCBhIHZibGFuayB0
YXJnZXQsIGFuZCBpZiB0aGUgZmVuY2UgaXNuJ3Qgc2lnbmFsbGVkIGJ5IHRoZW4sIHdlIGtpY2sK
PiBpdCByZWFsIGhhcmQuCgpZZWFoLCBzb21ldGhpbmcgbGlrZSBhbiB1c2UgY2FzZSBkcml2ZW4g
QVBJIHdvdWxkIGJlIG5pY2UgdG8gaGF2ZS4KCkZvciB0aGlzIHBhcnRpY3VsYXIgY2FzZSBJIHN1
Z2dlc3QgdGhhdCB3ZSBzb21laG93IGV4dGVuZCB0aGUgZW5hYmxlIApzaWduYWxpbmcgY2FsbGJh
Y2suCgo+IEJ1dCBvdGhlcndpc2UgeWVzIHRoaXMgaXMgYWJzb2x1dGVseSBhIHRoaW5nIHRoYXQg
bWF0dGVycyBhIHRvbi4gSWYgeW91Cj4gbG9vayBhdCBNYXR0IEJyb3N0J3Mgc2NoZWR1bGVyIHJm
YywgdGhlcmUncyBhbHNvIGEgbGluZSBpdGVtIGluIHRoZXJlCj4gYWJvdXQgYWRkaW5nIHRoaXMg
a2luZCBvZiBib29zdGluZyB0byBkcm0vc2NoZWR1bGVyLgoKQlRXOiBJIHN0aWxsIGNhbid0IHNl
ZSB0aGlzIGluIG15IGluYm94LgoKRG8geW91IGhhdmUgYSBsaW5rPwoKQ2hyaXN0aWFuLgoKPiAt
RGFuaWVsCj4KPgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+PiBCUiwKPj4+IC1SCj4+
Pgo+Pj4+IFRoYW5rcywKPj4+PiBDaHJpc3RpYW4uCj4+Pj4KPj4+Pj4gQlIsCj4+Pj4+IC1SCj4+
Pj4+Cj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pgo+Pj4+Pj4gQW0gMTkuMDUuMjEgdW0gMjA6Mzgg
c2NocmllYiBSb2IgQ2xhcms6Cj4+Pj4+Pj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hy
b21pdW0ub3JnPgo+Pj4+Pj4+Cj4+Pj4+Pj4gQWRkIGEgd2F5IHRvIGhpbnQgdG8gdGhlIGZlbmNl
IHNpZ25hbGVyIHRoYXQgYSBmZW5jZSB3YWl0ZXIgaGFzIG1pc3NlZCBhCj4+Pj4+Pj4gZGVhZGxp
bmUgd2FpdGluZyBvbiB0aGUgZmVuY2UuCj4+Pj4+Pj4KPj4+Pj4+PiBJbiBzb21lIGNhc2VzLCBt
aXNzaW5nIGEgdmJsYW5rIGNhbiByZXN1bHQgaW4gbG93ZXIgZ3B1IHV0aWxpemF0aW9uLAo+Pj4+
Pj4+IHdoZW4gcmVhbGx5IHdlIHdhbnQgdG8gZ28gaW4gdGhlIG9wcG9zaXRlIGRpcmVjdGlvbiBh
bmQgYm9vc3QgZ3B1IGZyZXEuCj4+Pj4+Pj4gVGhlIGJvb3N0IGNhbGxiYWNrIGdpdmVzIHNvbWUg
ZmVlZGJhY2sgdG8gdGhlIGZlbmNlIHNpZ25hbGVyIHRoYXQgd2UKPj4+Pj4+PiBhcmUgbWlzc2lu
ZyBkZWFkbGluZXMsIHNvIGl0IGNhbiB0YWtlIHRoaXMgaW50byBhY2NvdW50IGluIGl0J3MgZnJl
cS8KPj4+Pj4+PiB1dGlsaXphdGlvbiBjYWxjdWxhdGlvbnMuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4+Pj4+Pj4gLS0t
Cj4+Pj4+Pj4gICAgICBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIHwgMjYgKysrKysrKysrKysr
KysrKysrKysrKysrKysKPj4+Pj4+PiAgICAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25z
KCspCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2Uu
aCBiL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgKPj4+Pj4+PiBpbmRleCA5ZjEyZWZhYWE5M2Eu
LjE3MjcwMjUyMWFjYyAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5j
ZS5oCj4+Pj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaAo+Pj4+Pj4+IEBAIC0y
MzEsNiArMjMxLDE3IEBAIHN0cnVjdCBkbWFfZmVuY2Vfb3BzIHsKPj4+Pj4+PiAgICAgICAgICBz
aWduZWQgbG9uZyAoKndhaXQpKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLAo+Pj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBpbnRyLCBzaWduZWQgbG9uZyB0aW1lb3V0KTsK
Pj4+Pj4+Pgo+Pj4+Pj4+ICsgICAgIC8qKgo+Pj4+Pj4+ICsgICAgICAqIEBib29zdDoKPj4+Pj4+
PiArICAgICAgKgo+Pj4+Pj4+ICsgICAgICAqIE9wdGlvbmFsIGNhbGxiYWNrLCB0byBpbmRpY2F0
ZSB0aGF0IGEgZmVuY2Ugd2FpdGVyIG1pc3NlZCBhIGRlYWRsaW5lLgo+Pj4+Pj4+ICsgICAgICAq
IFRoaXMgY2FuIHNlcnZlIGFzIGEgc2lnbmFsIHRoYXQgKGlmIHBvc3NpYmxlKSB3aGF0ZXZlciBz
aWduYWxzIHRoZQo+Pj4+Pj4+ICsgICAgICAqIGZlbmNlIHNob3VsZCBib29zdCBpdCdzIGNsb2Nr
cy4KPj4+Pj4+PiArICAgICAgKgo+Pj4+Pj4+ICsgICAgICAqIFRoaXMgY2FuIGJlIGNhbGxlZCBp
biBhbnkgY29udGV4dCB0aGF0IGNhbiBjYWxsIGRtYV9mZW5jZV93YWl0KCkuCj4+Pj4+Pj4gKyAg
ICAgICovCj4+Pj4+Pj4gKyAgICAgdm9pZCAoKmJvb3N0KShzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5j
ZSk7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICAgICAgICAgIC8qKgo+Pj4+Pj4+ICAgICAgICAgICAqIEBy
ZWxlYXNlOgo+Pj4+Pj4+ICAgICAgICAgICAqCj4+Pj4+Pj4gQEAgLTU4Niw2ICs1OTcsMjEgQEAg
c3RhdGljIGlubGluZSBzaWduZWQgbG9uZyBkbWFfZmVuY2Vfd2FpdChzdHJ1Y3QgZG1hX2ZlbmNl
ICpmZW5jZSwgYm9vbCBpbnRyKQo+Pj4+Pj4+ICAgICAgICAgIHJldHVybiByZXQgPCAwID8gcmV0
IDogMDsKPj4+Pj4+PiAgICAgIH0KPj4+Pj4+Pgo+Pj4+Pj4+ICsvKioKPj4+Pj4+PiArICogZG1h
X2ZlbmNlX2Jvb3N0IC0gaGludCBmcm9tIHdhaXRlciB0aGF0IGl0IG1pc3NlZCBhIGRlYWRsaW5l
Cj4+Pj4+Pj4gKyAqCj4+Pj4+Pj4gKyAqIEBmZW5jZTogdGhlIGZlbmNlIHRoYXQgY2F1c2VkIHRo
ZSBtaXNzZWQgZGVhZGxpbmUKPj4+Pj4+PiArICoKPj4+Pj4+PiArICogVGhpcyBmdW5jdGlvbiBn
aXZlcyBhIGhpbnQgZnJvbSBhIGZlbmNlIHdhaXRlciB0aGF0IGEgZGVhZGxpbmUgd2FzCj4+Pj4+
Pj4gKyAqIG1pc3NlZCwgc28gdGhhdCB0aGUgZmVuY2Ugc2lnbmFsZXIgY2FuIGZhY3RvciB0aGlz
IGluIHRvIGRldmljZQo+Pj4+Pj4+ICsgKiBwb3dlciBzdGF0ZSBkZWNpc2lvbnMKPj4+Pj4+PiAr
ICovCj4+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBkbWFfZmVuY2VfYm9vc3Qoc3RydWN0IGRt
YV9mZW5jZSAqZmVuY2UpCj4+Pj4+Pj4gK3sKPj4+Pj4+PiArICAgICBpZiAoZmVuY2UtPm9wcy0+
Ym9vc3QpCj4+Pj4+Pj4gKyAgICAgICAgICAgICBmZW5jZS0+b3BzLT5ib29zdChmZW5jZSk7Cj4+
Pj4+Pj4gK30KPj4+Pj4+PiArCj4+Pj4+Pj4gICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICpkbWFfZmVu
Y2VfZ2V0X3N0dWIodm9pZCk7Cj4+Pj4+Pj4gICAgICB1NjQgZG1hX2ZlbmNlX2NvbnRleHRfYWxs
b2ModW5zaWduZWQgbnVtKTsKPj4+Pj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4+IExpbmFyby1tbS1zaWcgbWFpbGluZyBsaXN0Cj4+PiBM
aW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmxpbmFyby5v
cmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZsaW5hcm8tbW0tc2lnJmFtcDtkYXRhPTA0JTdDMDEl
N0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzY5YzE4NDNhOTNlYzQ4ODhhYmQzMDhkOTFi
YWQxOGJkJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzU3
MTI1MjU0ODAzMDI0NyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURB
aUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFt
cDtzZGF0YT1FSkJBOXJWbDV4VFJtZEVQenlDeUdYN3h5Wk1LQUdWaFRtb0Vuc1BmT3h3JTNEJmFt
cDtyZXNlcnZlZD0wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJl
bm8K

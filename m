Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E326738B135
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 16:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7001F6E402;
	Thu, 20 May 2021 14:11:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4776E402;
 Thu, 20 May 2021 14:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ko9RZG3/fMBqnrB9wO+pN5UBcOU3isjTfC6eoLkuSO6mOUhiJjpESvuEuJHHa+YTNvfo+fEuAne1FT08uuS22gjhkKXenlanQKZfnsGcVlXJzD0Q6ISsU6H8KfMQ9aGxzhtSHxjeABK6RqtV7cMLSEg0ihVbB6PP9bbfs2SHaDEB5F5FubymlKgovC5lfGouh+QRnxVktNhI2t5v7yL192J+7a+X1yyg+dQBo5GQxrfUfw8qLqQPcQBs+a5ujzDMcHCtJ+9QAu+60oaeC298bZySRWY0rlIieAAJMWzsdR6bjDKNXoflpD2spueHJ/2NiPtPtnUnTIxdGa6jM5c/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+QMbNqA+0lIrttnAt2Umj1ldsBbm0VngX6J/9WLTWU=;
 b=SyXgNvyomH2w1/m/8QgYryscPvIo+FNy/r107Dhi7e6EzlAW1RhzyZEGQTo6LIIyOfCVMozp2ZMCXsOjbE6/R1/rbbZwdM+pmIOJpjrQ9DXZH6QiIK27MxrqGwwHU19FqrYOJcftYknk7IE7ynEG8jVCkgpNtgkD+35EPtFsaJlK8gjM14SUzh9PMSxvDfQMoawHR/3GbMaf1SddTl4yYYQbMtiqYp7TXcJEC+b5IX7wRcZ3H5rZctS+L5clI15mN8kuPq0kcjxPK3ANUjNf+BvT5n1nQ9uoXaH+RcZcizKmpxpRe+6iyhHcES1rX8BU3WrB6f81rBvcBCbttZPExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+QMbNqA+0lIrttnAt2Umj1ldsBbm0VngX6J/9WLTWU=;
 b=C4Fi5UHtTo00PFFdnnj7+qKsUV7G+rUQScktbTHimg1mVRT4cetEaeqJNAixXYjaaxVtCKohaRk6K1zSFq69w2ScPlFCTe42YfT6PrAdI/uQPe0XBgc/invV7z+uAB4RWhQIPp8N1hX+UNwfRi/0lYuwaKuryiV+RsRddptmiic=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:11:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 14:11:26 +0000
To: Rob Clark <robdclark@gmail.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
Date: Thu, 20 May 2021 16:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4635:589e:67a4:e02a]
X-ClientProxiedBy: PR0P264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::29)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a]
 (2a02:908:1252:fb60:4635:589e:67a4:e02a) by
 PR0P264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:11:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6afb75b9-885f-4ee1-8b6c-08d91b992797
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4900389E27942A6D7BB36E8B832A9@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WrhJxArlGCU6pYBUG7CrQkYD1kLu6p3JDp3yCx1LxH48jfxezYhotkwKoLJiqqI5hLkF5WWidCUwcIFbaCCqko7EDESBnvU0QCWkUNR9Ka0Y5Lr1PSC21FxeC6wyioseuakZgDmDxSjjTdwpmLb/wYhsiWjy6oI+zVk5RrxA5a512wThDsJPPSBKbt4nstxhe3qlxzc264PXjlVXoC92ofO9EXch5t3Aub9v3fZ9D9WqiWk/e9lSO2XgbWIUUIDHjQwfICQZKY7tjBw2/zMmEOA+oV/q657EZXtO5H+8Trk9pmt1ZWzkb2zThzuuKIhYPgyIeZSB4riIFjRyVc9CA7Fr1tTDPIpzlSLTeErpaqfPcY7B4hbHjl12C6KOCkk6cKfFboHQabi5it266y3PPTHHH4r/cXHxYvAnHvX3D45S95Dwm4uTci6V/s4hr/p3QG145jbNssrJOJ0oPxUF2KwGq/Lf1+hUVGD1eDpTWhhIi3onO7q+XkmxG8bpdpYv4595tXLLvxu9p+foIpoVXMt7HvAoSfyxKawXw58xOznb5Z/kIZVEb/72t/+7dnQrH24Bt0E6CHh/uhdigLlAMuA69jKRpfpmCLAfqEmV+pmzXwI6cOy5q/HCEMmiW/ihyv8XKnMfVH5qHIMtHBzmtg3ub/gcGbLOPAe0W3A1RemOwYp0syMii7AdxDIXSb5Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(186003)(8936002)(16526019)(6486002)(6666004)(66574015)(83380400001)(31686004)(36756003)(8676002)(2906002)(38100700002)(6916009)(66946007)(478600001)(316002)(5660300002)(52116002)(53546011)(31696002)(54906003)(66556008)(66476007)(2616005)(4326008)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWN4ZGVrR0xIYURPQUxQc0d2TGlkdmYrYnhiWXNCditLVUh2ZEJqM1JSellq?=
 =?utf-8?B?TnJVQ1JhdDk4MFhWY1prMGlkbk9tZlVrTHFzc2FScWRacjBHZHMvVURzdXMw?=
 =?utf-8?B?SE5WaEx3blRQMVVVSXdtNktDdzNoWkVvZzk1MTYrSW1JTFN5am1BdVBDYnA5?=
 =?utf-8?B?cUdUeGw5bStkL1Z3QzBqSXJuN2lqTnBDQ1FMOHp2bEJaNllRWUU5dlZRdEpU?=
 =?utf-8?B?VkxTTzNLbUtUdGx6NndWUTBPU3QvUmNXVFNuQkNWQlg4VlVaVkZHNk1ROTBp?=
 =?utf-8?B?d3JnVHQyRDczR3dVdUtSdi84ZlhtVHdyWXE0NFp0RFZnb0ExLyt0M3BZUUw4?=
 =?utf-8?B?LzBGbENFdnpXbldXZUxESlRURGR0Ry9TRmJNWUsyQTU0NkRjektLZ3lpNVF5?=
 =?utf-8?B?T0NRNUhObzdSMTR0L045bTU0a3FzTWMxajRoL0NYcER2Nm40YlJwN2ZzSGZP?=
 =?utf-8?B?S0dQdGxxVGR4V05NYzV5MitQWWpKS2RSUmh4TjN4OGJ6SUVRQ1ZPdkRJZUJ4?=
 =?utf-8?B?aWs0bmpqVW5YcFFUOU13U05sYUxPTTZIR1UxUy8wUndJbDJzOFpKbzhMcjBS?=
 =?utf-8?B?Y1NMdWtIUVd4cHBjMnRSUzdQejR3QysvZEVBTTVNblg1MHdodlZacWNMZllI?=
 =?utf-8?B?NnExRUM3OTBWK2FBSC9DWDFvdmg0U3BVUkVqdUIyU1JqVk9VQWNMKzhxQ08v?=
 =?utf-8?B?OGlJTjhTNXZlZS9CVkxWSFgzakNnNFJZbXZkTDR4R2dJTHN3VU4zRXJSYkJH?=
 =?utf-8?B?SEsvdngxS1lPWEE1aG9NbkhHb3ROd2hGd3ZVdjhYRnAvZDlkbGFVRlhtMDYy?=
 =?utf-8?B?SUVhL2xjWW5QakJJRW5EL1d2YW1KTEVJNGJrY3VqWXFlZlJyWkdYSTFHRlF4?=
 =?utf-8?B?ZWV1YlJlWnVBSHNhd2krZUJxdWhqQWRMMWFuZmp2U1d3Ymd3eXZyMkR6YXYr?=
 =?utf-8?B?bEwzRXI1V09oU2R6R3NwSE1FSy9xWGNITGdZdmoxWkdZbk5FUVIwVXdiN1Na?=
 =?utf-8?B?ZGd3T0hYS1V5YXFIYVpDZEt2VmFwQjJjc3Y4MklyUGcvUWpCZGt5ajAveXVR?=
 =?utf-8?B?WmxaU2NESUtNSzg0anlLVTNhN29LcEx2RWwzc0tmV2V5ekVLVktBdlpvSDh4?=
 =?utf-8?B?OEVqdW83aUxHL1V5WmhOWU9XYUpTRTVubFBieS9zd2dpNEpPOHhNUStJbFNR?=
 =?utf-8?B?bkVub1Y4QWtwT3ZWOThpcXNxcldFWWM0M1R2RnlESS9SSUZUMWg1NFRUUlMz?=
 =?utf-8?B?a0lpdE1pcHdNYTR2VGZoQkVIZ2w0V1NwQjBDU1JXMldMU3B3WGdqc2F5TUNV?=
 =?utf-8?B?Zk5FeS9nbExETldCVm10dDA0d28wVHdWejVWMkhGSHVzZGNXNDZEaXhwUXNt?=
 =?utf-8?B?TnZlcjFQWG55UitZZXB4cWVCbzBQL0NMblRVTEZaSjdYakpXRFBpZU1ORXVF?=
 =?utf-8?B?SThJNWxxbjNXYXV1d3cyVEpxS3laSzhIaUJSZFBFb041Q2pXTFJROUJjTXdR?=
 =?utf-8?B?UlNGSVFRVHBodG0rdXByaWFCSW1Nc0VKeXdXWkNRMWRERThyRE03aWROeWUz?=
 =?utf-8?B?RlcxZDRPSUhnN241NGFRb0huRUI0ZjFjdnRaUEdTaEVZT3BJYnRJaHRScVpX?=
 =?utf-8?B?WGtiQ1lXd2pUR3M1NVNXakR3R3QrbmRScVErOWg1OHZPYm50Nkk5UXd3dXVP?=
 =?utf-8?B?RWJiWTBFWGVnN2ZPTEtrbEkrMlBCVjJNMGg1UE50cEdHZnJBRVdDbUFpU2dq?=
 =?utf-8?B?a2xhQUZ6VUFoSWdvbUdHcWJlOHg0L1UvakhtbnJpQk9sTktueFpjOEF3RGRl?=
 =?utf-8?B?dGpJN0VPei9NbE83dndzNEJSVzFYb3dJT1oyU0tYUDdKOHJESSt0M2dYS0dD?=
 =?utf-8?Q?gnFmQ8VDdIjwD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afb75b9-885f-4ee1-8b6c-08d91b992797
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:11:25.9434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qOqb5VsGaNrueZJdMSmiDyz/ihJD6KpGi4Lvu8Q/PpthobY8lbBUrQVDEoAEvsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
Subject: Re: [Freedreno] [RFC 1/3] dma-fence: Add boost fence op
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

CgpBbSAyMC4wNS4yMSB1bSAxNjowNyBzY2hyaWViIFJvYiBDbGFyazoKPiBPbiBXZWQsIE1heSAx
OSwgMjAyMSBhdCAxMTo0NyBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4gd3JvdGU6Cj4+IFVmZiwgdGhhdCBsb29rcyB2ZXJ5IGhhcmR3YXJlIHNwZWNpZmlj
IHRvIG1lLgo+IEhvd3NvPyAgSSdtIG5vdCBzdXJlIEkgYWdyZWUuLiBhbmQgZXZlbiBpZiBpdCB3
YXMgbm90IHVzZWZ1bCBmb3Igc29tZQo+IGh3LCBpdCBzaG91bGQgYmUgdXNlZnVsIGZvciBlbm91
Z2ggZHJpdmVycyAoYW5kIGhhcm0gbm8gZHJpdmVycyksIHNvIEkKPiBzdGlsbCB0aGluayBpdCBp
cyBhIGdvb2QgaWRlYQo+Cj4gVGhlIGZhbGxiYWNrIHBsYW4gaXMgdG8gZ28gdGhlIGk5MTUgcm91
dGUgYW5kIHN0b3AgdXNpbmcgYXRvbWljCj4gaGVscGVycyBhbmQgZG8gdGhlIHNhbWUgdGhpbmcg
aW5zaWRlIHRoZSBkcml2ZXIsIGJ1dCB0aGF0IGRvZXNuJ3QgaGVscAo+IGFueSBvZiB0aGUgY2Fz
ZXMgd2hlcmUgeW91IGhhdmUgYSBzZXBhcmF0ZSBrbXMgYW5kIGdwdSBkcml2ZXIuCgpZZWFoLCB0
aGF0J3MgY2VydGFpbmx5IG5vdCBzb21ldGhpbmcgd2Ugd2FudC4KCj4+IEFzIGZhciBhcyBJIGNh
biBzZWUgeW91IGNhbiBhbHNvIGltcGxlbWVudCBjb21wbGV0ZWx5IGluc2lkZSB0aGUgYmFja2Vu
ZAo+PiBieSBzdGFydGluZyBhIHRpbWVyIG9uIGVuYWJsZV9zaWduYWxpbmcsIGRvbid0IHlvdT8K
PiBOb3QgcmVhbGx5Li4gSSBtZWFuLCB0aGUgZmFjdCB0aGF0IHNvbWV0aGluZyB3YWl0ZWQgb24g
YSBmZW5jZSBjb3VsZAo+IGJlIGEgdXNlZnVsIGlucHV0IHNpZ25hbCB0byBncHUgZnJlcSBnb3Zl
cm5vciwgYnV0IGl0IGlzIGVudGlyZWx5Cj4gaW5zdWZmaWNpZW50Li4KPgo+IElmIHRoZSBjcHUg
aXMgc3BlbmRpbmcgYSBsb3Qgb2YgdGltZSB3YWl0aW5nIG9uIGEgZmVuY2UsIGNwdWZyZXEgd2ls
bAo+IGNsb2NrIGRvd24gc28geW91IHNwZW5kIGxlc3MgdGltZSB3YWl0aW5nLiAgQW5kIG5vIHBy
b2JsZW0gaGFzIGJlZW4KPiBzb2x2ZWQuICBZb3UgYWJzb2x1dGVseSBuZWVkIHRoZSBjb25jZXB0
IG9mIGEgbWlzc2VkIGRlYWRsaW5lLCBhbmQgYQo+IHRpbWVyIGRvZXNuJ3QgZ2l2ZSB5b3UgdGhh
dC4KCk9rIHRoZW4gSSBwcm9iYWJseSBkb24ndCB1bmRlcnN0YW5kIHRoZSB1c2UgY2FzZSBoZXJl
LgoKV2hhdCBleGFjdGx5IGRvIHlvdSB0cnkgdG8gc29sdmU/CgpUaGFua3MsCkNocmlzdGlhbi4K
Cj4KPiBCUiwKPiAtUgo+Cj4+IENocmlzdGlhbi4KPj4KPj4gQW0gMTkuMDUuMjEgdW0gMjA6Mzgg
c2NocmllYiBSb2IgQ2xhcms6Cj4+PiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1
bS5vcmc+Cj4+Pgo+Pj4gQWRkIGEgd2F5IHRvIGhpbnQgdG8gdGhlIGZlbmNlIHNpZ25hbGVyIHRo
YXQgYSBmZW5jZSB3YWl0ZXIgaGFzIG1pc3NlZCBhCj4+PiBkZWFkbGluZSB3YWl0aW5nIG9uIHRo
ZSBmZW5jZS4KPj4+Cj4+PiBJbiBzb21lIGNhc2VzLCBtaXNzaW5nIGEgdmJsYW5rIGNhbiByZXN1
bHQgaW4gbG93ZXIgZ3B1IHV0aWxpemF0aW9uLAo+Pj4gd2hlbiByZWFsbHkgd2Ugd2FudCB0byBn
byBpbiB0aGUgb3Bwb3NpdGUgZGlyZWN0aW9uIGFuZCBib29zdCBncHUgZnJlcS4KPj4+IFRoZSBi
b29zdCBjYWxsYmFjayBnaXZlcyBzb21lIGZlZWRiYWNrIHRvIHRoZSBmZW5jZSBzaWduYWxlciB0
aGF0IHdlCj4+PiBhcmUgbWlzc2luZyBkZWFkbGluZXMsIHNvIGl0IGNhbiB0YWtlIHRoaXMgaW50
byBhY2NvdW50IGluIGl0J3MgZnJlcS8KPj4+IHV0aWxpemF0aW9uIGNhbGN1bGF0aW9ucy4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4+
PiAtLS0KPj4+ICAgIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLmggfCAyNiArKysrKysrKysrKysr
KysrKysrKysrKysrKwo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaCBiL2luY2x1ZGUvbGlu
dXgvZG1hLWZlbmNlLmgKPj4+IGluZGV4IDlmMTJlZmFhYTkzYS4uMTcyNzAyNTIxYWNjIDEwMDY0
NAo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaAo+Pj4gKysrIGIvaW5jbHVkZS9s
aW51eC9kbWEtZmVuY2UuaAo+Pj4gQEAgLTIzMSw2ICsyMzEsMTcgQEAgc3RydWN0IGRtYV9mZW5j
ZV9vcHMgewo+Pj4gICAgICAgIHNpZ25lZCBsb25nICgqd2FpdCkoc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2UsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGludHIsIHNpZ25lZCBs
b25nIHRpbWVvdXQpOwo+Pj4KPj4+ICsgICAgIC8qKgo+Pj4gKyAgICAgICogQGJvb3N0Ogo+Pj4g
KyAgICAgICoKPj4+ICsgICAgICAqIE9wdGlvbmFsIGNhbGxiYWNrLCB0byBpbmRpY2F0ZSB0aGF0
IGEgZmVuY2Ugd2FpdGVyIG1pc3NlZCBhIGRlYWRsaW5lLgo+Pj4gKyAgICAgICogVGhpcyBjYW4g
c2VydmUgYXMgYSBzaWduYWwgdGhhdCAoaWYgcG9zc2libGUpIHdoYXRldmVyIHNpZ25hbHMgdGhl
Cj4+PiArICAgICAgKiBmZW5jZSBzaG91bGQgYm9vc3QgaXQncyBjbG9ja3MuCj4+PiArICAgICAg
Kgo+Pj4gKyAgICAgICogVGhpcyBjYW4gYmUgY2FsbGVkIGluIGFueSBjb250ZXh0IHRoYXQgY2Fu
IGNhbGwgZG1hX2ZlbmNlX3dhaXQoKS4KPj4+ICsgICAgICAqLwo+Pj4gKyAgICAgdm9pZCAoKmJv
b3N0KShzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSk7Cj4+PiArCj4+PiAgICAgICAgLyoqCj4+PiAg
ICAgICAgICogQHJlbGVhc2U6Cj4+PiAgICAgICAgICoKPj4+IEBAIC01ODYsNiArNTk3LDIxIEBA
IHN0YXRpYyBpbmxpbmUgc2lnbmVkIGxvbmcgZG1hX2ZlbmNlX3dhaXQoc3RydWN0IGRtYV9mZW5j
ZSAqZmVuY2UsIGJvb2wgaW50cikKPj4+ICAgICAgICByZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7
Cj4+PiAgICB9Cj4+Pgo+Pj4gKy8qKgo+Pj4gKyAqIGRtYV9mZW5jZV9ib29zdCAtIGhpbnQgZnJv
bSB3YWl0ZXIgdGhhdCBpdCBtaXNzZWQgYSBkZWFkbGluZQo+Pj4gKyAqCj4+PiArICogQGZlbmNl
OiB0aGUgZmVuY2UgdGhhdCBjYXVzZWQgdGhlIG1pc3NlZCBkZWFkbGluZQo+Pj4gKyAqCj4+PiAr
ICogVGhpcyBmdW5jdGlvbiBnaXZlcyBhIGhpbnQgZnJvbSBhIGZlbmNlIHdhaXRlciB0aGF0IGEg
ZGVhZGxpbmUgd2FzCj4+PiArICogbWlzc2VkLCBzbyB0aGF0IHRoZSBmZW5jZSBzaWduYWxlciBj
YW4gZmFjdG9yIHRoaXMgaW4gdG8gZGV2aWNlCj4+PiArICogcG93ZXIgc3RhdGUgZGVjaXNpb25z
Cj4+PiArICovCj4+PiArc3RhdGljIGlubGluZSB2b2lkIGRtYV9mZW5jZV9ib29zdChzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmZW5jZSkKPj4+ICt7Cj4+PiArICAgICBpZiAoZmVuY2UtPm9wcy0+Ym9vc3Qp
Cj4+PiArICAgICAgICAgICAgIGZlbmNlLT5vcHMtPmJvb3N0KGZlbmNlKTsKPj4+ICt9Cj4+PiAr
Cj4+PiAgICBzdHJ1Y3QgZG1hX2ZlbmNlICpkbWFfZmVuY2VfZ2V0X3N0dWIodm9pZCk7Cj4+PiAg
ICB1NjQgZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2ModW5zaWduZWQgbnVtKTsKPj4+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGlu
ZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K

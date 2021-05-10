Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC8E377C34
	for <lists+freedreno@lfdr.de>; Mon, 10 May 2021 08:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AE989F8E;
	Mon, 10 May 2021 06:17:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23C789F8E;
 Mon, 10 May 2021 06:17:50 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FdrPn6m1jz1BKlN;
 Mon, 10 May 2021 14:15:09 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Mon, 10 May 2021
 14:17:45 +0800
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
References: <20210510031606.3112-1-thunder.leizhen@huawei.com>
 <9109a395-099b-ed14-4433-d4bf6dbf5cef@cambridgegreys.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <0bb32dc4-b47e-25e8-70a6-fe9bf2c5078f@huawei.com>
Date: Mon, 10 May 2021 14:17:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9109a395-099b-ed14-4433-d4bf6dbf5cef@cambridgegreys.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Subject: Re: [Freedreno] [PATCH v2 0/1] drm/msm/dpu: Fix error return code
 in dpu_mdss_init()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLzUvMTAgMTQ6MDEsIEFudG9uIEl2YW5vdiB3cm90ZToKPiBPbiAxMC8wNS8yMDIx
IDA0OjE2LCBaaGVuIExlaSB3cm90ZToKPj4gdjEgLS0+IHYyOgo+PiBBY2NvcmRpbmcgdG8gQW50
b24gSXZhbm92J3MgcmV2aWV3IGNvbW1lbnRzLCBkZXRlbGUgdGhlIHVubmVjZXNzYXJ5IGxvY2Fs
Cj4+IHZhcmlhYmxlIGluaXRpYWxpemF0aW9uICJyZXQgPSAwIi4KPj4KPj4KPj4gWmhlbiBMZWkg
KDEpOgo+PiDCoMKgIGRybS9tc20vZHB1OiBGaXggZXJyb3IgcmV0dXJuIGNvZGUgaW4gZHB1X21k
c3NfaW5pdCgpCj4+Cj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9tZHNz
LmMgfCA4ICsrKysrLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4+Cj4gSSBkbyBub3QgcmVjYWxsIHJldmlld2luZyB0aGlzLgoKT2gsIFNv
cnJ5LCB0aGUgdHdvIGUtbWFpbHMgbmV4dCB0byBlYWNoIG90aGVyLiBJIGxvc3Qgc2lnaHQgb2Yg
dGhlbS4KCj4gCj4gSSB0aGluayB5b3UgZ290IHRoZSB3cm9uZyBBbnRvbiBJdmFub3YgLSBJIG1h
aW50YWluIFVNTCBzbyB0aGUgcHJldmlvdXMgcmV2aXNpb24gaGl0IHNvbWVvbmUncyBlbHNlIGlu
Ym94Lgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448DD0C46
	for <lists+freedreno@lfdr.de>; Wed,  9 Oct 2019 12:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF5C89B0D;
	Wed,  9 Oct 2019 10:10:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1323B89B0D
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2019 10:10:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56F3F28;
 Wed,  9 Oct 2019 03:10:40 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA2923F68E;
 Wed,  9 Oct 2019 03:10:38 -0700 (PDT)
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
 <20191007204906.19571-1-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e3782ea8-7d6b-21ed-84dd-0751c4cf310a@arm.com>
Date: Wed, 9 Oct 2019 11:10:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007204906.19571-1-robdclark@gmail.com>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH v2] iommu/arm-smmu: fix "hang" when games
 exit
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Joerg Roedel <joro@8bytes.org>, open list <linux-kernel@vger.kernel.org>,
 Will Deacon <will@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wNyA5OjQ5IHBtLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gRnJvbTogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IFdoZW4gZ2FtZXMsIGJyb3dzZXIsIG9yIGFu
eXRoaW5nIHVzaW5nIGEgbG90IG9mIEdQVSBidWZmZXJzIGV4aXRzLCB0aGVyZQo+IGNhbiBiZSBt
YW55IGh1bmRyZWRzIG9yIHRob3VzYW5kcyBvZiBidWZmZXJzIHRvIHVubWFwIGFuZCBmcmVlLiAg
SWYgdGhlCj4gR1BVIGlzIG90aGVyd2lzZSBzdXNwZW5kZWQsIHRoaXMgY2FuIGNhdXNlIGFybS1z
bW11IHRvIHJlc3VtZS9zdXNwZW5kCj4gZm9yIGVhY2ggYnVmZmVyLCByZXN1bHRpbmcgNS0xMCBz
ZWNvbmRzIHdvcnRoIG9mIHJlcHJvZ3JhbW1pbmcgdGhlCj4gY29udGV4dCBiYW5rIChhcm1fc21t
dV93cml0ZV9jb250ZXh0X2JhbmsoKS9hcm1fc21tdV93cml0ZV9zMmNyKCkvZXRjKS4KPiBUbyB0
aGUgdXNlciBpdCB3b3VsZCBhcHBlYXIgdGhhdCB0aGUgc3lzdGVtIGp1c3QgbG9ja2VkIHVwLgo+
IAo+IEEgc2ltcGxlIHNvbHV0aW9uIGlzIHRvIHVzZSBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVu
ZCgpIGluc3RlYWQsIHNvIHdlCj4gZG9uJ3QgaW1tZWRpYXRlbHkgc3VzcGVuZCB0aGUgU01NVSBk
ZXZpY2UuCgpSZXZpZXdlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4K
Cj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IC0t
LQo+IHYxOiBvcmlnaW5hbAo+IHYyOiB1bmNvbmRpdGlvbmFsbHkgdXNlIGF1dG9zdXNwZW5kLCBy
YXRoZXIgdGhhbiBkZWNpZGluZyBiYXNlZCBvbiB3aGF0Cj4gICAgICBjb25zdW1lciBkb2VzCj4g
Cj4gICBkcml2ZXJzL2lvbW11L2FybS1zbW11LmMgfCA1ICsrKystCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaW9tbXUvYXJtLXNtbXUuYyBiL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwo+IGluZGV4IDNm
MWQ1NWZiNDNjNC4uYjdiNDFmNTAwMWJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW9tbXUvYXJt
LXNtbXUuYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwo+IEBAIC0yODksNyArMjg5
LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYXJtX3NtbXVfcnBtX2dldChzdHJ1Y3QgYXJtX3NtbXVf
ZGV2aWNlICpzbW11KQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGFybV9zbW11X3JwbV9wdXQoc3Ry
dWN0IGFybV9zbW11X2RldmljZSAqc21tdSkKPiAgIHsKPiAgIAlpZiAocG1fcnVudGltZV9lbmFi
bGVkKHNtbXUtPmRldikpCj4gLQkJcG1fcnVudGltZV9wdXQoc21tdS0+ZGV2KTsKPiArCQlwbV9y
dW50aW1lX3B1dF9hdXRvc3VzcGVuZChzbW11LT5kZXYpOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMg
c3RydWN0IGFybV9zbW11X2RvbWFpbiAqdG9fc21tdV9kb21haW4oc3RydWN0IGlvbW11X2RvbWFp
biAqZG9tKQo+IEBAIC0xNDQ1LDYgKzE0NDUsOSBAQCBzdGF0aWMgaW50IGFybV9zbW11X2F0dGFj
aF9kZXYoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCj4g
ICAJLyogTG9va3Mgb2ssIHNvIGFkZCB0aGUgZGV2aWNlIHRvIHRoZSBkb21haW4gKi8KPiAgIAly
ZXQgPSBhcm1fc21tdV9kb21haW5fYWRkX21hc3RlcihzbW11X2RvbWFpbiwgZndzcGVjKTsKPiAg
IAo+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoc21tdS0+ZGV2LCAyMCk7Cj4g
KwlwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZChzbW11LT5kZXYpOwo+ICsKPiAgIHJwbV9wdXQ6
Cj4gICAJYXJtX3NtbXVfcnBtX3B1dChzbW11KTsKPiAgIAlyZXR1cm4gcmV0Owo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGlu
ZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

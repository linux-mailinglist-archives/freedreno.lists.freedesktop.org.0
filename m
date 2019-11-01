Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B0EC6B1
	for <lists+freedreno@lfdr.de>; Fri,  1 Nov 2019 17:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8CC6E108;
	Fri,  1 Nov 2019 16:28:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACAB6E108
 for <freedreno@lists.freedesktop.org>; Fri,  1 Nov 2019 16:28:29 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 285742080F;
 Fri,  1 Nov 2019 16:28:27 +0000 (UTC)
Date: Fri, 1 Nov 2019 16:28:24 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20191101162824.GB3603@willie-the-truck>
References: <20191031213102.17108-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031213102.17108-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572625709;
 bh=AGQ8iiY4Sv5ExrC2tV2HF7L3Htvu/REfvE6er7pPcDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LWIoDTqvjr1SCA/3GbYgq+sLE9RAhMhlWeB1gGurTUZhTOIvM7KnkzLcVdTA5gedp
 uAwRBvfPV03Q9adG3rLnJwhDhpqJDlKRj+Wct6rHI3OlwDxhXDqNkRnLPE+CSK/k4r
 Fu02H3jtWb+tXTEXJgoOjKmVtX6ZO2qWHQZt38Ko=
Subject: Re: [Freedreno] [PATCH] iommu/arm-smmu: avoid pathological RPM
 behaviour for unmaps
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
Cc: Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, open list <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMDI6MzE6MDJQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBXaGVuIGdh
bWVzLCBicm93c2VyLCBvciBhbnl0aGluZyB1c2luZyBhIGxvdCBvZiBHUFUgYnVmZmVycyBleGl0
cywgdGhlcmUKPiBjYW4gYmUgbWFueSBodW5kcmVkcyBvciB0aG91c2FuZHMgb2YgYnVmZmVycyB0
byB1bm1hcCBhbmQgZnJlZS4gIElmIHRoZQo+IEdQVSBpcyBvdGhlcndpc2Ugc3VzcGVuZGVkLCB0
aGlzIGNhbiBjYXVzZSBhcm0tc21tdSB0byByZXN1bWUvc3VzcGVuZAo+IGZvciBlYWNoIGJ1ZmZl
ciwgcmVzdWx0aW5nIDUtMTAgc2Vjb25kcyB3b3J0aCBvZiByZXByb2dyYW1taW5nIHRoZQo+IGNv
bnRleHQgYmFuayAoYXJtX3NtbXVfd3JpdGVfY29udGV4dF9iYW5rKCkvYXJtX3NtbXVfd3JpdGVf
czJjcigpL2V0YykuCj4gVG8gdGhlIHVzZXIgaXQgd291bGQgYXBwZWFyIHRoYXQgdGhlIHN5c3Rl
bSBqdXN0IGxvY2tlZCB1cC4KPiAKPiBBIHNpbXBsZSBzb2x1dGlvbiBpcyB0byB1c2UgcG1fcnVu
dGltZV9wdXRfYXV0b3N1c3BlbmQoKSBpbnN0ZWFkLCBzbyB3ZQo+IGRvbid0IGltbWVkaWF0ZWx5
IHN1c3BlbmQgdGhlIFNNTVUgZGV2aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9pb21tdS9hcm0tc21tdS5j
IHwgMTYgKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2FybS1zbW11
LmMgYi9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMKPiBpbmRleCA3YzUwM2E2YmM1ODUuLjVhYmMw
ZDIxMGQ5MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMKPiArKysgYi9k
cml2ZXJzL2lvbW11L2FybS1zbW11LmMKPiBAQCAtMTIyLDcgKzEyMiw3IEBAIHN0YXRpYyBpbmxp
bmUgaW50IGFybV9zbW11X3JwbV9nZXQoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSkKPiAg
c3RhdGljIGlubGluZSB2b2lkIGFybV9zbW11X3JwbV9wdXQoc3RydWN0IGFybV9zbW11X2Rldmlj
ZSAqc21tdSkKPiAgewo+ICAJaWYgKHBtX3J1bnRpbWVfZW5hYmxlZChzbW11LT5kZXYpKQo+IC0J
CXBtX3J1bnRpbWVfcHV0KHNtbXUtPmRldik7Cj4gKwkJcG1fcnVudGltZV9wdXRfYXV0b3N1c3Bl
bmQoc21tdS0+ZGV2KTsKPiAgfQo+ICAKPiAgc3RhdGljIHN0cnVjdCBhcm1fc21tdV9kb21haW4g
KnRvX3NtbXVfZG9tYWluKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbSkKPiBAQCAtMTE1NCw2ICsx
MTU0LDIwIEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfYXR0YWNoX2RldihzdHJ1Y3QgaW9tbXVfZG9t
YWluICpkb21haW4sIHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCS8qIExvb2tzIG9rLCBzbyBhZGQg
dGhlIGRldmljZSB0byB0aGUgZG9tYWluICovCj4gIAlyZXQgPSBhcm1fc21tdV9kb21haW5fYWRk
X21hc3RlcihzbW11X2RvbWFpbiwgZndzcGVjKTsKPiAgCj4gKwkvKgo+ICsJICogU2V0dXAgYW4g
YXV0b3N1c3BlbmQgZGVsYXkgdG8gYXZvaWQgYm91bmNpbmcgcnVucG0gc3RhdGUuCj4gKwkgKiBP
dGhlcndpc2UsIGlmIGEgZHJpdmVyIGZvciBhIHN1c3BlbmRlbmQgY29uc3VtZXIgZGV2aWNlCgpJ
IGZpeGVkIHRoaXMgdHlwbyBhbmQgYXBwbGllZCB3aXRoIFJvYmluJ3MgcmV2aWV3ZWQtYnkgZnJv
bSBiZWZvcmUuCgpXaWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVk
cmVubw==

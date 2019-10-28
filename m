Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F117FE7C3F
	for <lists+freedreno@lfdr.de>; Mon, 28 Oct 2019 23:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745426E042;
	Mon, 28 Oct 2019 22:20:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F025F6E042
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2019 22:20:47 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F6A821479;
 Mon, 28 Oct 2019 22:20:45 +0000 (UTC)
Date: Mon, 28 Oct 2019 22:20:42 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20191028222042.GB8532@willie-the-truck>
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
 <20191007204906.19571-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007204906.19571-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572301247;
 bh=VSBk7YAMwCwbsPuvRCBw6UeuvHY7STvzXKIvzV2nyuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0gosvq7R5GnXKiYYLDbPH29ONaAKpYHE02ZEPnzDUcqvXqhp72Teg/Ds/g3vOOu+v
 FG4avd2WmHPRGFFlHNloeY/x+Kqn7qS/tlQLnwyI/SyJIWS26MT+8t3UyWWDNnzYML
 dc4R4LPqV+P2GObHwW+vgu32hGQhqxFZzIWcYSL4=
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
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDE6NDk6MDZQTSAtMDcwMCwgUm9iIENs
YXJrIHdyb3RlOgo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAK
PiBXaGVuIGdhbWVzLCBicm93c2VyLCBvciBhbnl0aGluZyB1c2luZyBhIGxvdCBvZiBHUFUgYnVm
ZmVycyBleGl0cywgdGhlcmUKPiBjYW4gYmUgbWFueSBodW5kcmVkcyBvciB0aG91c2FuZHMgb2Yg
YnVmZmVycyB0byB1bm1hcCBhbmQgZnJlZS4gIElmIHRoZQo+IEdQVSBpcyBvdGhlcndpc2Ugc3Vz
cGVuZGVkLCB0aGlzIGNhbiBjYXVzZSBhcm0tc21tdSB0byByZXN1bWUvc3VzcGVuZAo+IGZvciBl
YWNoIGJ1ZmZlciwgcmVzdWx0aW5nIDUtMTAgc2Vjb25kcyB3b3J0aCBvZiByZXByb2dyYW1taW5n
IHRoZQo+IGNvbnRleHQgYmFuayAoYXJtX3NtbXVfd3JpdGVfY29udGV4dF9iYW5rKCkvYXJtX3Nt
bXVfd3JpdGVfczJjcigpL2V0YykuCj4gVG8gdGhlIHVzZXIgaXQgd291bGQgYXBwZWFyIHRoYXQg
dGhlIHN5c3RlbSBqdXN0IGxvY2tlZCB1cC4KPiAKPiBBIHNpbXBsZSBzb2x1dGlvbiBpcyB0byB1
c2UgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBpbnN0ZWFkLCBzbyB3ZQo+IGRvbid0IGlt
bWVkaWF0ZWx5IHN1c3BlbmQgdGhlIFNNTVUgZGV2aWNlLgoKUGxlYXNlIGNhbiB5b3UgcmV3b3Jk
IHRoZSBzdWJqZWN0IHRvIGJlIGEgYml0IG1vcmUgdXNlZnVsPyBUaGUgY29tbWl0Cm1lc3NhZ2Ug
aXMgZ3JlYXQsIGJ1dCB0aGUgc3ViamVjdCBpcyBhIGJpdCBsaWtlICJmaXggYnVnIGluIGNvZGUi
IHRvIG1lLgoKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5v
cmc+Cj4gLS0tCj4gdjE6IG9yaWdpbmFsCj4gdjI6IHVuY29uZGl0aW9uYWxseSB1c2UgYXV0b3N1
c3BlbmQsIHJhdGhlciB0aGFuIGRlY2lkaW5nIGJhc2VkIG9uIHdoYXQKPiAgICAgY29uc3VtZXIg
ZG9lcwo+IAo+ICBkcml2ZXJzL2lvbW11L2FybS1zbW11LmMgfCA1ICsrKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pb21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCj4gaW5k
ZXggM2YxZDU1ZmI0M2M0Li5iN2I0MWY1MDAxYmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21t
dS9hcm0tc21tdS5jCj4gKysrIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCj4gQEAgLTI4OSw3
ICsyODksNyBAQCBzdGF0aWMgaW5saW5lIGludCBhcm1fc21tdV9ycG1fZ2V0KHN0cnVjdCBhcm1f
c21tdV9kZXZpY2UgKnNtbXUpCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBhcm1fc21tdV9ycG1fcHV0
KHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpCj4gIHsKPiAgCWlmIChwbV9ydW50aW1lX2Vu
YWJsZWQoc21tdS0+ZGV2KSkKPiAtCQlwbV9ydW50aW1lX3B1dChzbW11LT5kZXYpOwo+ICsJCXBt
X3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKHNtbXUtPmRldik7Cj4gIH0KPiAgCj4gIHN0YXRpYyBz
dHJ1Y3QgYXJtX3NtbXVfZG9tYWluICp0b19zbW11X2RvbWFpbihzdHJ1Y3QgaW9tbXVfZG9tYWlu
ICpkb20pCj4gQEAgLTE0NDUsNiArMTQ0NSw5IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfYXR0YWNo
X2RldihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sIHN0cnVjdCBkZXZpY2UgKmRldikKPiAg
CS8qIExvb2tzIG9rLCBzbyBhZGQgdGhlIGRldmljZSB0byB0aGUgZG9tYWluICovCj4gIAlyZXQg
PSBhcm1fc21tdV9kb21haW5fYWRkX21hc3RlcihzbW11X2RvbWFpbiwgZndzcGVjKTsKClBsZWFz
ZSBjYW4geW91IHB1dCBhIGNvbW1lbnQgaGVyZSBleHBsYWluaW5nIHdoYXQgdGhpcyBpcyBkb2lu
Zz8gQW4gYWJyaWRnZWQKdmVyc2lvbiBvZiB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgZmluZS4KCj4g
KwlwbV9ydW50aW1lX3NldF9hdXRvc3VzcGVuZF9kZWxheShzbW11LT5kZXYsIDIwKTsKPiArCXBt
X3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKHNtbXUtPmRldik7CgpDaGVlcnMsCgpXaWxsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

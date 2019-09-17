Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553BBB55B7
	for <lists+freedreno@lfdr.de>; Tue, 17 Sep 2019 20:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB076E2F0;
	Tue, 17 Sep 2019 18:55:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94AE6E2F0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Sep 2019 18:55:42 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29EB5214AF;
 Tue, 17 Sep 2019 18:55:42 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <1566327992-362-4-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
 <1566327992-362-4-git-send-email-jcrouse@codeaurora.org>
To: Jordan Crouse <jcrouse@codeaurora.org>, freedreno@lists.freedesktop.org
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Tue, 17 Sep 2019 11:55:41 -0700
Message-Id: <20190917185542.29EB5214AF@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568746542;
 bh=GES6jY4SrgchwiFDLmCd0LxgVWZjnEk+gbEGOc928XQ=;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
 b=k9LwQx38N2BdNc66+3x/viHSY2juEQIkGNDwqC7RC5qWXwJi29ZVStsSdAb4mMl/s
 QwXwITGlVNF3gB3KQrxck1nkk79fvRSbAffQgGL0DxcRj6yvF6E3eUh8Ik6KDGZqrp
 keQixx7YXQIb8U8MUxG+ZkXC3m274H2HeGOHSe6E=
Subject: Re: [Freedreno] [PATCH 3/7] iommu/arm-smmu: Add a SMMU variant for
 the Adreno GPU
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
Cc: linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

UXVvdGluZyBKb3JkYW4gQ3JvdXNlICgyMDE5LTA4LTIwIDEyOjA2OjI4KQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMgYi9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMKPiBp
bmRleCAzOWU4MWVmLi4zZjQxY2Y3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW9tbXUvYXJtLXNt
bXUuYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwo+IEBAIC0xODU4LDYgKzE4NTgs
NyBAQCBBUk1fU01NVV9NQVRDSF9EQVRBKGFybV9tbXU0MDEsIEFSTV9TTU1VX1YxXzY0SywgR0VO
RVJJQ19TTU1VKTsKPiAgQVJNX1NNTVVfTUFUQ0hfREFUQShhcm1fbW11NTAwLCBBUk1fU01NVV9W
MiwgQVJNX01NVTUwMCk7Cj4gIEFSTV9TTU1VX01BVENIX0RBVEEoY2F2aXVtX3NtbXV2MiwgQVJN
X1NNTVVfVjIsIENBVklVTV9TTU1VVjIpOwo+ICBBUk1fU01NVV9NQVRDSF9EQVRBKHFjb21fc21t
dXYyLCBBUk1fU01NVV9WMiwgUUNPTV9TTU1VVjIpOwo+ICtBUk1fU01NVV9NQVRDSF9EQVRBKHFj
b21fYWRyZW5vX3NtbXV2MiwgQVJNX1NNTVVfVjIsIFFDT01fQURSRU5PX1NNTVVWMik7Cj4gIAo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBhcm1fc21tdV9vZl9tYXRjaFtdID0g
ewo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJhcm0sc21tdS12MSIsIC5kYXRhID0gJnNtbXVf
Z2VuZXJpY192MSB9LAo+IEBAIC0xODY3LDYgKzE4NjgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBhcm1fc21tdV9vZl9tYXRjaFtdID0gewo+ICAgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJhcm0sbW11LTUwMCIsIC5kYXRhID0gJmFybV9tbXU1MDAgfSwKPiAgICAgICAgIHsg
LmNvbXBhdGlibGUgPSAiY2F2aXVtLHNtbXUtdjIiLCAuZGF0YSA9ICZjYXZpdW1fc21tdXYyIH0s
Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInFjb20sc21tdS12MiIsIC5kYXRhID0gJnFjb21f
c21tdXYyIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInFjb20sYWRyZW5vLXNtbXUtdjIi
LCAuZGF0YSA9ICZxY29tX2FkcmVub19zbW11djIgfSwKCkNhbiB0aGlzIGJlIHNvcnRlZCBvbiBj
b21wYXQ/Cgo+ICAgICAgICAgeyB9LAo+ICB9Owo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
b21tdS9hcm0tc21tdS5oIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5oCj4gaW5kZXggOTFhNGVi
OC4uZTVhMmNjOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L2FybS1zbW11LmgKPiArKysg
Yi9kcml2ZXJzL2lvbW11L2FybS1zbW11LmgKPiBAQCAtMjIyLDYgKzIyMiw3IEBAIGVudW0gYXJt
X3NtbXVfaW1wbGVtZW50YXRpb24gewo+ICAgICAgICAgQVJNX01NVTUwMCwKPiAgICAgICAgIENB
VklVTV9TTU1VVjIsCj4gICAgICAgICBRQ09NX1NNTVVWMiwKPiArICAgICAgIFFDT01fQURSRU5P
X1NNTVVWMiwKCkNhbiB0aGlzIGJlIHNvcnRlZCBhbHBoYWJldGljYWxseT8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A142290AD2
	for <lists+freedreno@lfdr.de>; Sat, 17 Aug 2019 00:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627B46E9B6;
	Fri, 16 Aug 2019 22:20:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD406E9B6
 for <freedreno@lists.freedesktop.org>; Fri, 16 Aug 2019 22:20:17 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id DE06B61C57; Fri, 16 Aug 2019 22:20:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E74E61C57;
 Fri, 16 Aug 2019 22:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1E74E61C57
Date: Fri, 16 Aug 2019 16:20:01 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20190816222000.GF28465@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
 <20190815153304.GD28465@jcrouse1-lnx.qualcomm.com>
 <ac248f33-2528-c1d4-17ed-17e92e6ed5ad@arm.com>
 <CAF6AEGujjF+MQFw45g799i+2QE4X=eRZdDSsD_F3y3mfbc6UPw@mail.gmail.com>
 <3ea2755f-6d4d-736d-bebd-455a7967e381@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ea2755f-6d4d-736d-bebd-455a7967e381@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565994016;
 bh=n8EyLk80l4W+PQGIi1Q/9kn0a7jx+4AwnWTuTaAVMK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OqOHD6IawiYgFfBwa6LMZD1Y0zy7RvcaIE13nvtMkx/UNLt0Az9aH3MNzq1Ffvozm
 YhbXGpxwgn55YRtKgteXAfkGISTyACODYplL0Objkcvp7WFz4Xq0+CCdObx9sBNKId
 kJTCzlhORJeOxe2dRr9yuCjq+HEKB/5DXWLMf9yE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565994015;
 bh=n8EyLk80l4W+PQGIi1Q/9kn0a7jx+4AwnWTuTaAVMK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQyICEvuEqN+v08C3V39NgQwlicZp33j+tvVaED8dFJW1jYBvHL9IdSAJdzjAFKUD
 guqAP5T2rlcrk6uDtYpnrlNtY3watC+Aglbz61l/qEiHa4dI3w2lAEaYAu/w3vhgDf
 ikp5fuUuQheXDde4YgaGgpAWKrzmMw77H5zP3pkI=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: Re: [Freedreno] [PATCH v3 0/2] iommu/arm-smmu: Split pagetable
 support
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
Cc: Rob Herring <robh@kernel.org>,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDg6NDM6NTNQTSArMDEwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+IE9uIDE2LzA4LzIwMTkgMTk6MTIsIFJvYiBDbGFyayB3cm90ZToKPiA+T24gRnJpLCBB
dWcgMTYsIDIwMTkgYXQgOTo1OCBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29t
PiB3cm90ZToKPiA+Pgo+ID4+SGkgSm9yZGFuLAo+ID4+Cj4gPj5PbiAxNS8wOC8yMDE5IDE2OjMz
LCBKb3JkYW4gQ3JvdXNlIHdyb3RlOgo+ID4+Pk9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA0OjIx
OjM4UE0gLTA2MDAsIEpvcmRhbiBDcm91c2Ugd3JvdGU6Cj4gPj4+PihTaWdoLCByZXNlbmQuIEkg
ZnJlYWtlZCBvdXQgbXkgU01UUCBzZXJ2ZXIpCj4gPj4+Pgo+ID4+Pj5UaGlzIGlzIHBhcnQgb2Yg
YW4gb25nb2luZyBldm9sdXRpb24gZm9yIGVuYWJsaW5nIHNwbGl0IHBhZ2V0YWJsZSBzdXBwb3J0
IGZvcgo+ID4+Pj5hcm0tc21tdS4gUHJldmlvdXMgdmVyc2lvbnMgY2FuIGJlIGZvdW5kIFsxXS4K
PiA+Pj4+Cj4gPj4+PkluIHRoZSBkaXNjdXNzaW9uIGZvciB2MiBSb2JpbiBwb2ludGVkIG91dCB0
aGF0IHRoaXMgaXMgYSB2ZXJ5IEFkcmVubyBzcGVjaWZpYwo+ID4+Pj51c2UgY2FzZSBhbmQgdGhh
dCBpcyBleGFjdGx5IHRydWUuIE5vdCBvbmx5IGRvIHdlIHdhbnQgdG8gY29uZmlndXJlIGFuZCB1
c2UgYQo+ID4+Pj5wYWdldGFibGUgaW4gdGhlIFRUQlIxIHNwYWNlLCB3ZSBhbHNvIHdhbnQgdG8g
Y29uZmlndXJlIHRoZSBUVEJSMCByZWdpb24gYnV0Cj4gPj4+Pm5vdCBhbGxvY2F0ZSBhIHBhZ2V0
YWJsZSBmb3IgaXQgb3IgdG91Y2ggaXQgdW50aWwgdGhlIEdQVSBoYXJkd2FyZSBkb2VzIHNvLiBB
cwo+ID4+Pj5tdWNoIGFzIEkgd2FudCBpdCB0byBiZSBhIGdlbmVyaWMgY29uY2VwdCBpdCByZWFs
bHkgaXNuJ3QuCj4gPj4+Pgo+ID4+Pj5UaGlzIHJldmlzaW9uIGxlYW5zIGludG8gdGhhdCBpZGVh
LiBNb3N0IG9mIHRoZSBzYW1lIGlvLXBndGFibGUgY29kZSBpcyB0aGVyZQo+ID4+Pj5idXQgbm93
IGl0IGlzIHdyYXBwZWQgYXMgYW4gQWRyZW5vIEdQVSBzcGVjaWZpYyBmb3JtYXQgdGhhdCBpcyBz
ZWxlY3RlZCBieSB0aGUKPiA+Pj4+Y29tcGF0aWJsZSBzdHJpbmcgaW4gdGhlIGFybS1zbW11IGRl
dmljZS4KPiA+Pj4+Cj4gPj4+PkFkZGl0aW9uYWxseSwgcGVyIFJvYmluJ3Mgc3VnZ2VzdGlvbiB3
ZSBhcmUgc2tpcHBpbmcgY3JlYXRpbmcgYSBUVEJSMCBwYWdldGFibGUKPiA+Pj4+dG8gc2F2ZSBv
biB3YXN0ZWQgbWVtb3J5Lgo+ID4+Pj4KPiA+Pj4+VGhpcyBpc24ndCBhcyBjbGVhbiBhcyBJIHdv
dWxkIGxpa2UgaXQgdG8gYmUgYnV0IEkgdGhpbmsgdGhhdCB0aGlzIGlzIGEgYmV0dGVyCj4gPj4+
PmRpcmVjdGlvbiB0aGFuIHRyeWluZyB0byBwcmV0ZW5kIHRoYXQgdGhlIGdlbmVyaWMgZm9ybWF0
IHdvdWxkIHdvcmsuCj4gPj4+Pgo+ID4+Pj5JJ20gdGVtcHRpbmcgZmF0ZSBieSBwb3N0aW5nIHRo
aXMgYW5kIHRoZW4gdGFraW5nIHNvbWUgdGltZSBvZmYsIGJ1dCBJIHdhbnRlZAo+ID4+Pj50byB0
cnkgdG8ga2ljayBvZmYgYSBjb252ZXJzYXRpb24gb3IgYXQgbGVhc3QgZ2V0IHNvbWUgZmxhbWVz
IHNvIEkgY2FuIHRyeSB0bwo+ID4+Pj5yZWZpbmUgdGhpcyBhZ2FpbiBuZXh0IHdlZWsuIFBsZWFz
ZSB0YWtlIGEgbG9vayBhbmQgZ2l2ZSBzb21lIGFkdmljZSBvbiB0aGUKPiA+Pj4+ZGlyZWN0aW9u
Lgo+ID4+Pgo+ID4+PldpbGwsIFJvYmluIC0KPiA+Pj4KPiA+Pj5Nb2R1bG8gdGhlIGltcGwgY2hh
bmdlcyBmcm9tIFJvYmluLCBkbyB5b3UgdGhpbmsgdGhhdCB1c2luZyBhIGRlZGljYXRlZAo+ID4+
PnBhZ2V0YWJsZSBmb3JtYXQgaXMgdGhlIHJpZ2h0IGFwcHJvYWNoIGZvciBzdXBwb3J0aW5nIHNw
bGl0IHBhZ2V0YWJsZXMgZm9yIHRoZQo+ID4+PkFkcmVubyBHUFU/Cj4gPj4KPiA+PkhvdyBtYW55
IGRpZmZlcmVudCBBZHJlbm8gZHJpdmVycyB3b3VsZCBiZW5lZml0IGZyb20gc2hhcmluZyBpdD8K
PiA+Cj4gPkh5cG90aGV0aWNhbGx5IGV2ZXJ5dGhpbmcgYmFjayB0byBhM3h4LCBzbyBJICpjb3Vs
ZCogc2VlIHVzZWZ1bG5lc3Mgb2YKPiA+dGhpcyBpbiBxY29tX2lvbW11IChvciBtYXliZSBldmVu
IG1zbS1pb21tdSkuICBPVE9IIG1heWJlIHdpdGgKPiA+Im1vZHVsYXJpemluZyIgYXJtLXNtbXUg
d2UgY291bGQgcmUtY29tYmluZSBxY29tX2lvbW11IGFuZCBhcm0tc21tdS4KPiAKPiBJbmRlZWQs
IHRoYXQncyBjZXJ0YWlubHkgc29tZXRoaW5nIEknbSBwbGFubmluZyB0byBpbnZlc3RpZ2F0ZSBh
cyBhIGZ1dHVyZQo+IHJlZmFjdG9yaW5nIHN0ZXAuCj4gCj4gPkFuZCBhcyBhIHByYWN0aWNhbCBt
YXR0ZXIsIEknbSBub3Qgc3VyZSBpZiBhbnlvbmUgd2lsbCBnZXQgYXJvdW5kIHRvCj4gPmJhY2tw
b3J0aW5nIHBlci1jb250ZXh0IHBhZ2V0YWJsZXMgYXMgZmFyIGJhY2sgYXMgYTN4eC4KPiA+Cj4g
PkJSLAo+ID4tUgo+ID4KPiA+PlRoZSBtb3JlIEkgY29tZSBiYWNrIHRvIHRoaXMsIHRoZSBtb3Jl
IEknbSBjb252aW5jZWQgdGhhdCBpby1wZ3RhYmxlCj4gPj5zaG91bGQgZm9jdXMgb24gdGhlIGhl
YXZ5IGxpZnRpbmcgb2YgcGFnZXRhYmxlIG1hbmFnZW1lbnQgLSB0aGUgY29kZQo+ID4+dGhhdCBu
b2JvZHkgd2FudHMgdG8gaGF2ZSB0byB3cml0ZSBhdCBhbGwsIGxldCBhbG9uZSBtb3JlIHRoYW4g
b25jZSAtCj4gPj5hbmQgYW55IHN1YnRsZXRpZXMgd2hpY2ggYXJlbid0IGVzc2VudGlhbCB0byB0
aGF0IHNob3VsZCBiZSBwdXNoZWQgYmFjawo+ID4+aW50byB3aGljaGV2ZXIgY2FsbGVycyBhY3R1
YWxseSBjYXJlLiBDb25zaWRlciB0aGF0IGFscmVhZHksIGxpdGVyYWxseQo+ID4+bm8gY2FsbGVy
IGFjdHVhbGx5IHVzZXMgYW4gdW5tb2RpZmllZCBzdGFnZSAxIFRDUiB2YWx1ZSBhcyBwcm92aWRl
ZCBpbgo+ID4+dGhlIGlvX3BndGFibGVfY2ZnLgo+ID4+Cj4gPj5JIGZlZWwgaXQgd291bGQgYmUg
bW9zdCBwcm9kdWN0aXZlIHRvIGVsYWJvcmF0ZSBmdXJ0aGVyIGluIHRoZSBmb3JtIG9mCj4gPj5w
YXRjaGVzLCBzbyBsZXQgbWUgZ2V0IHJpZ2h0IG9uIHRoYXQgYW5kIHRyeSB0byBiYXNoIHNvbWV0
aGluZyBvdXQKPiA+PmJlZm9yZSBJIGdvIGhvbWUgdG9uaWdodC4uLgo+IAo+IC4uLmFuZCBub3cg
dGhlcmUncyBhIHJvdWdoIFdJUCBicmFuY2ggaGVyZToKPiAKPiBodHRwOi8vbGludXgtYXJtLm9y
Zy9naXQ/cD1saW51eC1ybS5naXQ7YT1zaG9ydGxvZztoPXJlZnMvaGVhZHMvaW9tbXUvcGd0YWJs
ZQo+IAo+IEknbGwgZmluaXNoIHRlc3RpbmcgYW5kIHBvbGlzaGluZyB0aG9zZSBwYXRjaGVzIGF0
IHNvbWUgcG9pbnQgbmV4dCB3ZWVrLAo+IHByb2JhYmx5LCBidXQgaG9wZWZ1bGx5IHRoZXkncmUg
c3VmZmljaWVudGx5IGlsbHVzdHJhdGl2ZSBmb3IgdGhlIG1vbWVudC4KClRoaXMgbG9va3MgZ3Jl
YXQgc28gZmFyLiBJIGNhbiBzZWUgd2hlcmUgdGhlIFRUQlIxIHN0dWZmIHdvdWxkIGZpdCBpbiBh
bmQgSSBsaWtlCml0IGEgbG90LiBJJ2xsIHRyeSB0byBoYXZlIHNvbWUgcGF0Y2hlcyByZWFkeSB3
aGVuIHlvdSBhcmUgZG9uZSBwb2xpc2hpbmcuCgpKb3JkYW4KCj4gUm9iaW4uCgotLSAKVGhlIFF1
YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3Jh
IEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5n
IGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

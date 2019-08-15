Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DCF8EF5F
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 17:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AF86E9EB;
	Thu, 15 Aug 2019 15:33:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1C6E9EB
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 15:33:07 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id C6B506044E; Thu, 15 Aug 2019 15:33:07 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 09845602DB;
 Thu, 15 Aug 2019 15:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09845602DB
Date: Thu, 15 Aug 2019 09:33:04 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Message-ID: <20190815153304.GD28465@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: freedreno@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
 jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 Zhen Lei <thunder.leizhen@huawei.com>, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
References: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565883187;
 bh=uo5H+y/d8CeAGVlGgEqg/owuTjfwykTO28LcSJ+xr/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JWIflaVW/rZSI/hUOugJSCSUO8I4S63HY3j17Tc7s3XxV9diSrv9R3sVX+iJ+q4c0
 UbUTibEJS01goUX2qKNI7HUjTFac97bC2jTjO3ZqSShs+1wq8EZ+CVNOKsC+WmVCzD
 VB+7sMNRxEbktuQQ4wiqjFCqVmhteIGBWYN3krzQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565883186;
 bh=uo5H+y/d8CeAGVlGgEqg/owuTjfwykTO28LcSJ+xr/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RzWtWebSM6sga9d+OFbdNomQXt2erULsaPlh8pnTHBZtZyGoEFu/YQWnwWPs72tQk
 qOKjG9KEdXR6TLhBuDZEmtumeRgnsWuqmbxssYDp3D8XHF0kWV1JwF/qKTDVRqvmsX
 pE5VXpZ0oG+3PfHMM6LMzK8I5mAQKLk7o64a0K2M=
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
Cc: Rob Herring <robh@kernel.org>, jean-philippe.brucker@arm.com,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Zhen Lei <thunder.leizhen@huawei.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDQ6MjE6MzhQTSAtMDYwMCwgSm9yZGFuIENyb3VzZSB3
cm90ZToKPiAoU2lnaCwgcmVzZW5kLiBJIGZyZWFrZWQgb3V0IG15IFNNVFAgc2VydmVyKQo+IAo+
IFRoaXMgaXMgcGFydCBvZiBhbiBvbmdvaW5nIGV2b2x1dGlvbiBmb3IgZW5hYmxpbmcgc3BsaXQg
cGFnZXRhYmxlIHN1cHBvcnQgZm9yCj4gYXJtLXNtbXUuIFByZXZpb3VzIHZlcnNpb25zIGNhbiBi
ZSBmb3VuZCBbMV0uCj4gCj4gSW4gdGhlIGRpc2N1c3Npb24gZm9yIHYyIFJvYmluIHBvaW50ZWQg
b3V0IHRoYXQgdGhpcyBpcyBhIHZlcnkgQWRyZW5vIHNwZWNpZmljCj4gdXNlIGNhc2UgYW5kIHRo
YXQgaXMgZXhhY3RseSB0cnVlLiBOb3Qgb25seSBkbyB3ZSB3YW50IHRvIGNvbmZpZ3VyZSBhbmQg
dXNlIGEKPiBwYWdldGFibGUgaW4gdGhlIFRUQlIxIHNwYWNlLCB3ZSBhbHNvIHdhbnQgdG8gY29u
ZmlndXJlIHRoZSBUVEJSMCByZWdpb24gYnV0Cj4gbm90IGFsbG9jYXRlIGEgcGFnZXRhYmxlIGZv
ciBpdCBvciB0b3VjaCBpdCB1bnRpbCB0aGUgR1BVIGhhcmR3YXJlIGRvZXMgc28uIEFzCj4gbXVj
aCBhcyBJIHdhbnQgaXQgdG8gYmUgYSBnZW5lcmljIGNvbmNlcHQgaXQgcmVhbGx5IGlzbid0Lgo+
IAo+IFRoaXMgcmV2aXNpb24gbGVhbnMgaW50byB0aGF0IGlkZWEuIE1vc3Qgb2YgdGhlIHNhbWUg
aW8tcGd0YWJsZSBjb2RlIGlzIHRoZXJlCj4gYnV0IG5vdyBpdCBpcyB3cmFwcGVkIGFzIGFuIEFk
cmVubyBHUFUgc3BlY2lmaWMgZm9ybWF0IHRoYXQgaXMgc2VsZWN0ZWQgYnkgdGhlCj4gY29tcGF0
aWJsZSBzdHJpbmcgaW4gdGhlIGFybS1zbW11IGRldmljZS4KPiAKPiBBZGRpdGlvbmFsbHksIHBl
ciBSb2JpbidzIHN1Z2dlc3Rpb24gd2UgYXJlIHNraXBwaW5nIGNyZWF0aW5nIGEgVFRCUjAgcGFn
ZXRhYmxlCj4gdG8gc2F2ZSBvbiB3YXN0ZWQgbWVtb3J5Lgo+IAo+IFRoaXMgaXNuJ3QgYXMgY2xl
YW4gYXMgSSB3b3VsZCBsaWtlIGl0IHRvIGJlIGJ1dCBJIHRoaW5rIHRoYXQgdGhpcyBpcyBhIGJl
dHRlcgo+IGRpcmVjdGlvbiB0aGFuIHRyeWluZyB0byBwcmV0ZW5kIHRoYXQgdGhlIGdlbmVyaWMg
Zm9ybWF0IHdvdWxkIHdvcmsuCj4gCj4gSSdtIHRlbXB0aW5nIGZhdGUgYnkgcG9zdGluZyB0aGlz
IGFuZCB0aGVuIHRha2luZyBzb21lIHRpbWUgb2ZmLCBidXQgSSB3YW50ZWQKPiB0byB0cnkgdG8g
a2ljayBvZmYgYSBjb252ZXJzYXRpb24gb3IgYXQgbGVhc3QgZ2V0IHNvbWUgZmxhbWVzIHNvIEkg
Y2FuIHRyeSB0bwo+IHJlZmluZSB0aGlzIGFnYWluIG5leHQgd2Vlay4gUGxlYXNlIHRha2UgYSBs
b29rIGFuZCBnaXZlIHNvbWUgYWR2aWNlIG9uIHRoZQo+IGRpcmVjdGlvbi4KCldpbGwsIFJvYmlu
IC0KCk1vZHVsbyB0aGUgaW1wbCBjaGFuZ2VzIGZyb20gUm9iaW4sIGRvIHlvdSB0aGluayB0aGF0
IHVzaW5nIGEgZGVkaWNhdGVkCnBhZ2V0YWJsZSBmb3JtYXQgaXMgdGhlIHJpZ2h0IGFwcHJvYWNo
IGZvciBzdXBwb3J0aW5nIHNwbGl0IHBhZ2V0YWJsZXMgZm9yIHRoZQpBZHJlbm8gR1BVPwoKSWYg
c28sIHRoZW4gaXMgYWRkaW5nIHRoZSBjaGFuZ2VzIHRvIGlvLXBndGFibGUtYXJtLmMgcG9zc2li
bGUgZm9yIDUuNCBhbmQgdGhlbgphZGQgdGhlIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGNvZGUg
b24gdG9wIG9mIFJvYmluJ3Mgc3RhY2sgbGF0ZXIgb3IgZG8geW91CmZlZWwgdGhleSBzaG91bGQg
Y29tZSBhcyBwYXJ0IG9mIGEgcGFja2FnZSBkZWFsPwoKSm9yZGFuCgo+IEpvcmRhbiBDcm91c2Ug
KDIpOgo+ICAgaW9tbXUvaW8tcGd0YWJsZS1hcm06IEFkZCBzdXBwb3J0IGZvciBBUk1fQURSRU5P
X0dQVV9MUEFFIGlvLXBndGFibGUKPiAgICAgZm9ybWF0Cj4gICBpb21tdS9hcm0tc21tdTogQWRk
IHN1cHBvcnQgZm9yIEFkcmVubyBHUFUgcGFnZXRhYmxlIGZvcm1hdHMKPiAKPiAgZHJpdmVycy9p
b21tdS9hcm0tc21tdS5jICAgICAgIHwgICA4ICstCj4gIGRyaXZlcnMvaW9tbXUvaW8tcGd0YWJs
ZS1hcm0uYyB8IDIxNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+
ICBkcml2ZXJzL2lvbW11L2lvLXBndGFibGUuYyAgICAgfCAgIDEgKwo+ICBpbmNsdWRlL2xpbnV4
L2lvLXBndGFibGUuaCAgICAgfCAgIDIgKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDIwOSBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjcuNAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJlZWRyZW5vIG1haWxpbmcg
bGlzdAo+IEZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwoKLS0gClRoZSBRdWFsY29t
bSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1
bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0
CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6BE8667
	for <lists+freedreno@lfdr.de>; Tue, 29 Oct 2019 12:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B196E1CF;
	Tue, 29 Oct 2019 11:16:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85746E1CF
 for <freedreno@lists.freedesktop.org>; Tue, 29 Oct 2019 11:16:00 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12913208E3;
 Tue, 29 Oct 2019 11:15:58 +0000 (UTC)
Date: Tue, 29 Oct 2019 11:15:56 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20191029111555.GF11590@willie-the-truck>
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
 <20191007204906.19571-1-robdclark@gmail.com>
 <20191028222042.GB8532@willie-the-truck>
 <CAJs_Fx7zRWsTPiAg0PFt+8nJPpHpzSkxW6XMMJwozVO6vyB78A@mail.gmail.com>
 <e3fc88d9-4934-0227-d9c7-b1cb37a8811e@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3fc88d9-4934-0227-d9c7-b1cb37a8811e@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572347760;
 bh=PYpYmLCcRCDnvoNd2S0sMHcaEM2JronWu9CsKftbO3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GdaMUmmgMjWuXCjwK0dWZlcoWZbdkss1hf/IPKcAItun5DvAeYWYvYEXepIKuV8F4
 Cgj6BmO5LCR5kVQSqH6TeJrA5sMtyubLtUhcJCViQ3HQZ9x8ffrdD48QttQIxJTdvs
 cKuoCU3Lo8JRJ8savTdPFUcs8+VjcCEB/d/GTobo=
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
Cc: Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, open list <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTA6NTE6NTNQTSArMDAwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+IE9uIDIwMTktMTAtMjggMTA6MzggcG0sIFJvYiBDbGFyayB3cm90ZToKPiA+IE9uIE1v
biwgT2N0IDI4LCAyMDE5IGF0IDM6MjAgUE0gV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+IE9uIE1vbiwgT2N0IDA3LCAyMDE5IGF0IDAxOjQ5OjA2UE0gLTA3MDAsIFJv
YiBDbGFyayB3cm90ZToKPiA+ID4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1
bS5vcmc+Cj4gPiA+ID4gCj4gPiA+ID4gV2hlbiBnYW1lcywgYnJvd3Nlciwgb3IgYW55dGhpbmcg
dXNpbmcgYSBsb3Qgb2YgR1BVIGJ1ZmZlcnMgZXhpdHMsIHRoZXJlCj4gPiA+ID4gY2FuIGJlIG1h
bnkgaHVuZHJlZHMgb3IgdGhvdXNhbmRzIG9mIGJ1ZmZlcnMgdG8gdW5tYXAgYW5kIGZyZWUuICBJ
ZiB0aGUKPiA+ID4gPiBHUFUgaXMgb3RoZXJ3aXNlIHN1c3BlbmRlZCwgdGhpcyBjYW4gY2F1c2Ug
YXJtLXNtbXUgdG8gcmVzdW1lL3N1c3BlbmQKPiA+ID4gPiBmb3IgZWFjaCBidWZmZXIsIHJlc3Vs
dGluZyA1LTEwIHNlY29uZHMgd29ydGggb2YgcmVwcm9ncmFtbWluZyB0aGUKPiA+ID4gPiBjb250
ZXh0IGJhbmsgKGFybV9zbW11X3dyaXRlX2NvbnRleHRfYmFuaygpL2FybV9zbW11X3dyaXRlX3My
Y3IoKS9ldGMpLgo+ID4gPiA+IFRvIHRoZSB1c2VyIGl0IHdvdWxkIGFwcGVhciB0aGF0IHRoZSBz
eXN0ZW0ganVzdCBsb2NrZWQgdXAuCj4gPiA+ID4gCj4gPiA+ID4gQSBzaW1wbGUgc29sdXRpb24g
aXMgdG8gdXNlIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgaW5zdGVhZCwgc28gd2UKPiA+
ID4gPiBkb24ndCBpbW1lZGlhdGVseSBzdXNwZW5kIHRoZSBTTU1VIGRldmljZS4KPiA+ID4gCj4g
PiA+IFBsZWFzZSBjYW4geW91IHJld29yZCB0aGUgc3ViamVjdCB0byBiZSBhIGJpdCBtb3JlIHVz
ZWZ1bD8gVGhlIGNvbW1pdAo+ID4gPiBtZXNzYWdlIGlzIGdyZWF0LCBidXQgdGhlIHN1YmplY3Qg
aXMgYSBiaXQgbGlrZSAiZml4IGJ1ZyBpbiBjb2RlIiB0byBtZS4KPiA+IAo+ID4geWVhaCwgbm90
IHRoZSBiZXN0ICRzdWJqZWN0LCBidXQgSSB3YXNuJ3QgcXVpdGUgc3VyZSBob3cgdG8gZml0Cj4g
PiBzb21ldGhpbmcgYmV0dGVyIGluIGEgcmVhc29uYWJsZSAjIG9mIGNoYXJzLi4gbWF5YmUgc29t
ZXRoaW5nIGxpa2U6Cj4gPiAiaW9tbXUvYXJtLXNtbXU6IG9wdGltaXplIHVubWFwIGJ1dCBhdm9p
ZGluZyB0b2dnbGluZyBydW5wbSBzdGF0ZSI/Cj4gCj4gRldJVywgSSdkIGJlIGluY2xpbmVkIHRv
IGZyYW1lIGl0IGFzIHNvbWV0aGluZyBsaWtlICJhdm9pZCBwYXRob2xvZ2ljYWwgUlBNCj4gYmVo
YXZpb3VyIGZvciB1bm1hcHMiLgoKTEdUTSEKCldpbGwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9A
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZnJlZWRyZW5v

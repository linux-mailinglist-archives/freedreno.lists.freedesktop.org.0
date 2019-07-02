Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A6E5D7EE
	for <lists+freedreno@lfdr.de>; Tue,  2 Jul 2019 23:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB056E094;
	Tue,  2 Jul 2019 21:53:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B7A6E095
 for <freedreno@lists.freedesktop.org>; Tue,  2 Jul 2019 21:53:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so415964wru.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Jul 2019 14:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F9/H9RAoH6E0au9JZUxTVdK2VUAjq3U7v2tg4NjLm2E=;
 b=YCKkSgxL7T2MnvSCjM/bRPzT/xkKjLpMAycC8N/WC2VapmU7SJayFiU8VMis7/xS+j
 AIOkjAa0bl7Uw0J+yysZzHebMnOiZEN41DZu0ldaPl8Sdcmjj3+TP/YaLpOKAj0Zh/nP
 +0IKEXYP0aLEWvq6yY1V3x0nOewydp4FhbWTHS5mBZ1187HviWCArJbuNWFoX2QwKbU5
 1xRLNSqqcRiAmCGg6Dc0U+R0mRS95TVkW+mRFPNLto1M4IB36AgnNr/xyu9b5w6Opmem
 zfsojYe07GZ3qnp71GE8dr7zUqqvc7S20Q3UChn4OKneTTRBBNzXF2gADvFg9WK6N3v6
 iRaw==
X-Gm-Message-State: APjAAAX7vTYDVZ5I5EMcVxCCXwjKdvGxywj6zXAHRvCBLHTJwxcV9lX6
 MYJ2osZBE4w1z+Z1hZvEIRoBfc8HE25qW5UZj30dGg==
X-Google-Smtp-Source: APXvYqwncd3iUgHVxdaYlFV1ID7X2V0/XLGwEniTYBbvfKVWOvdTx6vknWmPXyn5a8WQ1T7hGJ+i80nMqSq/lFM6R0k=
X-Received: by 2002:a5d:6743:: with SMTP id l3mr14273796wrw.241.1562104410996; 
 Tue, 02 Jul 2019 14:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-3-robdclark@gmail.com>
 <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
 <CAKv+Gu-KhPJxxJA3+J813OPcnoAD4nHq6MhiRTJSd_5y1dPNnw@mail.gmail.com>
 <CAF6AEGv+uAXVV6Q78n=jP0YRDjYn9OS=Xec9MU0+_7EBirxF5w@mail.gmail.com>
In-Reply-To: <CAF6AEGv+uAXVV6Q78n=jP0YRDjYn9OS=Xec9MU0+_7EBirxF5w@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 2 Jul 2019 23:53:16 +0200
Message-ID: <CAKv+Gu9pH9=AnNee7B-z0sP3rGJ-0Qnpziyx445M30KWC=Vq+w@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=F9/H9RAoH6E0au9JZUxTVdK2VUAjq3U7v2tg4NjLm2E=;
 b=SK3VY71b9UfihRePdJGtKBSdbFrEGcoMgA1+oLMpx0UPe6Zi3uDRyGD2EMNmRcqIq+
 l0yxeXPdzy0dawH3rtJ13sku4q+pHqx7YfCt0T/4f0C1De+u9h4Kz7vk989kCRBNZ824
 mTFjAk2XxdC4yvnm3rbUtw188u5UCkTkf8iB9ychSLYnKHzkYHKzxWzg/0qF5Kfv/9Ig
 /GrTrehl6RSlBv6Ck2krL2WRej8+bAHwkMfScnrp4Eezc+lmMKJpg/mT/Sg9laJXC7bT
 NPJ2fF2dt1HcWXS/Ex0YgUuMz0yKlYeezBAJ9Kv3upJ4MbSyUkw1RN7KepizvqV+xWfx
 5AhQ==
Subject: Re: [Freedreno] [PATCH 2/4] efi/libstub: detect panel-id
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 linux-efi <linux-efi@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Steve Capper <steve.capper@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Julien Thierry <julien.thierry@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Lukas Wunner <lukas@wunner.de>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCAyIEp1bCAyMDE5IGF0IDIzOjAyLCBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMiwgMjAxOSBhdCAxOjM1IFBNIEFyZCBCaWVzaGV1
dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIDIg
SnVsIDIwMTkgYXQgMjI6MjYsIEFyZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8u
b3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gU3VuLCAzMCBKdW4gMjAxOSBhdCAyMjozNiwgUm9i
IENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEZyb206
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+ID4gPgo+ID4gPiA+IE9uIHNu
YXBkcmFnb24gYWFyY2g2NCBsYXB0b3BzLCBhICdVRUZJRGlzcGxheUluZm8nIHZhcmlhYmxlIGlz
IHByb3ZpZGVkCj4gPiA+ID4gdG8gY29tbXVuaWNhdGUgc29tZSBpbmZvcm1hdGlvbiBhYm91dCB0
aGUgZGlzcGxheS4gIENydXRpYWxseSBpdCBoYXMgdGhlCj4gPiA+ID4gcGFuZWwtaWQsIHNvIHRo
ZSBhcHByb3ByaWF0ZSBwYW5lbCBkcml2ZXIgY2FuIGJlIHNlbGVjdGVkLiAgUmVhZCB0aGlzCj4g
PiA+ID4gb3V0IGFuZCBzdGFzaCBpbiAvY2hvc2VuL3BhbmVsLWlkIHNvIHRoYXQgZGlzcGxheSBk
cml2ZXIgY2FuIHVzZSBpdCB0bwo+ID4gPiA+IHBpY2sgdGhlIGFwcHJvcHJpYXRlIHBhbmVsLgo+
ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+ID4gPgo+ID4gPiBIaSBSb2IsCj4gPiA+Cj4gPiA+IEkgdW5kZXJzdGFuZCB3aHkg
eW91IGFyZSBkb2luZyB0aGlzLCBidXQgdGhpcyAqcmVhbGx5KiBiZWxvbmdzIGVsc2V3aGVyZS4K
PiA+ID4KPiA+ID4gU28gd2UgYXJlIGRlYWxpbmcgd2l0aCBhIHBsYXRmb3JtIHRoYXQgdmlvbGF0
ZXMgdGhlIFVFRkkgc3BlYywgc2luY2UKPiA+ID4gaXQgZG9lcyBub3QgYm90aGVyIHRvIGltcGxl
bWVudCB2YXJpYWJsZSBzZXJ2aWNlcyBhdCBydW50aW1lIChiZWNhdXNlCj4gPiA+IE1TIGxldCB0
aGUgdmVuZG9yIGdldCBhd2F5IHdpdGggdGhpcykuCj4gPiA+Cj4gPgo+ID4gVG8gY2xhcmlmeSwg
dGhlIGFib3ZlIHJlbWFyayBhcHBsaWVzIHRvIHBvcHVsYXRpbmcgdGhlIERUIGZyb20gdGhlIE9T
Cj4gPiByYXRoZXIgdGhhbiBmcm9tIHRoZSBmaXJtd2FyZS4KPgo+IHllYWgsIGl0IGlzbid0IHBy
ZXR0eSwgYnV0IHRoZXJlICphcmUqIHNvbWUgb3RoZXIgc2ltaWxhciBjYXNlcyB3aGVyZQo+IGVm
aS1zdHViIGlzIHBvcHVsYXRpbmcgRFQuLiAobGlrZSB1cGRhdGVfZmR0X21lbW1hcCgpIGFuZAo+
IGthc2xyLXNlZWQpLi4KPgoKVHJ1ZSwgYnV0IHRob3NlIGRvbid0IGRlc2NyaWJlIHRoZSBoYXJk
d2FyZS4KCj4gaXQgd291bGQgYmUga2luZGEgbmljZSB0byBoYXZlIGFuIGVhcmx5LXF1aXJrcyBt
ZWNoYW5pc20gd2hlcmUgdGhpcwo+IGNvdWxkIGZpdCwgYnV0IEkgdGhvdWdodCB0aGF0IG1pZ2h0
IGJlIGVxdWFsbHkgdW5wb3B1bGFyIDstKQo+CgpWZXJ5IDotKQoKPiA+Cj4gPiA+IEZpcnN0IG9m
IGFsbCwgdG8gcGFzcyBkYXRhIGJldHdlZW4gdGhlIEVGSSBzdHViIGFuZCB0aGUgT1MgcHJvcGVy
LCB3ZQo+ID4gPiBzaG91bGQgdXNlIGEgY29uZmlndXJhdGlvbiB0YWJsZSByYXRoZXIgdGhhbiBh
IERUIHByb3BlcnR5LCBzaW5jZSB0aGUKPiA+ID4gZm9ybWVyIGlzIEFDUEkvRFQgYWdub3N0aWMu
IEFsc28sIEknZCBsaWtlIHRoZSBjb25zdW1lciBvZiB0aGUgZGF0YSB0bwo+ID4gPiBhY3R1YWxs
eSBpbnRlcnByZXQgaXQsIGkuZS4sIGp1c3QgZHVtcCB0aGUgd2hvbGUgb3BhcXVlIHRoaW5nIGlu
dG8gYQo+ID4gPiBjb25maWcgdGFibGUgaW4gdGhlIHN0dWIsIGFuZCBkbyB0aGUgcGFyc2luZyBp
biB0aGUgT1MgcHJvcGVyLgo+ID4gPgo+ID4gPiBIb3dldmVyLCBJIGFtIG5vdCB0aHJpbGxlZCBh
dCBhZGRpbmcgY29kZSB0byB0aGUgc3R1YiB0aGF0Cj4gPiA+IHVuY29uZGl0aW9uYWxseSBsb29r
cyBmb3Igc29tZSB2YXJpYWJsZSB3aXRoIHNvbWUgbWFnaWMgbmFtZSBvbiBhbGwKPiA+ID4gQVJN
L2FybTY0IEVGSSBzeXN0ZW1zLCBzbyB0aGlzIHdpbGwgbmVlZCB0byBsaXZlIHVuZGVyIGEgS2Nv
bmZpZwo+ID4gPiBvcHRpb24gdGhhdCBkZXBlbmRzIG9uIEFSTTY0IChhbmQgZG9lcyBub3QgZGVm
YXVsdCB0byB5KQo+Cj4gSSBkZWZuIGNhbiBhZGQgdGhpcyB1bmRlciBrY29uZmlnLi4gaXMgaXQg
b2sgaWYgdGhhdCBvcHRpb24gaXMKPiBzZWxlY3QnZCBieSBBUkNIX1FDT00/Cj4KCkkgZ3Vlc3Mg
c29tZSBtb2JpbGUgU09DL3NuYXBkcmFnb24gc3ltYm9sIHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlh
dGUsCmJ1dCBnaXZlbiB0aGF0IHFjb20gbGVmdCB0aGUgc2VydmVyIGJ1c2luZXNzLCBJIGd1ZXNz
IGl0IGhhcmRseQptYXR0ZXJzLCBzbyBkZWZhdWx0IHkgaWYgQVJNNjQgJiYgQVJDSF9RQ09NIGlz
IGZpbmUgd2l0aCBtZQoKPiAoSnVzdCB0cnlpbmcgdG8gbWluaW1pemUgdGhlIHRoaW5ncyB0aGF0
IGNhbiBnbyB3cm9uZyBhbmQgdGhlICJJIGdldCBhCj4gYmxhbmsgc2NyZWVuIGF0IGJvb3QiIGJ1
ZyByZXBvcnRzIEkgZ2V0IDstKSkKPgoKU3VyZQoKPiA+IC4uLiBidXQgc2F2aW5nIHZhcmlhYmxl
cyBhdCBib290IHRpbWUgZm9yIGNvbnN1bXB0aW9uIGF0IHJ1bnRpbWUgaXMKPiA+IHNvbWV0aGlu
ZyB0aGF0IHdlIHdpbGwgbGlrZWx5IHNlZSBtb3JlIG9mIGluIHRoZSBmdXR1cmUuCj4KPiBJIHRo
aW5rIHRoaXMgd2lsbCBiZSBuaWNlLCBidXQgaXQgYWxzbyBkb2Vzbid0IGFkZHJlc3MgdGhlIG5l
ZWQgZm9yIGEKPiBxdWlyayB0byBnZXQgdGhpcyBpbnRvIC9jaG9zZW4uLiAgSSBndWVzcyB3ZSAq
Y291bGQqIHVzZSBhIHNoaW0gb3IKPiBzb21ldGhpbmcgdGhhdCBydW5zIGJlZm9yZSB0aGUga2Vy
bmVsIHRvIGRvIHRoaXMuICBCdXQgdGhhdCBqdXN0IHNlZW1zCj4gbGlrZSBhIGxvZ2lzdGljYWwv
c3VwcG9ydCBuaWdodG1hcmUuICBUaGVyZSBpcyBvbmUga2VybmVsLCBhbmQgdGhlcmUKPiBhcmUg
TiBkaXN0cm8ncywgc28gZGVidWdnaW5nIGEgdXNlcnMgIkkgZG9uJ3QgZ2V0IGEgc2NyZWVuIGF0
IGJvb3QiCj4gcHJvYmxlbSBiZWNhdXNlIHRoZWlyIGRpc3RybyBtaXNzZWQgc29tZSBzaGltIHBh
dGNoIHJlYWxseSBqdXN0Cj4gZG9lc24ndCBzZWVtIGxpa2UgYSBoZWFkYWNoZSBJIHdhbnQgdG8g
aGF2ZS4KPgoKSSdkIGFyZ3VlIHRoYXQgdGhpcyBkb2VzIG5vdCBiZWxvbmcgaW4gL2Nob3NlbiBp
biB0aGUgZmlyc3QgcGxhY2UsCmkuZS4sIGl0IGRvZXNuJ3QgYmVsb25nIGluIHRoZSBEVCBhdCBh
bGwgaWYgdGhlIE9TIGNhbiBhY2Nlc3MgdGhlCmNvbmZpZyB0YWJsZSAoYW5kIHRoZXJlZm9yZSB0
aGUgdmFyaWFibGUpIGRpcmVjdGx5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9mcmVlZHJlbm8=

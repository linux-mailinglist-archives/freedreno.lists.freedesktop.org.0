Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85D5E92A
	for <lists+freedreno@lfdr.de>; Wed,  3 Jul 2019 18:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA44A89CAF;
	Wed,  3 Jul 2019 16:33:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600BF89CAF
 for <freedreno@lists.freedesktop.org>; Wed,  3 Jul 2019 16:33:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a10so2457125wrp.9
 for <freedreno@lists.freedesktop.org>; Wed, 03 Jul 2019 09:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AWfKUBqVWZzAawswGY+ZSjKKRhaQkfyUJM16meMSkPo=;
 b=lPXDlJcoaZWm9prdVc9OLbf+pl9Nz/B9JoYC9hJ+T0+4pkgmgWbIva3QNPZoujr8TG
 DQc0s+Gx6oGk5+53rqe1WhaPHrTbfk5EiR6U6bsLIs9v0Xh0Gnexs+692MdXlfhnc/Ic
 awaEAg4uzKqbQAZcsKSrl6ImQaTQ/g+m7mgCXWQcc3z5i1mj4Ie4PKvSePEzMEdx43xy
 stdDyhsqefeaHwjS3HQYAduQHrQdTbdi6md5Xnyb6sZ94GzNASHLImHf74Go6B0asQyG
 4aYylJn1h/O62De8WYUlJyn2wDtpLZpmduEeEPKXSYk1dCalKgplSvxMDssq7k1xjRl1
 rS+w==
X-Gm-Message-State: APjAAAWVPg+0jQeK4xgxSBxRnsR3XXN1H1JcJWlMXe17Z01S+FKNZ8dg
 ayjHpyzZquhq/qqxU7tZuDMUfw==
X-Google-Smtp-Source: APXvYqzyUKfEjD5zZwvYgn+6s0isuDDnar2rnm433earCTxIt7v2XJpN1VkPtyIJdyIZ37VlPS+lgw==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr24566996wrq.37.1562171594030; 
 Wed, 03 Jul 2019 09:33:14 -0700 (PDT)
Received: from bivouac.eciton.net (bivouac.eciton.net.
 [2a00:1098:0:86:1000:23:0:2])
 by smtp.gmail.com with ESMTPSA id x11sm1849858wmi.26.2019.07.03.09.33.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jul 2019 09:33:13 -0700 (PDT)
Date: Wed, 3 Jul 2019 17:33:11 +0100
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20190703163311.gtbo72dzpkpjvpi5@bivouac.eciton.net>
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-3-robdclark@gmail.com>
 <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
 <CAKv+Gu-KhPJxxJA3+J813OPcnoAD4nHq6MhiRTJSd_5y1dPNnw@mail.gmail.com>
 <CAF6AEGv+uAXVV6Q78n=jP0YRDjYn9OS=Xec9MU0+_7EBirxF5w@mail.gmail.com>
 <20190702215953.wdqges66hx3ge4jr@bivouac.eciton.net>
 <CAF6AEGvm62rcm4Lp4a+QmqFweVQ0QWXLDoN2CP8=40BdwiiVbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvm62rcm4Lp4a+QmqFweVQ0QWXLDoN2CP8=40BdwiiVbQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AWfKUBqVWZzAawswGY+ZSjKKRhaQkfyUJM16meMSkPo=;
 b=SqQC20u2dDoRyp5jcv3M6XGoifJsMIxnNea7QFL8/kVvb2UCAA8flUyKrqI9ejZsxZ
 kU2lTzUeRu2H0DRUt9A/+YcW0WKC5DXZvqhA47BbU1PJov63d4B7xFHu0rxghzEBubbZ
 fkMx1vyy/KTqcrRxJ+wHbzR2RcWI1bsuYQcvYx643PjJlTEsXtRRS7kMcAVARcFXauGR
 aiyn9SU9SWjPsZCxZay9+2jPSeswBVq0FudAScZpXG6CCQBNvCRRCMx6Rv+uQbeWlscd
 Okt/CDrAd7xyJqLMP7lTdjQCS5owlIquNQtdAenesffTZrDbAuwzfwfl/va0He7LjOa8
 g+YA==
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
 Julien Thierry <julien.thierry@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Steve Capper <steve.capper@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Lukas Wunner <lukas@wunner.de>,
 freedreno <freedreno@lists.freedesktop.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDM6NDg6NDhQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+ID4gPiBUaGVyZSBpcyBvbmUga2VybmVsLCBhbmQgdGhlcmUKPiA+ID4gYXJlIE4gZGlzdHJv
J3MsIHNvIGRlYnVnZ2luZyBhIHVzZXJzICJJIGRvbid0IGdldCBhIHNjcmVlbiBhdCBib290Igo+
ID4gPiBwcm9ibGVtIGJlY2F1c2UgdGhlaXIgZGlzdHJvIG1pc3NlZCBzb21lIHNoaW0gcGF0Y2gg
cmVhbGx5IGp1c3QKPiA+ID4gZG9lc24ndCBzZWVtIGxpa2UgYSBoZWFkYWNoZSBJIHdhbnQgdG8g
aGF2ZS4KPiA+Cj4gPiBUaGUgZGlzdHJvcyBzaG91bGQgbm90IG5lZWQgdG8gYmUgYXdhcmUgKmF0
IGFsbCogb2YgdGhlIGhhY2tzIHJlcXVpcmVkCj4gPiB0byBkaXNndWlzZSB0aGVzZSBwbGF0Zm9y
bXMgYXMgRFQgcGxhdGZvcm1zLgo+ID4KPiA+IElmIHRoZXkgZG8sIHRoZXkncmUgYWxyZWFkeSBk
ZXZpY2Utc3BlY2lmaWMgaW5zdGFsbGVycyBhbmQgaGF2ZQo+ID4gYWxyZWFkeSBhY2NlcHRlZCB0
aGUgbG9naXN0aWNhbC9zdXBwb3J0IG5pZ2h0bWFyZS4KPiAKPiBJIGd1ZXNzIEknbSBub3QgKmFn
YWluc3QqIGEgRFQgbG9hZGVyIHNoaW0gcG9wdWxhdGluZyB0aGUgcGFuZWwtaWQKPiBvdmVyIGlu
dG8gL2Nob3Nlbi4uIEkgaGFkIGl0IGluIG1pbmQgYXMgYSBiYWNrdXAgcGxhbi4gIE9mYyBzdGls
bCBuZWVkCj4gdG8gZ2V0IGR0IGZvbGtzIHRvIGJ1eSBpbnRvIC9jaG9zZW4vcGFuZWwtaWQgYnV0
IGZvciBEVCBib290IEkgdGhpbmsKPiB0aGF0IGlzIHRoZSBiZXN0IG9wdGlvbi4gIChBdCBsZWFz
dCB0aGUgL2Nob3Nlbi9wYW5lbC1pZCBhcHByb2FjaAo+IGRvZXNuJ3QgcmVxdWlyZSB0aGUgc2hp
bSB0byBiZSBhd2FyZSBvZiBob3cgdGhlIHBhbmVsIGlzIHdpcmVkIHVwIHRvCj4gZHNpIGNvbnRy
b2xsZXIgYW5kIHdoZXRoZXIgdGhlaXIgaXMgYSBicmlkZ2UgaW4gYmV0d2VlbiwgYW5kIHRoYXQK
PiBzaG9ydCBvZiB0aGluZywgc28gdGhlIHBhbmVsLWlkIGFwcHJvYWNoIHNlZW1zIG1vcmUgbWFp
bnRhaW5hYmxlIHRoYXQKPiBvdGhlciBvcHRpb25zLikKCkkgYW0gbGVhbmluZyBsaWtlIEFyZCB0
b3dhcmRzIHByZWZlcnJpbmcgYSBjb25maWd1cmF0aW9uIHRhYmxlIHRob3VnaC4KClRoYXQgcmVt
b3ZlcyB0aGUgcXVlc3Rpb24gb2Ygbm8gcnVudGltZSBzZXJ2aWNlcyAobmVlZGluZyB0byBtYW51
YWxseQpjYWNoZSB0aGluZ3MsIGF0IGxlYXN0IHVudGlsIEVCQlIgMS4yICg/KSBpcyBvdXQgYW5k
IGluIHVzZSksIGFuZAptZWFucyB3ZSBkb24ndCBoYXZlIHRvIHVzZSBkaWZmZXJlbnQgcGF0aHMg
Zm9yIERUIGFuZCBBQ1BJLiBOb3cgd2UKaGF2ZSBVRUZJIGluIFUtQm9vdCwgZG8gd2UgcmVhbGx5
IG5lZWQgdG8gd29ycnkgYWJvdXQgdGhlIG5vbi1VRUZJCmNhc2U/Cgo+IEkgYW0gYSBiaXQgZmVh
cmZ1bCBvZiBwcm9ibGVtcyBhcmlzaW5nIGZyb20gZGlmZmVyZW50IGRpc3Ryb3MgYW5kCj4gdXNl
cnMgdXNpbmcgZGlmZmVyZW50IHZlcnNpb25zIG9mIHNoaW0sIGFuZCBob3cgdG8gbWFuYWdlIHRo
YXQuICBJCj4gZ3Vlc3MgaWYgc29tZWhvdyAic2hpbSB0aGluZyIgd2FzIHBhcnQgb2YgdGhlIGtl
cm5lbCwgdGhlcmUgd291bGQgYnkKPiBvbmUgbGVzcyBtb3ZpbmcgcGFydC4uLgoKU3VyZSwgYnV0
IHRoYXQncyBpbnN1cmFuY2UgYWdhaW5zdCBiaW5kaW5ncyBjaGFuZ2luZwpub24tYmFja3dhcmRz
LWNvbXBhdGlibHkgLSB3aGljaCB0aGVyZSBhcmUgd2F5cyB0byBwcmV2ZW50LCBhbmQgd2hpY2gK
c3RyZWFtbGluaW5nIHRoZSBkZXNpZ24gZm9yIHJlYWxseSBpc24ndCB0aGUgd2F5IHRvIGRpc2Nv
dXJhZ2UuLi4KCkRpc3Ryb3MgaGF2ZSBubyBuZWVkIHRvIHdvcnJ5IGFib3V0IHRoZSBEVCBsb2Fk
ZXIgLSB0aGUgd2hvbGUgcG9pbnQgb2YKaXQgaXMgdG8gcmVtb3ZlIHRoZSBuZWVkIGZvciB0aGUg
ZGlzdHJvIHRvIHdvcnJ5IGFib3V0IGFueXRoaW5nIG90aGVyCnRoYW4gZ2V0dGluZyB0aGUgcmVx
dWlyZWQgZHJpdmVycyBpbi4KCj4gSSdkIGtub3cgaWYgdXNlciBoYWQga2VybmVsIHZYLlkuWiB0
aGV5J2QgYmUKPiBnb29kIHRvIGdvIHZzIG5vdC4gIEJ1dCAqYWxzbyogZGVwZW5kaW5nIG9uIGEg
bmV3LWVub3VnaCB2ZXJzaW9uIG9mIGEKPiBzaGltLCB3aGVyZSB0aGUgdmVyc2lvbiAjIGlzIHBy
b2JhYmx5IG5vdCBlYXNpbHkgYXBwYXJlbnQgdG8gdGhlIGVuZAo+IHVzZXIsIHNvdW5kcyBhIGJp
dCBzY2FyeSBmcm9tIHRoZSAiYWxsIHRoZSB0aGluZ3MgdGhhdCBjYW4gZ28gd3JvbmciCj4gcG9p
bnQgb2Ygdmlldy4gIE1heWJlIEknbSBwYXJhbm9pZCwgYnV0IEknbSBhIGJpdCB3b3JyaWVkIGFi
b3V0IGhvdyB0bwo+IG1hbmFnZSB0aGF0LgoKVW50aWwgdGhlIGhhcmR3YXJlIGFic3RyYWN0aW9u
cyBwcm92aWRlZCBieSB0aGUgc3lzdGVtIGZpcm13YXJlIChBQ1BJKQppcyBzdXBwb3J0ZWQsIHRo
ZXNlIHBsYXRmb3JtcyBhcmUgbm90IGdvaW5nIHRvIGJlIGFwcHJvcHJpYXRlIGZvcgplbmQgdXNl
cnMgYW55d2F5LiBObyBtYXR0ZXIgaG93IG1hbnkgbm90LXF1aXRlLXVwc3RyZWFtIGhhY2tzIGRp
c3Ryb3MKaW5jbHVkZSwgdGhleSB3b24ndCBiZSBhYmxlIHRvIHN1cHBvcnQgdGhlIG5leHQgbWlu
b3Igc3BpbiB0aGF0IGNvbWVzCm9mZiB0aGUgcHJvZHVjdGlvbiBsaW5lIGFuZCBpcyBubyBsb25n
ZXIgY29tcGF0aWJsZSB3aXRoIGV4aXN0aW5nIERUcy4KCi8KICAgIExlaWYKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlz
dApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

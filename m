Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78210183ED
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2019 05:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B60789257;
	Thu,  9 May 2019 03:00:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD848926F
 for <freedreno@lists.freedesktop.org>; Thu,  9 May 2019 03:00:34 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id g9so478822pfo.11
 for <freedreno@lists.freedesktop.org>; Wed, 08 May 2019 20:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R6mFOl4YJArdXkPl64BdobxdiCxDb1GQAsEcDCxAI1c=;
 b=o6J+NObLOldGJpy15L0nf1S1USLdy8aWOkvqRThMwOdIBwyF8gsK7OF6hpnBaE7mhN
 Bu5hmsMnWpcVyBeTe9v6ke/rouh8a8T1iw1HMH3zzeTFpBITDrrf4lelVq0e3LGO+JIc
 ta4t6Ep3gInb7gWjvQcda64SGlUS5tnxbbg4Ns6dhYF/hHWbbJwgufBGu2SbBzhvF+Ou
 kvagFGvMsNAyStHm18zAPNoWdYG2D1oDWOxYAWGVm35rbpuohoOuhqWvPP+RxQv7K731
 4W5lyPWID+JDuibJumVScec6ucp6w+iqYbC/IBl3job9NQWCOpmyp6WV8F45myU6O+Gd
 JpiQ==
X-Gm-Message-State: APjAAAVf+0f9NDr9Z5jNGinmGnj3YuOduMBgi9o0sC3fj+YtXj9rVzS1
 b7F1gTah3xO1AVu9MCdmWrCJhw==
X-Google-Smtp-Source: APXvYqxgN704DpczLbGfx053xEiv41Nt6oO0nbwl2oNJfPJaAeEeqFFzx6MkSY1scvkrrW5nHXsfWA==
X-Received: by 2002:a63:5659:: with SMTP id g25mr2416023pgm.59.1557370833308; 
 Wed, 08 May 2019 20:00:33 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id o5sm901426pfa.135.2019.05.08.20.00.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 20:00:31 -0700 (PDT)
Date: Wed, 8 May 2019 20:00:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20190509030047.GE2085@tuxbook-pro>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro>
 <20190509021616.GA26228@basecamp>
 <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R6mFOl4YJArdXkPl64BdobxdiCxDb1GQAsEcDCxAI1c=;
 b=AfK/Uume2oPASwykEbs/t9IMEMyllPOQopDa9fMIYaD+zAfbeCEUFdQuIappnyEn3z
 dXioYDA9KBXc/pOKOAihi0asuc6L5//SlvzGt4LgklZGtohHhIVNx3Fst2PBNV2u3PTj
 PiUEOpLgZNU8Jggtcbvz1aU0YT/6i8SvYYCA1qUjdlF3Ol/dGwMiw14DGpN5f5vw2ZkJ
 1x/5fvkiDw01ozcsLF/oUJy+2+wue9QV5IIjfdiorrI2SfwTjCWItRF/gla27XbLQFuS
 kMSmjYCnOW8T8itm7LgazU11YQiaDQY2lN50WFLZ8I6Mh/r01WIW/ChsfNTLzuX6T0Oh
 yeLw==
Subject: Re: [Freedreno] [PATCH RFC 4/6] ARM: dts: msm8974: add display
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkIDA4IE1heSAxOToyNSBQRFQgMjAxOSwgUm9iIENsYXJrIHdyb3RlOgoKPiBPbiBXZWQs
IE1heSA4LCAyMDE5IGF0IDc6MTYgUE0gQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5v
cmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0IDExOjM5OjAyUE0gLTA3
MDAsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToKPiA+ID4gT24gU3VuIDA1IE1heSAwNjowNCBQRFQg
MjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3
NC5kdHNpCj4gPiA+IFsuLl0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xv
Y2tzID0gPCZtbWNjIE1EU1NfTURQX0NMSz4sCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmbW1jYyBNRFNTX0FIQl9DTEs+LAo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8Jm1tY2MgTURTU19BWElfQ0xLPiwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZtbWNjIE1EU1NfQllURTBfQ0xL
PiwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZtbWNjIE1E
U1NfUENMSzBfQ0xLPiwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPCZtbWNjIE1EU1NfRVNDMF9DTEs+LAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8Jm1tY2MgTU1TU19NSVNDX0FIQl9DTEs+Owo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJtZHBfY29yZSIsCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImlmYWNlIiwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiYnVzIiwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiYnl0ZSIsCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInBpeGVsIiwKPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29yZSIsCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImNvcmVfbW1zcyI7
Cj4gPiA+Cj4gPiA+IFVubGVzcyBJIGVuYWJsZSBNTVNTX01NU1NOT0NfQVhJX0NMSyBhbmQgTU1T
U19TMF9BWElfQ0xLIEkgZ2V0IHNvbWUKPiA+ID4gdW5kZXJydW4gZXJyb3IgZnJvbSBEU0kuIFlv
dSBkb24ndCBzZWUgYW55dGhpbmcgbGlrZSB0aGlzPwo+ID4gPgo+ID4gPiAoVGhlc2UgY2xvY2tz
IGFyZSBjb250cm9sbGVkIGJ5IG1zbV9idXMgZG93bnN0cmVhbSBhbmQgc2hvdWxkIGJlIGRyaXZl
bgo+ID4gPiBieSBpbnRlcmNvbm5lY3QgdXBzdHJlYW0pCj4gPiA+Cj4gPiA+Cj4gPiA+IEFwYXJ0
IGZyb20gdGhpcywgSSB0aGluayB0aGlzIGxvb2tzIG5pY2UuIEhhcHB5IHRvIHNlZSB0aGUgcHJv
Z3Jlc3MuCj4gPgo+ID4gTm8sIEknbSBub3Qgc2VlaW5nIGFuIHVuZGVycnVuIGVycm9ycyBmcm9t
IHRoZSBEU0kuIEkgdGhpbmsgdGhlIGNsb2Nrcwo+ID4gYXJlIGZpbmUgc2luY2UgSSdtIGFibGUg
dG8gZ2V0IHRoaXMgd29ya2luZyB3aXRoIDQuMTcgdXNpbmcgdGhlc2Ugc2FtZQo+ID4gY2xvY2tz
LiBJIGp1c3Qgc2VudCBvdXQgdjIgYW5kIHRoZSBjb3ZlciBsZXR0ZXIgaGFzIHNvbWUgZGV0YWls
cywgYWxvbmcKPiA+IHdpdGggdGhlIGZ1bGwgZG1lc2cuCj4gCj4gc2luY2Ugd2UgZG9uJ3QgaGF2
ZSBpbnRlcmNvbm5lY3QgZHJpdmVyIGZvciA4OTc0LCBJIGd1ZXNzIHRoZXJlIGlzCj4gc29tZSBj
aGFuY2UgdGhhdCB0aGluZ3Mgd29yayBvciBub3QgYmFzZWQgb24gaG93IGxrIGxlYXZlcyB0aGlu
Z3M/Cj4gCgpSaWdodCwgSSBndWVzcyB0aGUgYm9vdGxvYWRlciBvbiBteSBkZXZpY2UgZG9lcyBu
b3QgbGVhdmUgdGhlIGJ1c3Nlcwp0aWNraW5nIC0gcGVyaGFwcyB0aGVyZSdzIGEgYm9vdCBzcGxh
c2ggaW52b2x2ZWQgb24gQnJpYW4ncyBkZXZpY2U/CgpSZWdhcmRsZXNzLCB0aGlzIHdvcmtzIG9u
IE5leHVzIDUgYW5kIGFsbG93cyBCcmlhbiB0byBtYWtlIGZ1cnRoZXIKcHJvZ3Jlc3Mgc28gSSdt
IGFsbCBmb3IgbWVyZ2luZyBpdC4KClJlZ2FyZHMsCkJqb3JuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

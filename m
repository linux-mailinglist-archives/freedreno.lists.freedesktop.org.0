Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10019F22
	for <lists+freedreno@lfdr.de>; Fri, 10 May 2019 16:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328FE897F0;
	Fri, 10 May 2019 14:27:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DC989D8A
 for <freedreno@lists.freedesktop.org>; Fri, 10 May 2019 14:27:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b8so5394026edm.11
 for <freedreno@lists.freedesktop.org>; Fri, 10 May 2019 07:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LKDAWKtZBjlSILpwEIkU+OpgCtfBshAR7sSGSLBTGq4=;
 b=KrBNFbVzRpx7mJ/A+tb7b3aLmcq2le4c9t2IIXR4z7oCoEFTjDuAH2dDBJuTrOgaEz
 SF4wE2mErEt6YBYAJLfy5fv59SMVEb6aq+9gEcBnrbb9gfseNsk4nxL46R/Qi1Y1a3At
 iNi/LH8BKYBJ6ENl7lzsBU9m+jWgyT6Zumeg4pjKeMSB/+1GiiYeOvpykQ659n0jcY6V
 2/vpFgviovJ+UQZ9mIbZyeIh7TlLfaFa29V0fxEVeESqSSBDRGNKJdAgEzCXhE46pdmm
 TQZSkgVaajD5hdTKrBnIKI3qBngUZ//o4vPyoP3Qfx+eBgAaU2zM/rKwIg0hDi9U/nNl
 acUw==
X-Gm-Message-State: APjAAAWWDls0Z++rN0wkMhx/gTZTd7+BWbANpQpCJ+PVIKqesgblSVhV
 7z7iPme/1DKwmisap4t3OpMPsUYFRInsSB7vVhQT4D5u
X-Google-Smtp-Source: APXvYqz6HcPgYQ981xDgYM8+7ihalADyOUwikWWy7vaRL1mYWTTpfUOEpPk7btk4wpwLgv230u1khQUiibFNiA7YeNY=
X-Received: by 2002:a50:f4cb:: with SMTP id v11mr11566285edm.21.1557498429446; 
 Fri, 10 May 2019 07:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=kLpt5pSiy0HBoQ61LR9BGyKUq6jJrHSFE_kp4D3W8W9XVgg@mail.gmail.com>
 <CAF6AEGvdnO9ydtpehr0yKdFvv-9yTDRCbuLaUMu__Xma6EYmjg@mail.gmail.com>
 <CAD=kLptcGHsd7rWz8FVS6=igtmsikVE5rBx0Gu2-k+pcaqxreA@mail.gmail.com>
In-Reply-To: <CAD=kLptcGHsd7rWz8FVS6=igtmsikVE5rBx0Gu2-k+pcaqxreA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 May 2019 07:27:00 -0700
Message-ID: <CAF6AEGt05OSUVeccHDK+9WH6enAjnx70RdsN8-iMBw-F=Xpa7g@mail.gmail.com>
To: Shubham Verma <shubhunic@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LKDAWKtZBjlSILpwEIkU+OpgCtfBshAR7sSGSLBTGq4=;
 b=m1HpFYVF14I3RSqvo4OS1ldwD2DWlnC7li33xPi1IG05skP5rlwbhcPSbgSoTwmOT9
 MBg403PkfnVjYyuNafhfALgswjievGAIqGEElNbPv07wNvXogmxFOlPXOogyKe/6Y+qY
 b2dv2LnciyV/KFcxYKnEln/eP8yc5ihL0vTFdwm/rRHWM24W05VpLlQDMjws1dPe++tD
 +sR9clQoDJHJy9KOAewpRuqaLCJhTOnFN0o4fhj3TOMtgKDRnw1w6PKsgIQNB0j/rVGr
 M6sI4M+ZSbf589aN04ABvKs1/dm7UXAhMrACAit4t0d/XaWGjeLtsyvDgpnAB0e3JY81
 QMSg==
Subject: Re: [Freedreno] About EVOC 2019 project ideas
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
Cc: evoc@foundation.x.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SSBkb24ndCB0aGluayBpdCBpcyBhIGdvb2QgcHJvamVjdCAocmlnaHQgbm93IHRoZSBuZWVkZWQg
aGFyZHdhcmUgaXMgYQpiaXQgaGFyZCB0byBnZXQsIGFuZCBJIGRvbid0IHJlYWxseSBoYXZlIHRp
bWUgdG8gbWVudG9yIGFuIEVWb0MKcHJvamVjdCBhdCBoZSBzYW1lIHRpbWUgYXMgYSBHU29DIHBy
b2plY3QpCgpCUiwKLVIKCk9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDY6MDggQU0gU2h1YmhhbSBW
ZXJtYSA8c2h1Ymh1bmljQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGFuayB5b3UgZm9yIHRoZSBp
bmZvcm1hdGlvbiBzaXIuIFRoZW4gd2UgY2FuIHdvcmsgb24gY29tcHJlc3NlZCB0ZXh0dXJlcyBw
cm9qZWN0Lgo+Cj4gT24gRnJpLCAxMCBNYXkgMjAxOSA2OjE2IHBtIFJvYiBDbGFyaywgPHJvYmRj
bGFya0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBIaSwgYWN0dWFsbHkgdGhlIHRleHR1cmUgdGls
aW5nIHByb2plY3Qgd2FzIHNlbGVjdGVkIGZvciBhIEdTb0MKPj4gcHJvamVjdCB3aGljaCBpcyBq
dXN0IHN0YXJ0aW5nIHVwLi4gQnV0IHRoZXJlIG1heSBiZSBvdGhlciBwcm9qZWN0cwo+PiBmb3Ig
b3RoZXIgZHJpdmVycyBvciBpbiBvdGhlciBhcmVhcyBvZiBtZXNhL3hzZXJ2ZXIvZHJtL2V0Yy4g
IEFkZGluZwo+PiBldm9jIGxpc3QuCj4+Cj4+IEJSLAo+PiAtUgo+Pgo+PiBPbiBGcmksIE1heSAx
MCwgMjAxOSBhdCA1OjQwIEFNIFNodWJoYW0gVmVybWEgPHNodWJodW5pY0BnbWFpbC5jb20+IHdy
b3RlOgo+PiA+Cj4+ID4gSGVsbG8gRGVhciBTaXIsCj4+ID4KPj4gPiBNeSBuYW1lIGlzIFNodWJo
YW0gVmVybWEuIEkgYW0gYSBCIHRlY2ggMm5kLXllYXIgSS5ULiBzdHVkZW50IEkgd291bGQgbGlr
ZSB0byBsb29rIGludG8gd29ya2luZyB3aXRoIFguT3JnIGZvciB0aGUgRW5kbGVzcyBWYWNhdGlv
biBvZiBDb2RlIHByb2dyYW0gMjAxOSB0aGlzIHN1bW1lci4KPj4gPgo+PiA+IEFzIHRoaXMgaXMg
bXkgZmlyc3QgRVZPQyAgSSB3YW50ZWQgdG8ga25vdyB3aGF0IG90aGVyIHRoaW5ncyBJIGhhdmUg
dG8gZG8gdG8gYmUgcGFydCBvZiBhbiBvcmdhbml6YXRpb24uCj4+ID4KPj4gPiBJIG1lbnRpb25l
ZCBteSBpbnRlcmVzdCBhbmQgcHJvamVjdCBvbiB3aGljaCBJIHdhbnQgdG8gd29yayBvbiBiZWxv
dywgaGF2ZSBhIGxvb2sgYXQgdGhhdCBhbmQgdGVsbCBtZSB3aGF0IHdpbGwgYmUgZ29vZCBmb3Ig
bWUuIEkgd2FudCB0byB3b3JrIG9uIHRoZSBwcm9qZWN0IG9mIFRleHR1cmUgVGlsaW5nIGFuZCBD
b21wcmVzc2VkIFRleHR1cmVzIHVuZGVyIHRoZSBndWlkYW5jZSBvZiB5b3VycyBhbmQgSSB3YW50
IHRvIGtub3cgd2hpY2ggcHJvamVjdCBvZiBGcmVlZHJlbm8gaW4gdGhlIGlkZWFsaXN0IGlzIG5v
dCBzZWxlY3RlZCBieSBhbnkgc3R1ZGVudC4KPj4gPgo+PiA+IEkgd291bGQgYmUgZ3JhdGVmdWwg
aWYgeW91IGNhbiB0ZWxsIG1lIGlmIHRoZXJlJ3MgYW55dGhpbmcgZWxzZSB0aGF0IEkgY291bGQg
ZG8gd2hpY2ggd291bGQgYmUgYXBwcmVjaWF0ZWQuIEFueSBmdXJ0aGVyIGd1aWRhbmNlIG9yIGlu
cHV0cyB3b3VsZCBjZXJ0YWlubHkgYmUgb2YgZ3JlYXQgaGVscC4KPj4gPgo+PiA+Cj4+ID4gVGhh
bmsgeW91IQo+PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+ID4gRnJlZWRyZW5vIG1haWxpbmcgbGlzdAo+PiA+IEZyZWVkcmVub0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ZyZWVkcmVubwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVl
ZHJlbm8=

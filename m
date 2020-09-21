Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903122726F9
	for <lists+freedreno@lfdr.de>; Mon, 21 Sep 2020 16:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C88E6E373;
	Mon, 21 Sep 2020 14:28:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85B76E2E0
 for <freedreno@lists.freedesktop.org>; Mon, 21 Sep 2020 14:28:21 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c8so13014915edv.5
 for <freedreno@lists.freedesktop.org>; Mon, 21 Sep 2020 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VzVFv87gEs+DoQS8yQmlQI7hV0/JZ6iyGje6mT9KAwE=;
 b=r4E87SE8cRmNC5/QVPBZTvtY0WwQCAYq610H3TrqushG0vNVlKdRr1yDB+OGvjsEsh
 S3FMPazSyqly4DhCb4U7Daasb48nWMYCRokGTGWWDWr9Lzd6KgGSzsSL2bf8JN8hSUUg
 fRzGoMda0izTxUfQ1oDoraADyOixRpShNlZWwVuWp+90kzwtm6dXywXfCJwfHNYTDPPC
 BRvwUcCNbRJRVtNCA8XAXeWeF7BEiteuUSc0wY4jwhVuicLkHdBYv1A9LX7rLKMIuKyJ
 4unfy8WbdjnYnXrOLoUKtowSivIVSvfiJ9L/35cPYAO2P/1sV7m+awpIj8vkbInTptyh
 hePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VzVFv87gEs+DoQS8yQmlQI7hV0/JZ6iyGje6mT9KAwE=;
 b=X/z2TefcDl+hfcxx1/rcxRfGPaK0MR4YJD8/vuN5UJfeafkbGMCelsneZrelWI73Hw
 zH55/4Ha6wlc3svsBOUC5OWuLhvuGvymEYdv2JDxfidjOrK6Zi+jh986bTDcdrnze3uG
 qERFNV70mCmG4TOi3LV82wt0XM47GV18d1x8q1ad1BKYXLXDawovKfC+M10hU/+mPeg5
 0DvuTWOUC/IIsK6l4SS8L8xD1lriS5J+iui9rMtXP55VBFzsG2u1qUPcgh5pUgaS0L4R
 DX98UFUlRf5bqjuJS2SP9WBsINOF8FHiZK5eyHLIGPKwK+6M9ORnlXLpoTFWwpyvqH6c
 NxZw==
X-Gm-Message-State: AOAM53397qbmrv9jgKDTPPKR6gL0GUbpCdP5uhyvCmZ4sKIgM4Hf6VIa
 9gU8GMW167F0yQ9cckfvmLMGc40mqSuL9FlVZoH0jw==
X-Google-Smtp-Source: ABdhPJxzM6EYIqImTXX3nZVDlcUVt4Reycl0v4NuDxz6VB7H68kqhbvAzdwYiX9PD8RD0OTNupjfeVlIQGuz17LfGtQ=
X-Received: by 2002:aa7:d747:: with SMTP id a7mr51024393eds.304.1600698500267; 
 Mon, 21 Sep 2020 07:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <4eaa69879014a406424b9702dd6574a305f4c98e.camel@igalia.com>
In-Reply-To: <4eaa69879014a406424b9702dd6574a305f4c98e.camel@igalia.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 21 Sep 2020 09:28:09 -0500
Message-ID: <CAOFGe97CpYKkNC3N=2kxCnFSSw5sQuQCEdkKGudCEL6em3YTGA@mail.gmail.com>
To: =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>
Subject: Re: [Freedreno] [Mesa-dev] XDC 2020 feedback and comments
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "xorg-devel@lists.freedesktop.org" <xorg-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "board@foundation.x.org" <board@foundation.x.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "events@lists.x.org" <events@lists.x.org>,
 "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rmlyc3Qgb2ZmLCBJIHRoaW5rIHlvdSBhbGwgZGlkIGEgZmFudGFzdGljIGpvYi4gIEkgZmVsdCB0
aGF0IHRoaW5ncwpyYW4gdmVyeSBzbW9vdGhseSBhbmQsIGFzIGZhciBhcyB0aGUgdGFsa3MgdGhl
bXNlbHZlcyBnbywgSSB0aGluayBpdAp3ZW50IGFsbW9zdCBhcyBzbW9vdGhseSBhcyBhbiBpbi1w
ZXJzb24gWERDLiAgSSdtIHJlYWxseSBxdWl0ZQppbXByZXNzZWQuICBJIGRvIGhhdmUgYSBjb3Vw
bGUgcGllY2VzIG9mIG1vcmUgbnVhbmNlZCBmZWVkYmFjazoKCiAxLiBJIHRoaW5rIHdlIHdlcmUg
bWF5YmUgYSBiaXQgdG9vIHNjYXJlZCBvZiBvdmVybG9hZGluZyBqaXRzaS4KSGF2aW5nIG1vcmUg
cGVvcGxlIGluIHRoZSBpbnN0YW5jZSBmb3IgcXVlc3Rpb25zIG1pZ2h0IGhhdmUgbWFkZSB0aGF0
CnBvcnRpb24gZ28gYmV0dGVyLiAgQXMgaXQgd2FzLCB0aGVyZSB3YXMgb25seSBvbmUgb3IgdHdv
IHRhbGtzIHRoYXQKaGFkIGFueSBsaXZlIHF1ZXN0aW9ucy4gIFRoYXQgc2FpZCwgdGhlcmUgYXJl
IGEgZmV3IGFkdmFudGFnZXMgdG8KaGF2aW5nIHRoaW5ncyBmdW5uZWxlZCB0aHJvdWdoIElSQywg
dGhlIG1vc3Qgb2J2aW91cyBvZiB3aGljaCBiZWluZwp0aGF0IHBlb3BsZSBjYW4gYXNrIHRoZWly
IHF1ZXN0aW9uIG1pZC10YWxrIGFuZCBoYXZlIGl0IGhhbmRsZWQgYXQgdGhlCmVuZCBpbnN0ZWFk
IG9mIGhhdmluZyB0byByZW1lbWJlciBpdCBmb3IgMjAgbWludXRlcy4KCiAyLiBJIHJlYWxseSBt
aXNzIHRoZSBoYWxsd2F5IHRyYWNrLiAgT24gVGh1cnNkYXksIGFmdGVyIHRoZQpjb25mZXJlbmNl
LCBCYXMsIENvbm5vciwgYW5kIEkgdXNlZCBqaXRzaSB0byBoYXZlIGEgY2hhdCBhYm91dApyYXkt
dHJhY2luZy4gIFRoYXQgd2FzIHJlYWxseSBmdW4gYW5kIEkgd2lzaCBJJ2QgZG9uZSBzb21ldGhp
bmcgbGlrZQp0aGF0IGV2ZXJ5IGRheSBvZiBYREMuICBNYXliZSBpdCdzIG15IG93biBmYXVsdCBm
b3Igbm90IHNldHRpbmcgdXAKc2FpZCBjaGF0cyBidXQgSSB0aGluayBpdCBjb3VsZCBoYXZlIGJl
ZW4gbWFkZSBtb3JlIGFjY2Vzc2libGUgKEkgaGFkCm5vIGlkZWEgaG93IHRvIGZvcmsgb2ZmIGEg
aml0c2kgaW5zdGFuY2UpIGFuZC9vciBlbmNvdXJhZ2VkIHNvbWVob3cuCgotLUphc29uCgpPbiBN
b24sIFNlcCAyMSwgMjAyMCBhdCAzOjA3IEFNIFNhbXVlbCBJZ2xlc2lhcyBHb25zw6FsdmV6Cjxz
aWdsZXNpYXNAaWdhbGlhLmNvbT4gd3JvdGU6Cj4KPiBIaSBhbGwsCj4KPiBIdWdlIHRoYW5rcyBh
Z2FpbiB0byB0aGUgZW50aXJlIHRlYW0gZnJvbSBJbnRlbCwgZm9yIHRoZWlyIGdyZWF0IHdvcmsK
PiBvcmdhbml6aW5nIFhEQyAyMDIwLCBvdXIgZmlyc3QgdmlydHVhbCBjb25mZXJlbmNlIQo+Cj4g
QXMgdXN1YWwgd2UncmUgbG9va2luZyBmb3IgZmVlZGJhY2sgb24gYm90aCBYREMgaXRzZWxmLCBh
bmQgdGhlIENGUAo+IHByb2Nlc3MgYW5kIHByb2dyYW0gc2VsZWN0aW9uLiBCb3RoIGFib3V0IHdo
YXQgd2FzIGdyZWF0IGFuZCBzaG91bGQgYmUKPiBrZXB0IGZvciBuZXh0IHllYXIncyBlZGl0aW9u
LCBhbmQgd2hlcmUgdGhlcmUncyByb29tIGZvciBpbXByb3ZlbWVudC4KPgo+IFRoZSBib2FyZCBk
b2VzIGtlZXAgc29tZSBub3RlcywgZm9yIHRob3NlIGludGVyZXN0ZWQgaW4gd2hhdCB3ZSBoYXZl
Cj4gYWxyZWFkeToKPgo+IC0gWERDIG5vdGVzIGZvciBwcm9zcGVjdGl2ZSBvcmdhbml6ZXJzOgo+
IGh0dHBzOi8vd3d3Lngub3JnL3dpa2kvRXZlbnRzL1JGUC8KPgo+IC0gQ0ZQIG5vdGVzOiBodHRw
czovL3d3dy54Lm9yZy93aWtpL0V2ZW50cy9QYXBlcnNDb21taXR0ZWUvCj4KPiBJZiB5b3Ugd2Fu
dCB0byBzZW5kIGluIHlvdXIgY29tbWVudHMgaW4gcHJpdmF0ZSwgcGxlYXNlIHNlbmQgdGhlbSB0
bwo+IHRoZSBYLm9yZyBGb3VuZGF0aW9uIGJvYXJkOiBib2FyZEBmb3VuZGF0aW9uLngub3JnCj4K
PiBDaGVlcnMsCj4KPiBTYW0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IG1lc2EtZGV2IG1haWxpbmcgbGlzdAo+IG1lc2EtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbWVzYS1kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
Cg==

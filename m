Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F988E7C6F
	for <lists+freedreno@lfdr.de>; Mon, 28 Oct 2019 23:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFFD6EAC5;
	Mon, 28 Oct 2019 22:38:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA3F6EAC5
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2019 22:38:16 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id z10so9632951ilo.8
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2019 15:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1pqft6NUgSGPSsYgTI6KAW/EqfWsmOX+X7GP8nWIKRQ=;
 b=Wko9tIpfK3mw7EfW3JBvGElBQ/Cf+LEHyjYdcNAA9+t8q8/2xdFUUeEXaTscxZR9t1
 jhvkTmMDd2J9mFdjx9QN1JpbfsAMYXxtB8V0Xbo433YkqfDmBpUPZuxsjfkKS8vtLjpQ
 pcqd0LKzgc+ybz1kkaI1aUf9L/QmO4l9BkSHBT/wn3g4Kv/pHTzg2R3EKXs7+xit+RSd
 Imi14St8IjYdfra4vezRx1A0OotfnpNiKpCQ6LcIlI4R4wDXLM9o/mIdK4DiFoAbtkbb
 uJMPBnovlr+dvxvd98V2rUHUV4hY0b7E6K3wO29isg0E9i2XsBEc52o6CVVS2zZYhZ1D
 ZZ3g==
X-Gm-Message-State: APjAAAV4/+2Mrt/BFmTZugMAii1vJzr4aS2B0vNjmHByf6LDlzm6VPFF
 Kh6lZE5Cx/6M1KL6sgXPl3Xsx9+C+lMhwf49XEt69Q==
X-Google-Smtp-Source: APXvYqzOjbPZql47NIkJK7AmtptD85c0h2swAJ0981IFdP5pW7aIvp/4iQe9Q33o2yPDwnBDa7OGwzugpAmPA0ld6FE=
X-Received: by 2002:a92:6e0a:: with SMTP id j10mr5422292ilc.26.1572302295420; 
 Mon, 28 Oct 2019 15:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
 <20191007204906.19571-1-robdclark@gmail.com>
 <20191028222042.GB8532@willie-the-truck>
In-Reply-To: <20191028222042.GB8532@willie-the-truck>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 28 Oct 2019 15:38:04 -0700
Message-ID: <CAJs_Fx7zRWsTPiAg0PFt+8nJPpHpzSkxW6XMMJwozVO6vyB78A@mail.gmail.com>
To: Will Deacon <will@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1pqft6NUgSGPSsYgTI6KAW/EqfWsmOX+X7GP8nWIKRQ=;
 b=KOtAhmLxM5DZQvf2Ll3f33KbklGMeTG2PKDxS+jixVpbEYv/r2fkX8rWW/POBAh8EZ
 bhaa9F6E4wiUOAv7xzTF/OPYtmaoF81sAIOIN1D7uz2hMlzRn/GbsAID1pmlxlh0ULbu
 KCWrpiKfUYuFXj/u1i4vCnm4AsCswlKrH1PH0=
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
Cc: freedreno <freedreno@lists.freedesktop.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, open list <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMzoyMCBQTSBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIE1vbiwgT2N0IDA3LCAyMDE5IGF0IDAxOjQ5
OjA2UE0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+IEZyb206IFJvYiBDbGFyayA8cm9iZGNs
YXJrQGNocm9taXVtLm9yZz4KPiA+Cj4gPiBXaGVuIGdhbWVzLCBicm93c2VyLCBvciBhbnl0aGlu
ZyB1c2luZyBhIGxvdCBvZiBHUFUgYnVmZmVycyBleGl0cywgdGhlcmUKPiA+IGNhbiBiZSBtYW55
IGh1bmRyZWRzIG9yIHRob3VzYW5kcyBvZiBidWZmZXJzIHRvIHVubWFwIGFuZCBmcmVlLiAgSWYg
dGhlCj4gPiBHUFUgaXMgb3RoZXJ3aXNlIHN1c3BlbmRlZCwgdGhpcyBjYW4gY2F1c2UgYXJtLXNt
bXUgdG8gcmVzdW1lL3N1c3BlbmQKPiA+IGZvciBlYWNoIGJ1ZmZlciwgcmVzdWx0aW5nIDUtMTAg
c2Vjb25kcyB3b3J0aCBvZiByZXByb2dyYW1taW5nIHRoZQo+ID4gY29udGV4dCBiYW5rIChhcm1f
c21tdV93cml0ZV9jb250ZXh0X2JhbmsoKS9hcm1fc21tdV93cml0ZV9zMmNyKCkvZXRjKS4KPiA+
IFRvIHRoZSB1c2VyIGl0IHdvdWxkIGFwcGVhciB0aGF0IHRoZSBzeXN0ZW0ganVzdCBsb2NrZWQg
dXAuCj4gPgo+ID4gQSBzaW1wbGUgc29sdXRpb24gaXMgdG8gdXNlIHBtX3J1bnRpbWVfcHV0X2F1
dG9zdXNwZW5kKCkgaW5zdGVhZCwgc28gd2UKPiA+IGRvbid0IGltbWVkaWF0ZWx5IHN1c3BlbmQg
dGhlIFNNTVUgZGV2aWNlLgo+Cj4gUGxlYXNlIGNhbiB5b3UgcmV3b3JkIHRoZSBzdWJqZWN0IHRv
IGJlIGEgYml0IG1vcmUgdXNlZnVsPyBUaGUgY29tbWl0Cj4gbWVzc2FnZSBpcyBncmVhdCwgYnV0
IHRoZSBzdWJqZWN0IGlzIGEgYml0IGxpa2UgImZpeCBidWcgaW4gY29kZSIgdG8gbWUuCgp5ZWFo
LCBub3QgdGhlIGJlc3QgJHN1YmplY3QsIGJ1dCBJIHdhc24ndCBxdWl0ZSBzdXJlIGhvdyB0byBm
aXQKc29tZXRoaW5nIGJldHRlciBpbiBhIHJlYXNvbmFibGUgIyBvZiBjaGFycy4uIG1heWJlIHNv
bWV0aGluZyBsaWtlOgoiaW9tbXUvYXJtLXNtbXU6IG9wdGltaXplIHVubWFwIGJ1dCBhdm9pZGlu
ZyB0b2dnbGluZyBydW5wbSBzdGF0ZSI/CgpCUiwKLVIKCgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBS
b2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+IHYxOiBvcmlnaW5h
bAo+ID4gdjI6IHVuY29uZGl0aW9uYWxseSB1c2UgYXV0b3N1c3BlbmQsIHJhdGhlciB0aGFuIGRl
Y2lkaW5nIGJhc2VkIG9uIHdoYXQKPiA+ICAgICBjb25zdW1lciBkb2VzCj4gPgo+ID4gIGRyaXZl
cnMvaW9tbXUvYXJtLXNtbXUuYyB8IDUgKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9t
bXUvYXJtLXNtbXUuYyBiL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwo+ID4gaW5kZXggM2YxZDU1
ZmI0M2M0Li5iN2I0MWY1MDAxYmMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L2FybS1z
bW11LmMKPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwo+ID4gQEAgLTI4OSw3ICsy
ODksNyBAQCBzdGF0aWMgaW5saW5lIGludCBhcm1fc21tdV9ycG1fZ2V0KHN0cnVjdCBhcm1fc21t
dV9kZXZpY2UgKnNtbXUpCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIGFybV9zbW11X3JwbV9wdXQo
c3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSkKPiA+ICB7Cj4gPiAgICAgICBpZiAocG1fcnVu
dGltZV9lbmFibGVkKHNtbXUtPmRldikpCj4gPiAtICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0
KHNtbXUtPmRldik7Cj4gPiArICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5k
KHNtbXUtPmRldik7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgc3RydWN0IGFybV9zbW11X2RvbWFp
biAqdG9fc21tdV9kb21haW4oc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tKQo+ID4gQEAgLTE0NDUs
NiArMTQ0NSw5IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfYXR0YWNoX2RldihzdHJ1Y3QgaW9tbXVf
ZG9tYWluICpkb21haW4sIHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICAgICAgIC8qIExvb2tzIG9r
LCBzbyBhZGQgdGhlIGRldmljZSB0byB0aGUgZG9tYWluICovCj4gPiAgICAgICByZXQgPSBhcm1f
c21tdV9kb21haW5fYWRkX21hc3RlcihzbW11X2RvbWFpbiwgZndzcGVjKTsKPgo+IFBsZWFzZSBj
YW4geW91IHB1dCBhIGNvbW1lbnQgaGVyZSBleHBsYWluaW5nIHdoYXQgdGhpcyBpcyBkb2luZz8g
QW4gYWJyaWRnZWQKPiB2ZXJzaW9uIG9mIHRoZSBjb21taXQgbWVzc2FnZSBpcyBmaW5lLgo+Cj4g
PiArICAgICBwbV9ydW50aW1lX3NldF9hdXRvc3VzcGVuZF9kZWxheShzbW11LT5kZXYsIDIwKTsK
PiA+ICsgICAgIHBtX3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKHNtbXUtPmRldik7Cj4KPiBDaGVl
cnMsCj4KPiBXaWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVu
bw==

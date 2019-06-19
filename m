Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942344C154
	for <lists+freedreno@lfdr.de>; Wed, 19 Jun 2019 21:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E306E451;
	Wed, 19 Jun 2019 19:14:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200366E454
 for <freedreno@lists.freedesktop.org>; Wed, 19 Jun 2019 19:14:17 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id s4so568246uad.7
 for <freedreno@lists.freedesktop.org>; Wed, 19 Jun 2019 12:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ib3Elwu0KclQyP3cycuxmXbQ4naSfm0BlMVLX1InLZw=;
 b=oXSP6njt0CzgycQ7LmMQ37s8PgKnj6RVh+FL2GgLE1/vJVGGkqsXTxEQRKqEBDujrc
 kEDiJIMm7Sjq+PQgU1Vv2Gk5macL0H4HDMkD/a1H6VJy6dUU2UbUiktH35jhkhA1vCU7
 iz8RBKAClkYGA7J6IHn3OpkZXCbEGFH9IP+i0gydJd1Ode+fZ9oKJFpPFHOXJUuPVZFB
 kjT6I9MYQiG36GP/EnbfmuLjG1vnB32hob+vNWoAPCCNxbWfux6INV0v9+WFiAbwIoIq
 ehp1cqiLqxm3O/Ti5vfm/itR26wFw5InzrfdDX+ldNEnx2Q1HezuQtND8hZFEM5bS2jo
 gpDQ==
X-Gm-Message-State: APjAAAXLmrKMOdS+bwJfOoSQVwPD26oq8w5/0Xrulx4kshcApCOo/iJj
 HDSw1lvF8zxruFdT2ZMGQPOdBjtL8kBlFv+8+CMKUw==
X-Google-Smtp-Source: APXvYqyxcxfNAKPtYBJIxPkPHt0N6GlX0+4BE9chztdrfnz3ArVj+bC8e0pV1rbSPnaIfA8/IDzzUNCrvkt+8J5W/rg=
X-Received: by 2002:ab0:7384:: with SMTP id l4mr5662598uap.8.1560971656192;
 Wed, 19 Jun 2019 12:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190619161913.102998-1-natechancellor@gmail.com>
In-Reply-To: <20190619161913.102998-1-natechancellor@gmail.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 19 Jun 2019 15:13:40 -0400
Message-ID: <CAMavQKK-yyrSBR0rD8+aXqNhgojzkSVpe=AE3EvUFxMcfcmE6A@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ib3Elwu0KclQyP3cycuxmXbQ4naSfm0BlMVLX1InLZw=;
 b=QQ6gJxUTW/Vjrclz3KenY0TkBWCxnFk+KURlFWhpls7ntpL6pJ8MX2SdeFYx4Aklq/
 DudSWR/uOS3VYS3IlVIGvEDRduFT3XEv9OhRdMAxyhFjtml2fkV2Bm56Ki4BPjlTnvc7
 mLTwzTOaXr2svneSWQkzb82jUkoP65Y38rQWPtAOoe+1sUAAgBkLsPlkUJIt2f3aq8wv
 xE+N8bn0d0K1xrUZ6D2A0xJ9LDspwtWJ/xUYjpBwRX1rzQ2ifxV9fzblurIKhBrnKW3t
 CsKqx/mwrD5iLFKKt8QTv0uISIziU2OSUkDk6tu4AqBYedKvQ5tO25TOfFkEeEhkcsLz
 e9Kw==
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Add parentheses to quirks
 check in dsi_phy_hw_v3_0_lane_settings
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
Cc: kbuild test robot <lkp@intel.com>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux@googlegroups.com, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MTkgUE0gTmF0aGFuIENoYW5jZWxsb3IKPG5hdGVj
aGFuY2VsbG9yQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDbGFuZyB3YXJuczoKPgo+IGRyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYzo4MDo2OiB3YXJuaW5nOiBsb2dpY2Fs
IG5vdCBpcwo+IG9ubHkgYXBwbGllZCB0byB0aGUgbGVmdCBoYW5kIHNpZGUgb2YgdGhpcyBiaXR3
aXNlIG9wZXJhdG9yCj4gWy1XbG9naWNhbC1ub3QtcGFyZW50aGVzZXNdCj4gICAgICAgICBpZiAo
IXBoeS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlSSykgewo+ICAg
ICAgICAgICAgIF4gICAgICAgICAgICAgICAgIH4KPiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9w
aHkvZHNpX3BoeV8xMG5tLmM6ODA6Njogbm90ZTogYWRkIHBhcmVudGhlc2VzCj4gYWZ0ZXIgdGhl
ICchJyB0byBldmFsdWF0ZSB0aGUgYml0d2lzZSBvcGVyYXRvciBmaXJzdAo+ICAgICAgICAgaWYg
KCFwaHktPmNmZy0+cXVpcmtzICYgVjNfMF8wXzEwTk1fT0xEX1RJTUlOR1NfUVVJUkspIHsKPiAg
ICAgICAgICAgICBeCj4gICAgICAgICAgICAgICggICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICkKPiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3Bo
eV8xMG5tLmM6ODA6Njogbm90ZTogYWRkIHBhcmVudGhlc2VzCj4gYXJvdW5kIGxlZnQgaGFuZCBz
aWRlIGV4cHJlc3Npb24gdG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcKPiAgICAgICAgIGlmICghcGh5
LT5jZmctPnF1aXJrcyAmIFYzXzBfMF8xME5NX09MRF9USU1JTkdTX1FVSVJLKSB7Cj4gICAgICAg
ICAgICAgXgo+ICAgICAgICAgICAgICggICAgICAgICAgICAgICAgKQo+IDEgd2FybmluZyBnZW5l
cmF0ZWQuCj4KPiBBZGQgcGFyZW50aGVzZXMgYXJvdW5kIHRoZSBiaXR3aXNlIEFORCBzbyBpdCBp
cyBldmFsdWF0ZWQgZmlyc3QgdGhlbgo+IG5lZ2F0ZWQuCj4KPiBGaXhlczogM2RiYmY4ZjA5ZTgz
ICgiZHJtL21zbS9kc2k6IEFkZCBvbGQgdGltaW5ncyBxdWlyayBmb3IgMTBubSBwaHkiKQo+IExp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvNTQ3CgpUaGlzIGxp
bmsgaXMgYnJva2VuLCBjb3VsZCB5b3UgcGxlYXNlIGZpeCBpdCB1cD8KClRoZSByZXN0IGlzOgpS
ZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CgoKCj4gUmVwb3J0ZWQtYnk6
IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBKZWZmcmV5
IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4g
Q2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL3BoeS9kc2lfcGh5XzEwbm0uYwo+IGluZGV4IGViMjg5MzdmNGIzNC4uNDc0MDNkNGYyZDI4
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0u
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYwo+IEBA
IC03Nyw3ICs3Nyw3IEBAIHN0YXRpYyB2b2lkIGRzaV9waHlfaHdfdjNfMF9sYW5lX3NldHRpbmdz
KHN0cnVjdCBtc21fZHNpX3BoeSAqcGh5KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHR4X2RjdHJsW2ldKTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgaWYgKCFwaHktPmNmZy0+cXVp
cmtzICYgVjNfMF8wXzEwTk1fT0xEX1RJTUlOR1NfUVVJUkspIHsKPiArICAgICAgIGlmICghKHBo
eS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlSSykpIHsKPiAgICAg
ICAgICAgICAgICAgLyogVG9nZ2xlIEJJVCAwIHRvIHJlbGVhc2UgZnJlZXplIEkvMCAqLwo+ICAg
ICAgICAgICAgICAgICBkc2lfcGh5X3dyaXRlKGxhbmVfYmFzZSArIFJFR19EU0lfMTBubV9QSFlf
TE5fVFhfRENUUkwoMyksIDB4MDUpOwo+ICAgICAgICAgICAgICAgICBkc2lfcGh5X3dyaXRlKGxh
bmVfYmFzZSArIFJFR19EU0lfMTBubV9QSFlfTE5fVFhfRENUUkwoMyksIDB4MDQpOwo+IC0tCj4g
Mi4yMi4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

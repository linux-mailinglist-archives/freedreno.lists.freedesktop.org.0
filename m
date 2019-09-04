Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0AA85B3
	for <lists+freedreno@lfdr.de>; Wed,  4 Sep 2019 16:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B60889B20;
	Wed,  4 Sep 2019 14:39:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F018689C14
 for <freedreno@lists.freedesktop.org>; Wed,  4 Sep 2019 14:39:23 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id f12so27212109iog.12
 for <freedreno@lists.freedesktop.org>; Wed, 04 Sep 2019 07:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1mnEvqqsMfrK7oL7Uo1VI9bT2jioMINXAPrOrRKIiH0=;
 b=loDolxlEKl36i6raRnSKCr7Xl0dQv24L5inlYGKADNzgoPHyfZ5qACRNDggXUoRIi8
 uSPUuDASloQUQVDunejFJrWKkVPawGkxV8j/Ly20kSBf5rG3x1ZApxIX68blphfzblOM
 m4LbBmHR1Sylwzd6LM09diiiRfz9wqZPB1W0Xy6/ZnO5q+Kxf7/k64wLU1DCyNJBLX+R
 FPD8fun/mvpTDZNhjqkBiroGZXbPEOiWJdafP8EJxhEo5MpVsb1InE5m4KIRCrsjijb/
 0YMBeWVdpMjq2zNYntZGrA4gqA9PoLJCQqofMrnOvZ9rwG8Ffey0Lm6qZI5nCLpDy+9m
 s/+g==
X-Gm-Message-State: APjAAAWqPAkY/LXg0tiCuBXkxvfDb/eEQYVQb4nPWr0houq+3ogZspjl
 dKJnp8VRUuI75BpCr1EwgXlnn9BDL2EN3YUHpDpn8g==
X-Google-Smtp-Source: APXvYqxC4pZPXlChU7BDj+xkfjSh4RHjc+ZGDkCjN1N8VL7K8GYO/5SDMvGIxyFM3p8+/UPlYvDKMHKg8ITPq0yy6tU=
X-Received: by 2002:a5d:8d19:: with SMTP id p25mr37639323ioj.247.1567607963327; 
 Wed, 04 Sep 2019 07:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190904112653.22452-1-festevam@gmail.com>
 <CAP71Wjy3yR4vx-0e4E=EOAeKNaCp0KLyZaYyzRfRk0XefOBJFA@mail.gmail.com>
In-Reply-To: <CAP71Wjy3yR4vx-0e4E=EOAeKNaCp0KLyZaYyzRfRk0XefOBJFA@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 4 Sep 2019 07:39:11 -0700
Message-ID: <CAJs_Fx7uYg_qFv1V=-Mt2X+8-WFV==cFmJEdh1cQPOuzUMdmBQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1mnEvqqsMfrK7oL7Uo1VI9bT2jioMINXAPrOrRKIiH0=;
 b=RHWFxoHuWz2c4xr8AV4IKHd/57vBcacJUJLUn57JUPWFRD9gg4UNDc6IMWXrqzqy4p
 4LVK8gP+DuCVhO7cOARO2rfGSB8RGG2/nneL9hVlegItN1ghJQlWdgFVUiwad0bBfCRy
 1CLbkDemHXoVYosFwGRRPBMKIDKn1tO+U0QxQ=
Subject: Re: [Freedreno] [PATCH] qcom: Add firmware files for Adreno A200
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
Cc: freedreno <freedreno@lists.freedesktop.org>, jonathan@marek.ca,
 Josh Boyer <jwboyer@kernel.org>, Linux Firmware <linux-firmware@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, cphealy@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCA1OjA5IEFNIE5pY29sYXMgRGVjaGVzbmUKPG5pY29sYXMu
ZGVjaGVzbmVAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBoaSBGYWJpbywKPgo+IE9uIFdlZCwgU2Vw
IDQsIDIwMTkgYXQgMToyNyBQTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdy
b3RlOgo+ID4KPiA+IEFkZCBmaXJtd2FyZSBmaWxlcyBmb3IgQWRyZW5vIEEyMDAuCj4gPgo+ID4g
VGhlc2UgZmlybXdhcmUgZmlsZXMgYXJlIG5lZWRlZCBmb3IgcnVubmluZyB0aGUgYWRyZW5vIGtl
cm5lbAo+ID4gZHJpdmVyIG9uIGkuTVg1MSBhbmQgaS5NWDUzIFNvQ3MuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+ID4gLS0tCj4gPiAg
V0hFTkNFICAgICAgICAgICAgIHwgICAyICsrCj4gPiAgcWNvbS95YW1hdG9fcGZwLmZ3IHwgQmlu
IDAgLT4gMTE1NiBieXRlcwo+ID4gIHFjb20veWFtYXRvX3BtNC5mdyB8IEJpbiAwIC0+IDkyMjAg
Ynl0ZXMKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBxY29tL3lhbWF0b19wZnAuZncKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcWNv
bS95YW1hdG9fcG00LmZ3Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL1dIRU5DRSBiL1dIRU5DRQo+ID4g
aW5kZXggYThlYzYyOC4uNWU0NmQzMyAxMDA2NDQKPiA+IC0tLSBhL1dIRU5DRQo+ID4gKysrIGIv
V0hFTkNFCj4gPiBAQCAtNDQxOCw2ICs0NDE4LDggQEAgRmlsZTogcWNvbS9hNTMwX3phcC5iMDAK
PiA+ICBGaWxlOiBxY29tL2E1MzBfemFwLmIwMQo+ID4gIEZpbGU6IHFjb20vYTUzMF96YXAuYjAy
Cj4gPiAgRmlsZTogcWNvbS9hNTMwX3phcC5tZHQKPiA+ICtGaWxlOiBxY29tL3lhbWF0b19wZnAu
ZncKPiA+ICtGaWxlOiBxY29tL3lhbWF0b19wbTQuZncKPgo+IFdoZXJlIGRpZCB5b3UgZ2V0IHRo
ZXNlIGZpbGVzIGZyb20gaW4gdGhlIGZpcnN0IHBsYWNlPyBPbiB3aGljaAo+IGRldmljZXMgZG8g
eW91IGV4cGVjdCB0aGVzZSBmaXJtd2FyZSBmaWxlcyB0byB3b3JrPyBXZSB3ZXJlIHJlY2VudGx5
Cj4gZGlzY3Vzc2luZyBob3cgdG8gc3RydWN0dXJlIC9saWIvZmlybXdhcmUvcWNvbSBtb3JlIGNh
cmVmdWxseS4gQW5kIHRoZQo+IGdlbmVyYWwgY29uc2Vuc3VzIHRoYXQgd2UgcmVhY2hlZCB3aXRo
IFJvYiBDLiBhbmQgQmpvcm4gaXMgdGhhdCBpZiBhCj4gZmlybXdhcmUgaXMgZXhwZWN0ZWQgdG8g
d29yayBvbiBhIHNwZWNpZmljIGRldmljZSAobWF5YmUgaXQgaXMgc2lnbmVkKQo+IGl0IHNob3Vs
ZCBiZSBwbGFjZWQgaW4gL2xpYi9maXJtd2FyZS9xY29tLzxkZXZpY2U+IGFuZCBpZiBpdCdzCj4g
dW5zaWduZWQgYW5kIGNhbiBiZSB1c2VkIG9uIHNldmVyYWwgZGV2aWNlcyBiYXNlZCBvbiB0aGUg
c2FtZSBTb0MgKGRldgo+IGJvYXJkcywgLi4pIHRoZW4gaXQgc2hvdWxkIGJlIC9saWIvZmlybXdh
cmUvcWNvbS88U09DPi4KCmZ3aXcsIHRoZSBwZnAvcG00IGZ3IChsYXRlciByZXBsYWNlZCBieSBz
cWUpIGFyZSBub3Qgc2lnbmVkLCBzbwovbGliL2Zpcm13YXJlL3Fjb20vIGxvY2F0aW9uIGlzIGZp
bmUgZm9yIHRoZXNlCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5v

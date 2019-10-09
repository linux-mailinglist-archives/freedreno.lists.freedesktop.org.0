Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BFD0705
	for <lists+freedreno@lfdr.de>; Wed,  9 Oct 2019 08:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5E56E8D5;
	Wed,  9 Oct 2019 06:05:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2EA6E8D5;
 Wed,  9 Oct 2019 06:05:23 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 3A03A3E996;
 Wed,  9 Oct 2019 06:05:21 +0000 (UTC)
Date: Wed, 9 Oct 2019 02:05:20 -0400
From: Brian Masney <masneyb@onstation.org>
To: Stephen Boyd <sboyd@kernel.org>
Message-ID: <20191009060520.GA14506@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-5-masneyb@onstation.org>
 <20191009022131.604B52070B@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009022131.604B52070B@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1570601122;
 bh=axje7sL3QyYCSKa+ojdsfnQjsAnMmmRKJzoEmQLtvCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PeJGKH/zxhgEi7hoksppuXNSbE7Ofwy1/81LxzfdzpBr52IAUIdv6MC8U6uglf8hP
 ZTGzVZuRgoCOgfBJaW+QiPEPCF0QLcXgrYPIGbppfHUr5VVcHFqiwxR8h637DHUG3X
 Ry0LDIc+l/e4q6Xoow9Tj5U/2v4bmjAKZUJpozLo=
Subject: Re: [Freedreno] [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add
 HDMI nodes
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, a.hajda@samsung.com, robdclark@gmail.com,
 Laurent.pinchart@ideasonboard.com, daniel@ffwll.ch, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDc6MjE6MzBQTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdy
b3RlOgo+IFF1b3RpbmcgQnJpYW4gTWFzbmV5ICgyMDE5LTEwLTA2IDE4OjQ1OjA4KQo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvcWNvbS1tc204OTc0LmR0c2kKPiA+IGluZGV4IDdmYzIzZTQyMmNjNS4uYWYwMmVh
Y2UxNGUyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LmR0
c2kKPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpCj4gPiBAQCAt
MTMzNSw2ICsxMzQyLDc3IEBACj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNs
b2NrcyA9IDwmbW1jYyBNRFNTX0FIQl9DTEs+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjbG9jay1uYW1lcyA9ICJpZmFjZSI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICB9Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaGRtaTogaGRtaS10eEBmZDky
MjEwMCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNh
YmxlZCI7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAicWNvbSxoZG1pLXR4LTg5NzQiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHhmZDkyMjEwMCAweDM1Yz4sCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwweGZjNGI4MDAwIDB4NjBmMD47Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJlZy1uYW1lcyA9ICJjb3JlX3BoeXNpY2FsIiwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInFmcHJvbV9waHlzaWNhbCI7Cj4g
Cj4gSXMgdGhpcyB0aGUgcWZwcm9tICJ1bmNvcnJlY3RlZCIgcGh5c2ljYWwgYWRkcmVzcz8gSWYg
c28sIHdoeSBjYW4ndCB0aGlzCj4gbm9kZSB1c2UgYW4gbnZtZW0gdG8gcmVhZCB3aGF0ZXZlciBp
dCBuZWVkcyBvdXQgb2YgdGhlIHFmcHJvbT8KClRoZSBNU00gSERNSSBjb2RlIGlzIGNvbmZpZ3Vy
ZWQgdG8gbG9vayBmb3IgdGhpcyByZWctbmFtZSBoZXJlOgoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5j
I0w1ODIKClRoZXJlIGlzIGEgcWNvbSxxZnByb20gY29uZmlndXJlZCBmb3IgdGhpcyBib2FyZCBp
biBEVFMsIGhvd2V2ZXIgaXRzIGF0CmEgZGlmZmVyZW50IGFkZHJlc3MgcmFuZ2UsIHNvIG1heWJl
IHRoZXJlIGFyZSBtdWx0aXBsZSBxZnByb21zPwoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSNM
NDI0Cgptc204OTk2LmR0c2kgaGFzIHRoZSBzYW1lIHN0eWxlIG9mIGNvbmZpZ3VyYXRpb246Cgpo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcWNvbS9tc204OTk2LmR0c2kjTDk1NgpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9tc204OTk2LmR0
c2kjTDE3MzYKCkJyaWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVk
cmVubw==

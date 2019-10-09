Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921EFD1B93
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2019 00:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373886EA59;
	Wed,  9 Oct 2019 22:21:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B82A6EA59
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2019 22:21:08 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t84so3161213oih.10
 for <freedreno@lists.freedesktop.org>; Wed, 09 Oct 2019 15:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dE2a4Z4lXPuGGmpfVMZQR36XbB7tSgoxGtELVA7jbxI=;
 b=Zfn5nuODOfOqFRUg+W4MJ28tFqiEKg/w2kR7x7hd052YJBAVN3PPVVbnPVt8c+atW5
 05gVYcoz2RNXRoPWDuRCFaFpmbXbCY91Dde9nROJ0PfVMCmhW6i6CVX5M6RVfQNgYIR2
 ZijbEe5j4YO4GCNoCXzjQzIh/XzhOaXd/bp3aUdlBz9iZ8wtV3dUEVxsR9LvLLI38Php
 vvwDM/Pf4JfvMPB+pHAv67FySGrNKbdFrqtFOM/oH9MDDKcui6vJnpDhLOG/JkJbnadC
 JQsLkdHAT3BpcaQ+VDBsI4LadY8VDUNTR8jIoY7kz8Pr3ImIClvKYAHi6CMmmCJIo34Z
 n+dw==
X-Gm-Message-State: APjAAAUwcyY9drYaAVLrg+KnBEiw4vmeg4HlU1Z/2ReBTe+8J4vKBfzb
 OPU3JG9qHPiPLiOJcR1fCFmkMUpjyrq+lYWUEyfv0g==
X-Google-Smtp-Source: APXvYqxZ8tmU1al9WeQDUSkxISPtGig+OBzBdxC+nV+lPvUajS7ItruLNHqHHF/s6KsQ3cjo8125dbwbpNeUimnrJQ4=
X-Received: by 2002:aca:e046:: with SMTP id x67mr4268077oig.101.1570659667984; 
 Wed, 09 Oct 2019 15:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20181116184238.170034-1-sean@poorly.run>
 <20181116184238.170034-17-sean@poorly.run>
In-Reply-To: <20181116184238.170034-17-sean@poorly.run>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Oct 2019 00:20:56 +0200
Message-ID: <CAKMK7uEx2fL69jPGXVpQhhcj8Q8zEzb3ogCv-uVyGrX3QYFeWQ@mail.gmail.com>
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dE2a4Z4lXPuGGmpfVMZQR36XbB7tSgoxGtELVA7jbxI=;
 b=Re1yOGYe6pPM8HE/LlFTxrSDK2/zgXd0OIeCnpEpEZdLx22d/fC4wfAmETSAcCsaxG
 Q2CznxPJLfKj0UJ8rnu5QjZgmIuvTFiVMy4bctrd3vdkYeWq20CcZiZGKSO/5Qp4Cmmn
 v0amAw8IpzLiXymgE7aGFIB74nQkOil/Cqpck=
Subject: Re: [Freedreno] [PATCH v2 16/24] drm/msm: dpu: Add modeset lock
 checks where applicable
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
Cc: Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTYsIDIwMTggYXQgNzo0NCBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4KPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPgo+
IEFkZCBtb2Rlc2V0IGxvY2sgY2hlY2tzIHRvIGZ1bmN0aW9ucyB0aGF0IGNvdWxkIGJlIGNhbGxl
ZCBvdXRzaWRlIHRoZQo+IGNvcmUgYXRvbWljIHN0YWNrLgo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAt
IE5vbmUKPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jIHwgMiAr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgIHwgMSArCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9jcnRjLmMKPiBpbmRleCBhMDA4YTg3YTgxMTMuLmNkMGEwYmVhNDMzNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwo+IEBAIC0yODQsNiAr
Mjg0LDggQEAgZW51bSBkcHVfaW50Zl9tb2RlIGRwdV9jcnRjX2dldF9pbnRmX21vZGUoc3RydWN0
IGRybV9jcnRjICpjcnRjKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gSU5URl9NT0RFX05PTkU7
Cj4gICAgICAgICB9Cj4KPiArICAgICAgIFdBUk5fT04oIWRybV9tb2Rlc2V0X2lzX2xvY2tlZCgm
Y3J0Yy0+bXV0ZXgpKTsKPiArCj4gICAgICAgICAvKiBUT0RPOiBSZXR1cm5zIHRoZSBmaXJzdCBJ
TlRGX01PREUsIGNvdWxkIHRoZXJlIGJlIG11bHRpcGxlIHZhbHVlcz8gKi8KPiAgICAgICAgIGRy
bV9mb3JfZWFjaF9lbmNvZGVyX21hc2soZW5jb2RlciwgY3J0Yy0+ZGV2LCBjcnRjLT5zdGF0ZS0+
ZW5jb2Rlcl9tYXNrKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZHB1X2VuY29kZXJfZ2V0X2lu
dGZfbW9kZShlbmNvZGVyKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5j
Cj4gaW5kZXggNjQxMzRkNjE5NzQ4Li41MTA0ZmMwMTE0N2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCj4gQEAgLTM1OCw2ICszNTgsNyBAQCB2b2lkIGRwdV9r
bXNfZW5jb2Rlcl9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+ICAgICAgICAg
aWYgKGZ1bmNzICYmIGZ1bmNzLT5jb21taXQpCj4gICAgICAgICAgICAgICAgIGZ1bmNzLT5jb21t
aXQoZW5jb2Rlcik7Cj4KPiArICAgICAgIFdBUk5fT04oIWRybV9tb2Rlc2V0X2lzX2xvY2tlZCgm
ZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4KSk7Cj4gICAgICAgICBkcm1fZm9yX2Vh
Y2hfY3J0YyhjcnRjLCBkZXYpIHsKPiAgICAgICAgICAgICAgICAgaWYgKCEoY3J0Yy0+c3RhdGUt
PmVuY29kZXJfbWFzayAmIGRybV9lbmNvZGVyX21hc2soZW5jb2RlcikpKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwoKSSdtIGZhaXJseSBzdXJlIHRoaXMgaXMgY2FsbGVkIGlu
IHRoZSBhdG9taWNfY29tbWl0IHBhdGgsIGFuZCBpbiB0aGVyZQp5b3UgbWlnaHQgbm90IGFjdHVh
bGx5IGhvbGQgdGhlc2UgbG9ja3MgKGlmIHlvdSBkbyBhIG5vbmJsb2NraW5nCm1vZGVzZXQpLgoK
VGhlIGxvY2tpbmcgcnVsZXMgZm9yIC0+c3RhdGUgYXJlIHByZXR0eSBmdW46IEVpdGhlciBob2xk
IHRoZSBsb2NrLCBvcgpiZSBpbiBhdG9taWMgY29tbWl0LiBJbiB0aGUgbGF0ZXIgY2FzZSBhdG9t
aWMgaGVscGVycycgY29tbWl0IG9yZGVyaW5nCmd1YXJhbnRlZXMgdGhhdCB5b3UgY2FuIHNhZmVs
eSBhY2Nlc3MgLT5zdGF0ZSAoYnV0IHJlYWQtb25seSBvbmx5KQp3aXRob3V0IGhvZGxpbmcgYW55
IGxvY2tzLiBZb3UgbWlnaHQgd2FudCB0byByZXZlcnQuCgpEb24ndCBhc2sgd2h5IEkgc3R1bWJs
ZWQgb3ZlciB0aGlzLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZy
ZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

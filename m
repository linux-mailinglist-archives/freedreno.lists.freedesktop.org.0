Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1048C1FB5D
	for <lists+freedreno@lfdr.de>; Wed, 15 May 2019 22:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B459F89194;
	Wed, 15 May 2019 20:08:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923E789190
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2019 20:08:14 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id g187so758527vsc.8
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2019 13:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=v48zyXjM+0T7zugWwKkaSHzGROBxp5MaD7k3bo3xnQA=;
 b=MgNf8SanaGJdsf5XFKYNnOGh1X6f1qUP1lNEJkj7UBY9ShMTyPQs/EKtIaKMOP3OHh
 zU76S66fWbPx+J3leYW1rBbWKByTo/uX4BQqyo0703ihEMrkRhCVUH/kaJUANv4m00U+
 /cbcCB1YzkjT5t98nz2wQqwgD88DfphKWsw/JYeesG43tOJ6+cVLmuXAxroDpEJlKZbK
 Ug89FKqFaw9sbetf+AAW7F5FkCeDSqJ4VwNP5+MyaI8P/iJajgQbeJZBJD/2jMiG9hFl
 TtmXOQi7l44p2GFFjHg4JaNy2f+4AslGMqjv0lw3sCZc9gdcV4BNy0sOoyS0Ot4ymmE6
 xKcQ==
X-Gm-Message-State: APjAAAUcOkiDUtnk10dGOMC+qLDmrZw/gl7gn2W2qtSr9Pv3K23MAJ+V
 AgsizO7LHdBpfSOVORmv6XztAZPLMKGmVwkp/kHHzA==
X-Google-Smtp-Source: APXvYqysnnQ3i41oD1FSw+qj90+S478GDLPURo5Z3hBgXdt8GVd806sYNUFVdgQN0vWea5eMtp7/yipVR53sFrgmoW8=
X-Received: by 2002:a67:d806:: with SMTP id e6mr5468439vsj.43.1557950893516;
 Wed, 15 May 2019 13:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190515170104.155525-1-sean@poorly.run>
 <20190515193904.GE24137@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20190515193904.GE24137@jcrouse1-lnx.qualcomm.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 15 May 2019 16:07:37 -0400
Message-ID: <CAMavQKKxUDX-tOLULDfZxcizysWOr63VvBBT8fNa-VB=v8jvVQ@mail.gmail.com>
To: Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=v48zyXjM+0T7zugWwKkaSHzGROBxp5MaD7k3bo3xnQA=;
 b=dRy6jUWevG+0XhP6OTr7k/DY51m5lCsFaJkkZcm1nGHHVfpqk2yboQlaciHA6UqGAY
 1WisHud/8P4Ed6MmG1zJgV3IgVbGXq+qg+WBPoOYK6oM3vlxe8xPoAEX16vq/wgvc4bE
 CFf8sukd70kKuRBXsCmfyS+bW6Vm7++aLljb4FnpBCxa+g7wwBfbjCrwqea5DpK9MSQ3
 zVzUiXmHgLyONDaC+OjZs5+sENfqNsD0qGLEvTEIqd8yYAqUNPh2W4e6xfuGrBZFZsk2
 YpN5iGd3qM265ObrDKxl2PwAs0VER3ysmq3T+RBOiyt583tGgm1pJghYmSHKWz/TywNM
 DV7A==
Subject: Re: [Freedreno] [PATCH] drm/msm: Upgrade gxpd checks to
 IS_ERR_OR_NULL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMzozOSBQTSBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDE1LCAyMDE5IGF0IDAxOjAwOjUy
UE0gLTA0MDAsIFNlYW4gUGF1bCB3cm90ZToKPiA+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxA
Y2hyb21pdW0ub3JnPgo+ID4KPiA+IGRldl9wbV9kb21haW5fYXR0YWNoX2J5X25hbWUoKSBjYW4g
cmV0dXJuIE5VTEwsIHNvIHdlIHNob3VsZCBjaGVjayBmb3IKPiA+IHRoYXQgY2FzZSB3aGVuIHdl
J3JlIGFib3V0IHRvIGRlcmVmZXJlbmNlIGd4cGQuCj4gPgo+ID4gRml4ZXM6IDkzMjVkNDI2NmFm
ZCAoImRybS9tc20vZ3B1OiBBdHRhY2ggdG8gdGhlIEdQVSBHWCBwb3dlciBkb21haW4iKQo+ID4g
Q2M6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Cj4gPiBDYzogUm9iIENs
YXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVs
IDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4KPiBSZXZpZXdlZC1ieTogSm9yZGFuIENyb3VzZSA8
amNyb3VzZUBjb2RlYXVvcm9yYS5vcmc+Cj4KClRoYW5rcyBmb3IgdGhlIHJldmlldywgSSd2ZSBh
cHBsaWVkIGl0IHRvIC1taXNjLW5leHQtZml4ZXMgd2l0aCB0aGUKb3RoZXIgbXNtIGZpeGVzIGZv
ciA1LjIKCgpTZWFuCgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4
eF9nbXUuYyB8IDYgKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTZ4eF9nbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMK
PiA+IGluZGV4IDkxNTVkYWZhZTJhOTAuLjM4ZTJjZmE5Y2VjNzkgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4gPiBAQCAtNzQ3LDcgKzc0Nyw3IEBAIGludCBh
Nnh4X2dtdV9yZXN1bWUoc3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSkKPiA+ICAgICAgICAqIHdp
bGwgbWFrZSBzdXJlIHRoYXQgdGhlIHJlZmNvdW50aW5nIGlzIGNvcnJlY3QgaW4gY2FzZSB3ZSBu
ZWVkIHRvCj4gPiAgICAgICAgKiBicmluZyBkb3duIHRoZSBHWCBhZnRlciBhIEdNVSBmYWlsdXJl
Cj4gPiAgICAgICAgKi8KPiA+IC0gICAgIGlmICghSVNfRVJSKGdtdS0+Z3hwZCkpCj4gPiArICAg
ICBpZiAoIUlTX0VSUl9PUl9OVUxMKGdtdS0+Z3hwZCkpCj4gPiAgICAgICAgICAgICAgIHBtX3J1
bnRpbWVfZ2V0KGdtdS0+Z3hwZCk7Cj4gPgo+ID4gIG91dDoKPiA+IEBAIC04NjMsNyArODYzLDcg
QEAgaW50IGE2eHhfZ211X3N0b3Aoc3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSkKPiA+ICAgICAg
ICAqIGRvbWFpbi4gVXN1YWxseSB0aGUgR01VIGRvZXMgdGhpcyBidXQgb25seSBpZiB0aGUgc2h1
dGRvd24gc2VxdWVuY2UKPiA+ICAgICAgICAqIHdhcyBzdWNjZXNzZnVsCj4gPiAgICAgICAgKi8K
PiA+IC0gICAgIGlmICghSVNfRVJSKGdtdS0+Z3hwZCkpCj4gPiArICAgICBpZiAoIUlTX0VSUl9P
Ul9OVUxMKGdtdS0+Z3hwZCkpCj4gPiAgICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0X3N5bmMo
Z211LT5neHBkKTsKPiA+Cj4gPiAgICAgICBjbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZShnbXUt
Pm5yX2Nsb2NrcywgZ211LT5jbG9ja3MpOwo+ID4gQEAgLTEyMzQsNyArMTIzNCw3IEBAIHZvaWQg
YTZ4eF9nbXVfcmVtb3ZlKHN0cnVjdCBhNnh4X2dwdSAqYTZ4eF9ncHUpCj4gPgo+ID4gICAgICAg
cG1fcnVudGltZV9kaXNhYmxlKGdtdS0+ZGV2KTsKPiA+Cj4gPiAtICAgICBpZiAoIUlTX0VSUihn
bXUtPmd4cGQpKSB7Cj4gPiArICAgICBpZiAoIUlTX0VSUl9PUl9OVUxMKGdtdS0+Z3hwZCkpIHsK
PiA+ICAgICAgICAgICAgICAgcG1fcnVudGltZV9kaXNhYmxlKGdtdS0+Z3hwZCk7Cj4gPiAgICAg
ICAgICAgICAgIGRldl9wbV9kb21haW5fZGV0YWNoKGdtdS0+Z3hwZCwgZmFsc2UpOwo+ID4gICAg
ICAgfQo+ID4gLS0KPiA+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENo
cm9taXVtIE9TCj4gPgo+Cj4gLS0KPiBUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIElu
Yy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCj4gYSBMaW51eCBGb3VuZGF0aW9u
IENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9mcmVlZHJlbm8=

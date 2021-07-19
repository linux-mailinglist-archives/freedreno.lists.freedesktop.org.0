Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A13CD668
	for <lists+freedreno@lfdr.de>; Mon, 19 Jul 2021 16:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31A76E15F;
	Mon, 19 Jul 2021 14:17:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB566E15A;
 Mon, 19 Jul 2021 14:17:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso12962177wmh.4; 
 Mon, 19 Jul 2021 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YxOE06iQfRI1CKUDbw3hGIS+VF1Rl+wYqbGsSCljupo=;
 b=OBWA7ulibxt21SOpQyH/zVYF2pcgZthfkZb9IplbXvKgG0VcXJh8EeSyOlzKNTeJGQ
 B5JmneMtLahn0ECNMrmmGF72WH4uf9uQ5XEtytSURVxOgaT7KUm96gRWL8h4fs3V2zpL
 qTzb2BEnzqQbgfReCpE6F1T3kOLPAdfc619qlzBY6JOmUhCO2yivQOTD982zNvZVxFOU
 dolpjs/JEAuAJpflASUHTYRn58qSTCeCMTDnkCccqx14a9knnUZoh6+LsrSq0GqY0X9o
 Eo8KLruVrE0J7S+dXxr1lrFTdpaHIXTQXWJxmguCZ9Off5ZlPx/zBC11zRi/eZG36F4e
 fUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YxOE06iQfRI1CKUDbw3hGIS+VF1Rl+wYqbGsSCljupo=;
 b=peegCYZwuxsdNeOFsGWHYukny1qvXBHoPHR4ILTacI/ARVOs6SxBQ5Vwtc7XM0pjX0
 063jP/8k/JzFHXv9OFLPMx2sy4dHuE7MEfYU6CvHG9iaxmmb8TW9PmBcMPAj+F/sXvIj
 WgQy/JIpsebf9exYkHLqEt3LyL1Xy366MDgSW1JFq9CFbZu7q7P5jyN2VQnhMokvOghi
 q/3dQDlHQf0s2rj/mqa1SpeEUgaYsbPZz4Rqj/ren662iMXjFPRt17ULTX357FJl2jZs
 zYwSxgHdKJQ4uOqci2eO3poG/nb7yr0QfXGCdkRwBHnhnDcmo6SOGc4zlCysqUWny95N
 IsQQ==
X-Gm-Message-State: AOAM530Vijy7tBxtuFpZYqd2wYfX2wqWLULX9l4GrQSfq+4/Fw8Q++Ga
 A4SgLMSzDz3E8TXgs+97JXM7QEOJGiTskxz23Lc=
X-Google-Smtp-Source: ABdhPJxrSDp2zTG19VBXBLjwH7pcVPq3rHmT2XxCL0Xq8iJo5bPZiCVWZLD5AWEcNySNNzptwxQwRJ96/qe0jx7mjhA=
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr32878432wmc.123.1626704234434; 
 Mon, 19 Jul 2021 07:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210717202924.987514-1-robdclark@gmail.com>
 <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
In-Reply-To: <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 Jul 2021 07:21:22 -0700
Message-ID: <CAF6AEGuaxh5FRb6h3aVkUYG7cFCpT6Lb+uuk2R8bmu3hxHs4Aw@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Freedreno] [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm
 scheduler conversion and cleanups
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, Bernard Zhao <bernard@vivo.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTksIDIwMjEgYXQgMTo0MCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAxNy4wNy4yMSB1bSAyMjoy
OSBzY2hyaWViIFJvYiBDbGFyazoKPiA+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9t
aXVtLm9yZz4KPiA+Cj4gPiBDb252ZXJzaW9uIHRvIGdwdV9zY2hlZHVsZXIsIGFuZCBib251cyBy
ZW1vdmFsIG9mCj4gPiBkcm1fZ2VtX29iamVjdF9wdXRfbG9ja2VkKCkKPgo+IE9oIHllcyBwbGVh
c2UhCj4KPiBJZiBJJ20gbm90IGNvbXBsZXRlbHkgbWlzdGFrZW4gdGhhdCB3YXMgdGhlIGxhc3Qg
cHV6emxlIHBpZWNlIG1pc3NpbmcgdG8KPiB1bmlmeSBUVE1zIGFuZCBHRU1zIHJlZmNvdW50IG9m
IG9iamVjdHMuCj4KPiBPbmx5IHByb2JsZW0gaXMgdGhhdCBJIG9ubHkgc2VlIHBhdGNoIDcgYW5k
IDkgaW4gbXkgaW5ib3guIFdoZXJlIGlzIHRoZQo+IHJlc3Q/CgpIbW0sIGxvb2tzIGxpa2UgaXQg
c2hvdWxkIGhhdmUgYWxsIGdvdHRlbiB0byBkcmktZGV2ZWw6CgogIGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDIxLUp1bHkvMzE1NTczLmh0bWwKCm9y
IGlmIHlvdSBwcmVmZXIgcGF0Y2h3b3JrOgoKICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzkyNjgwLwoKQlIsCi1SCgo+IFRoYW5rcywKPiBDaHJpc3RpYW4uCj4KPiA+
Cj4gPiBSb2IgQ2xhcmsgKDExKToKPiA+ICAgIGRybS9tc206IERvY3MgYW5kIG1pc2MgY2xlYW51
cAo+ID4gICAgZHJtL21zbTogU21hbGwgc3VibWl0cXVldWUgY3JlYXRpb24gY2xlYW51cAo+ID4g
ICAgZHJtL21zbTogZHJvcCBkcm1fZ2VtX29iamVjdF9wdXRfbG9ja2VkKCkKPiA+ICAgIGRybTog
RHJvcCBkcm1fZ2VtX29iamVjdF9wdXRfbG9ja2VkKCkKPiA+ICAgIGRybS9tc20vc3VibWl0OiBT
aW1wbGlmeSBvdXQtZmVuY2UtZmQgaGFuZGxpbmcKPiA+ICAgIGRybS9tc206IENvbnNvbGlkYXRl
IHN1Ym1pdCBibyBzdGF0ZQo+ID4gICAgZHJtL21zbTogVHJhY2sgInNlcW5vIiBmZW5jZXMgYnkg
aWRyCj4gPiAgICBkcm0vbXNtOiBSZXR1cm4gRVJSX1BUUigpIGZyb20gc3VibWl0X2NyZWF0ZSgp
Cj4gPiAgICBkcm0vbXNtOiBDb252ZXJzaW9uIHRvIGRybSBzY2hlZHVsZXIKPiA+ICAgIGRybS9t
c206IERyb3Agc3RydWN0X211dGV4IGluIHN1Ym1pdCBwYXRoCj4gPiAgICBkcm0vbXNtOiBVdGls
aXplIGdwdSBzY2hlZHVsZXIgcHJpb3JpdGllcwo+ID4KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW0uYyAgICAgICAgICAgICAgICAgICB8ICAyMiAtLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0v
bXNtL0tjb25maWcgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ICAgZHJpdmVycy9ncHUvZHJt
L21zbS9hZHJlbm8vYTV4eF9kZWJ1Z2ZzLmMgICB8ICAgNCArLQo+ID4gICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jICAgICAgIHwgICA2ICstCj4gPiAgIGRyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E1eHhfcG93ZXIuYyAgICAgfCAgIDIgKy0KPiA+ICAgZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVlbXB0LmMgICB8ICAgNyArLQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jICAgICAgIHwgIDEyICstCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgICAgICAgfCAgIDIgKy0KPiA+ICAgZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHVfc3RhdGUuYyB8ICAgNCArLQo+ID4gICBk
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgICAgIHwgICA2ICstCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgICAgICAgICAgICAgfCAgMzAgKy0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmVuY2UuYyAgICAgICAgICAgICB8ICAzOSAtLS0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmVuY2UuaCAgICAgICAgICAgICB8ICAgMiAt
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jICAgICAgICAgICAgICAgfCAgOTEg
Ky0tLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5oICAgICAgICAgICAgICAg
fCAgMzcgKystCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQuYyAgICAg
ICAgfCAzMDAgKysrKysrKysrKysrLS0tLS0tLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ3B1LmMgICAgICAgICAgICAgICB8ICA1MCArLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dwdS5oICAgICAgICAgICAgICAgfCAgNDEgKystCj4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX3JpbmdidWZmZXIuYyAgICAgICAgfCAgNzAgKysrKy0KPiA+ICAgZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fcmluZ2J1ZmZlci5oICAgICAgICB8ICAxMiArCj4gPiAgIGRyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX3N1Ym1pdHF1ZXVlLmMgICAgICAgfCAgNDkgKysrLQo+ID4gICBpbmNs
dWRlL2RybS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICAgICAgIHwgICAyIC0KPiA+ICAgaW5j
bHVkZS91YXBpL2RybS9tc21fZHJtLmggICAgICAgICAgICAgICAgICB8ICAxMCArLQo+ID4gICAy
MyBmaWxlcyBjaGFuZ2VkLCA0NDAgaW5zZXJ0aW9ucygrKSwgMzU5IGRlbGV0aW9ucygtKQo+ID4K
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJl
bm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K

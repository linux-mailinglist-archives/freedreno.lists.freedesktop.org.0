Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572C3381BF1
	for <lists+freedreno@lfdr.de>; Sun, 16 May 2021 03:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90BD6E471;
	Sun, 16 May 2021 01:21:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41196E471;
 Sun, 16 May 2021 01:21:54 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id h20so1349151plr.4;
 Sat, 15 May 2021 18:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SoLXbgYZkv5FkSbOBiV8Z96V28Oxq+j8zJYbMXZmMqc=;
 b=hN/SsP40Kve4+YaC6v+UM3BsAdoWfzF2EK9+FFS91evn7T9gTIavtbi8+itbSj/TH3
 mQcWwk3qUYsQTY7dU6wyVgk6b517rHM+B8d+fOGXm4+hNkG1l6RFpUOm/AfndPQ1ov48
 TnErTfcMhsxacNL6+8/X+3gGoBG4bZDn0FjHANMnAyZcmXZTblf4STcixI4rtL1RSc1A
 QSLpu5AodvH81M2HsHngW81wOG3eAhk55PTYf3buMPWPPk2me17SsDjWqFKNIgfCVxks
 YcZhna/E2jrIVTUy1vDnRU4EZ0ByaMizDVKSC3U/KjUO91g1ttw4FOTD7T0RyWHGj302
 QP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SoLXbgYZkv5FkSbOBiV8Z96V28Oxq+j8zJYbMXZmMqc=;
 b=qhm+7v5U75MOvI9136ylgi+Pua96fsCdp8hXM4daIRHGr+i+pkgb26DaFEM0KPh2px
 qw+i6aa+qxSTQasNFmKFfadoBC+qdpiuENvzztcF1MsaxlWlXsY1La1e+O+ElMjkhfoT
 ucmx6DCselNrfwXnybbHQs8aw9zc6DQ4FqNPP3jMfGXzqtQC7wn8/SL9tLbkOsV562LY
 gvne3tfF4H1oz5e4feWmOI/i/25fE0EgRqx2DviD2PzSEkktXdMrmJVkWv6CN2AUfjTo
 nfzTHnxkJ1QDGlYlU3HAThEKJebBwTMOsWBpyQ5PBMh72eRrf4AOOrFMeDH1qG8nZqXp
 KCAw==
X-Gm-Message-State: AOAM530Z1o5SfuEIoLP2r5mkbuavM+bSOWQhf7EmWfRVVh8FZDcJ3qHH
 FRQsfdwocrvhzicVEHO2dCZdBkEddSAmSVuBOJg=
X-Google-Smtp-Source: ABdhPJxefDnsWO+LVGNiOiMX/uOXtRC6O8nz0TZcq0ZLx81BswlnwyHgiJCj6DwkzPdHqhCRA77OjRPdybJtCLDVt6Q=
X-Received: by 2002:a17:90b:224e:: with SMTP id
 hk14mr15006501pjb.29.1621128114379; 
 Sat, 15 May 2021 18:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
 <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
From: Arnaud Vrac <rawoul@gmail.com>
Date: Sun, 16 May 2021 03:21:43 +0200
Message-ID: <CAN5H-g7hWgyqtFbUpzesyKXmWr=FtFtXBKDSbCKx+1dUjxP10w@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 5/6] drm/msm/dpu: drop unused
 lm_max_width from RM
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKTGUgZGltLiAxNiBtYWkgMjAyMSDDoCAwMDo1OCwgRG1pdHJ5IEJhcnlzaGtv
dgo8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPiBhIMOpY3JpdCA6Cj4KPiBObyBjb2RlIHVz
ZXMgbG1fbWF4X3dpZHRoIGZyb20gcmVzb3VyY2UgbWFuYWdlciwgc28gZHJvcCBpdC4KCkkgaGF2
ZSBhIHBlbmRpbmcgcGF0Y2ggd2hpY2ggdXNlcyB0aGlzIHZhbHVlIHRvIHByb3Blcmx5IGRldGVy
bWluZSB0aGUKbnVtYmVyIG9mIExNcyB0byB1c2UgaW4gdGhlIHRvcG9sb2d5LiBDdXJyZW50bHkg
dGhlIGNvZGUgdXNlcyBhCmhhcmRjb2RlZCB2YWx1ZSBvZiBNQVhfSERJU1BMQVlfU1BMSVQgKDEw
ODApLCBidXQgaW4gcmVhbGl0eSBJIGJlbGlldmUKaXQgc2hvdWxkIGJlIHRoZSBsbSBtYXggd2lk
dGggKHR5cGljYWxseSAyNTYwKS4gVGhpcyB3aWxsIGF2b2lkIHVzaW5nCnR3byBMTXMgdG8gcmVu
ZGVyIHJlc29sdXRpb25zIGxpa2UgMTI4MHg3MjAgb3IgMTkyMHgxMDgwLgoKSSBoYXZlbid0IG1h
bmFnZWQgdG8gbWFrZSBoZG1pIHdvcmsgeWV0IG9uIERQVSAodGVzdGluZyBvbiBNU004OTk4KSBz
bwpJJ20gbm90IHJlYWR5IHRvIHNlbmQgdGhlIHBhdGNoIHlldCwgYnV0IGl0IGRvZXNuJ3Qgc2Vl
bSB0byB0cmlnZ2VyCmFueSBlcnJvci4KCi1Bcm5hdWQKCgo+Cj4gU2lnbmVkLW9mZi1ieTogRG1p
dHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uYyB8IDEyIC0tLS0tLS0tLS0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uaCB8ICA0IC0tLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9ybS5jCj4gaW5kZXggYzM2NzAwYTA2ZmYyLi5lYzQzODdhZDExODIgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3JtLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uYwo+IEBAIC04OCwxOCArODgsNiBAQCBpbnQg
ZHB1X3JtX2luaXQoc3RydWN0IGRwdV9ybSAqcm0sCj4gICAgICAgICAgICAgICAgICAgICAgICAg
Z290byBmYWlsOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIHJtLT5taXhl
cl9ibGtzW2xtLT5pZCAtIExNXzBdID0gJmh3LT5iYXNlOwo+IC0KPiAtICAgICAgICAgICAgICAg
aWYgKCFybS0+bG1fbWF4X3dpZHRoKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcm0tPmxt
X21heF93aWR0aCA9IGxtLT5zYmxrLT5tYXh3aWR0aDsKPiAtICAgICAgICAgICAgICAgfSBlbHNl
IGlmIChybS0+bG1fbWF4X3dpZHRoICE9IGxtLT5zYmxrLT5tYXh3aWR0aCkgewo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIC8qCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICogRG9uJ3QgZXhw
ZWN0IHRvIGhhdmUgaHcgd2hlcmUgbG0gbWF4IHdpZHRocyBkaWZmZXIuCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICogSWYgZm91bmQsIHRha2UgdGhlIG1pbi4KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICBEUFVfRVJST1IoInVuc3VwcG9y
dGVkOiBsbSBtYXh3aWR0aCBkaWZmZXJzXG4iKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBp
ZiAocm0tPmxtX21heF93aWR0aCA+IGxtLT5zYmxrLT5tYXh3aWR0aCkKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJtLT5sbV9tYXhfd2lkdGggPSBsbS0+c2Jsay0+bWF4d2lkdGg7
Cj4gLSAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAgZm9yIChpID0gMDsg
aSA8IGNhdC0+Y3RsX2NvdW50OyBpKyspIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X3JtLmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfcm0uaAo+IGluZGV4IGVlOTBiMTIzMzQzMC4uMGM5MTEzNTgxZDcxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9ybS5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3JtLmgKPiBAQCAtMTcsMTQgKzE3LDEwIEBAIHN0cnVj
dCBkcHVfZ2xvYmFsX3N0YXRlOwo+ICAgKiBzdHJ1Y3QgZHB1X3JtIC0gRFBVIGR5bmFtaWMgaGFy
ZHdhcmUgcmVzb3VyY2UgbWFuYWdlcgo+ICAgKiBAbWl4ZXJfYmxrczogYXJyYXkgb2YgbGF5ZXIg
bWl4ZXIgaGFyZHdhcmUgcmVzb3VyY2VzCj4gICAqIEBjdGxfYmxrczogYXJyYXkgb2YgY3RsIGhh
cmR3YXJlIHJlc291cmNlcwo+IC0gKiBAbG1fbWF4X3dpZHRoOiBjYWNoZWQgbGF5ZXIgbWl4ZXIg
bWF4aW11bSB3aWR0aAo+IC0gKiBAcm1fbG9jazogcmVzb3VyY2UgbWFuYWdlciBtdXRleAo+ICAg
Ki8KPiAgc3RydWN0IGRwdV9ybSB7Cj4gICAgICAgICBzdHJ1Y3QgZHB1X2h3X2JsayAqbWl4ZXJf
Ymxrc1tMTV9NQVggLSBMTV8wXTsKPiAgICAgICAgIHN0cnVjdCBkcHVfaHdfYmxrICpjdGxfYmxr
c1tDVExfTUFYIC0gQ1RMXzBdOwo+IC0KPiAtICAgICAgIHVpbnQzMl90IGxtX21heF93aWR0aDsK
PiAgfTsKPgo+ICBzdHJ1Y3QgZHB1X2ttczsKPiAtLQo+IDIuMzAuMgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBGcmVlZHJlbm8gbWFpbGluZyBs
aXN0Cj4gRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJl
ZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

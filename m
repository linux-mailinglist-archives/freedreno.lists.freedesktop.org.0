Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B950139AF35
	for <lists+freedreno@lfdr.de>; Fri,  4 Jun 2021 02:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E816F54C;
	Fri,  4 Jun 2021 00:49:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5DC6F54C
 for <freedreno@lists.freedesktop.org>; Fri,  4 Jun 2021 00:49:55 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f30so11554279lfj.1
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 17:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Iwimm5kt1cPOS3WktKznx8Tm3YSJawu3yuys6bu5NIU=;
 b=Gs5lp5tfCZGV7HaOOLREF2vdGYMqTNw3RNRfVR02KWcpUPpLyAkDZxU7KzZFEpILnW
 TS0t5Tw3jHP2Ob59G1pCQ6LYWQnMUKiuyHK3lTTIefXm7iqwG9uq0eGTtxJAGrSis2Ek
 NgYpfpSBSpngnF6vNhFkr+azyg64Nbj9wU4YUX7k4Dz0Mu3a5c83ByA1JJIQ++3PzJA6
 vDwZiKtp6AAOuGW+JBWR48V9np7igTsW2Fn7/DOOm8HTKOkQD5ZzGiEpusGlmlULy59v
 kW8Wrs3I4DQqP6mQqK141gPFmWUyx5cOt7ntAA6X/nilYQsGyV/6fTzlwq5TQsgRvMrV
 133A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Iwimm5kt1cPOS3WktKznx8Tm3YSJawu3yuys6bu5NIU=;
 b=bKpBmiUN5NC2BmTVCVd18y20UQ0HoZMn7FwX5Yam1nk9MuqMjWkISnDoq9I/R3kEDz
 c7Cap7YBV8xPLN6L4IuatFqWRc2ONf9bbS8ijnmagrm6xMBtIhz38E2uWljs4aCiC5lc
 /8nxmHMus1XUnuv/1R8Jk7NAkWJomVLnG8FNhLNtttJ4hSqUQlo9OfKHto6xwwSz3r5d
 5v8cSA/d6ptpsEyXJbEdc0T/6bPMpakHdMT6M/J1CxSLdEfdVbPDHAfleVmW0cabVY6O
 ZIhKXMsm9luChg9pK6IjshKxsQ2LsJfGPUmL5OavH0iqy6X3jkMetubTYC9icBVwSGjP
 baug==
X-Gm-Message-State: AOAM532s6ltKiY10mCe0fBJaK0eEYZltowzyRo9Z9SGOBm8qDEMZ2iLF
 xlm4R6oeNE5ZjIkfc5Y7lK/tEA==
X-Google-Smtp-Source: ABdhPJweJXWYYmQjui7kNiJ8H+bSQ43RmGPF8suRIMZscFcJCMH54wVPsAk3g0wsQCdvPIOhcg2PRA==
X-Received: by 2002:a05:6512:32ab:: with SMTP id
 q11mr961056lfe.21.1622767793930; 
 Thu, 03 Jun 2021 17:49:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p26sm448515ljn.33.2021.06.03.17.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 17:49:53 -0700 (PDT)
To: Lee Jones <lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-13-lee.jones@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b506aea4-0612-0ac4-1ef2-45b0cc80e7f1@linaro.org>
Date: Fri, 4 Jun 2021 03:49:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-13-lee.jones@linaro.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [RESEND 12/26] drm/msm/msm_gem: Demote kernel-doc
 abuses
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMDIvMDYvMjAyMSAxNzozMiwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICAgZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZ2VtLmM6MzY0OiB3YXJuaW5nOiBUaGlzIGNvbW1lbnQgc3RhcnRzIHdpdGggJy8qKics
IGJ1dCBpc24ndCBhIGtlcm5lbC1kb2MgY29tbWVudC4gUmVmZXIgRG9jdW1lbnRhdGlvbi9kb2Mt
Z3VpZGUva2VybmVsLWRvYy5yc3QKPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jOjc2
Mzogd2FybmluZzogVGhpcyBjb21tZW50IHN0YXJ0cyB3aXRoICcvKionLCBidXQgaXNuJ3QgYSBr
ZXJuZWwtZG9jIGNvbW1lbnQuIFJlZmVyIERvY3VtZW50YXRpb24vZG9jLWd1aWRlL2tlcm5lbC1k
b2MucnN0Cj4gCj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogU2Vh
biBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBT
ZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5l
bC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBmcmVlZHJl
bm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
Zwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5
c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4KCj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9nZW0uYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYwo+IGluZGV4IDU2
ZGY4NmU1Zjc0MDAuLjE1NDM0ZGViMTkzMzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYwo+IEBA
IC0zNzIsNyArMzcyLDcgQEAgc3RhdGljIHZvaWQgZGVsX3ZtYShzdHJ1Y3QgbXNtX2dlbV92bWEg
KnZtYSkKPiAgIAlrZnJlZSh2bWEpOwo+ICAgfQo+ICAgCj4gLS8qKgo+ICsvKgo+ICAgICogSWYg
Y2xvc2UgaXMgdHJ1ZSwgdGhpcyBhbHNvIGNsb3NlcyB0aGUgVk1BIChyZWxlYXNpbmcgdGhlIGFs
bG9jYXRlZAo+ICAgICogaW92YSByYW5nZSkgaW4gYWRkaXRpb24gdG8gcmVtb3ZpbmcgdGhlIGlv
bW11IG1hcHBpbmcuICBJbiB0aGUgZXZpY3Rpb24KPiAgICAqIGNhc2UgKCFjbG9zZSksIHdlIGtl
ZXAgdGhlIGlvdmEgYWxsb2NhdGVkLCBidXQgb25seSByZW1vdmUgdGhlIGlvbW11Cj4gQEAgLTc3
Myw3ICs3NzMsNyBAQCB2b2lkIG1zbV9nZW1fcHVyZ2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmopCj4gICAJCQkwLCAobG9mZl90KS0xKTsKPiAgIH0KPiAgIAo+IC0vKioKPiArLyoKPiAgICAq
IFVucGluIHRoZSBiYWNraW5nIHBhZ2VzIGFuZCBtYWtlIHRoZW0gYXZhaWxhYmxlIHRvIGJlIHN3
YXBwZWQgb3V0Lgo+ICAgICovCj4gICB2b2lkIG1zbV9nZW1fZXZpY3Qoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmopCj4gCgoKLS0gCldpdGggYmVzdCB3aXNoZXMKRG1pdHJ5Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

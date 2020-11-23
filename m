Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467592C176A
	for <lists+freedreno@lfdr.de>; Mon, 23 Nov 2020 22:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6AB89612;
	Mon, 23 Nov 2020 21:14:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BC56E0DA
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 21:14:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606166047; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fF8sJczCEwJml8nM5LK6JByhLs7eGPmrcAGqvBAOQEg=;
 b=LYpa/nTMhxo0UCDQ1r5sePVa+x0nFcBbutzwURsPhDtl0EfINygJTMyIervw89ivlbpfh84d
 PaiIj6FHZBqoquJ8wGLdJsG4737HmHlF/1wMGDn7CoZcohvO8lA2QgxgPxp4++YGg2mG3xpT
 MTEOOErZqs2gBOVXu3g9aBbfKA0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbc261e1dba509aaeb6926a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:14:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D71F6C433C6; Mon, 23 Nov 2020 21:14:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 26EE8C43460;
 Mon, 23 Nov 2020 21:14:06 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:14:06 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-39-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-39-lee.jones@linaro.org>
Message-ID: <7efa1e1dfd1e415d5614a0f8d266b144@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 38/40] drm/msm/msm_drv: Make
 '_msm_ioremap()' static
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0yMyAwMzoxOSwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9kcnYuYzoxMjQ6MTU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZQo+IGZvciDi
gJhfbXNtX2lvcmVtYXDigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+IAo+IENjOiBSb2IgQ2xh
cmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVu
Pgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBmcmVlZHJlbm9AbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IEFiaGluYXYgS3VtYXIgPGFiaGluYXZrQGNvZGVhdXJv
cmEub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyB8IDQgKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyAKPiBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2Rydi5jCj4gaW5kZXggNGQ1ODY2OGI4MDg1My4uZWRjOTllM2IwZWNhNyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCj4gQEAgLTEyMSw4ICsxMjEsOCBAQCBzdHJ1Y3QgY2xr
ICptc21fY2xrX2dldChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCj4gKnBkZXYsIGNvbnN0IGNoYXIg
Km5hbWUpCj4gIAlyZXR1cm4gY2xrOwo+ICB9Cj4gCj4gLXZvaWQgX19pb21lbSAqX21zbV9pb3Jl
bWFwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIGNvbnN0IGNoYXIgCj4gKm5hbWUsCj4g
LQkJCSAgIGNvbnN0IGNoYXIgKmRiZ25hbWUsIGJvb2wgcXVpZXQpCj4gK3N0YXRpYyB2b2lkIF9f
aW9tZW0gKl9tc21faW9yZW1hcChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBjb25zdAo+
IGNoYXIgKm5hbWUsCj4gKwkJCQkgIGNvbnN0IGNoYXIgKmRiZ25hbWUsIGJvb2wgcXVpZXQpCj4g
IHsKPiAgCXN0cnVjdCByZXNvdXJjZSAqcmVzOwo+ICAJdW5zaWduZWQgbG9uZyBzaXplOwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFp
bGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K

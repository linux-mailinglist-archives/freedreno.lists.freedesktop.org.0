Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824A0357398
	for <lists+freedreno@lfdr.de>; Wed,  7 Apr 2021 19:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0A66E945;
	Wed,  7 Apr 2021 17:52:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D896E945
 for <freedreno@lists.freedesktop.org>; Wed,  7 Apr 2021 17:52:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617817944; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Uf0AVv8aqmiXb0YftRz/h5+MlBMvFR0+UaFhKIo1nCw=;
 b=CDh5vZLaHnZGaUPRadOosa/hKwnM8c8sEITQT2Mi2MjCJsWj51Hv/f2lKde33Zdx2JF4HvY0
 zXKfUsuLNOvDmiPJ0zJqCZ+C3/XPpdH01oAJnlDSjOFJreKuw0zobiyb3ZVhF/CZOwQLUCu2
 uJX8Pz9iL0tSjFGHxQMdnM299WM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 606df1522cc44d3aea4b2247 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 17:52:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A8FAC43465; Wed,  7 Apr 2021 17:52:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 130AAC433ED;
 Wed,  7 Apr 2021 17:52:17 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 10:52:17 -0700
From: abhinavk@codeaurora.org
To: Zhen Lei <thunder.leizhen@huawei.com>
In-Reply-To: <20210407083334.2762-1-thunder.leizhen@huawei.com>
References: <20210407083334.2762-1-thunder.leizhen@huawei.com>
Message-ID: <fb7d8e6daf9586c4aff0606bdcd1e32d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 1/1] drm/msm/dpu: remove unused local
 variable 'cmd_enc'
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0wNyAwMTozMywgWmhlbiBMZWkgd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYzogSW4gZnVuY3Rpb24KPiDigJhkcHVfZW5jb2Rl
cl9waHlzX2NtZF93YWl0X2Zvcl9jb21taXRfZG9uZeKAmToKPiBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jOjY4ODozMTogd2FybmluZzoKPiB2YXJp
YWJsZSDigJhjbWRfZW5j4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCj4gCj4gRml4ZXM6IGZlMjg2ODkzZWQzNCAoImRybS9tc20vZHB1OiBSZW1vdmUgdW51
c2VkIGNhbGwgaW4gCj4gd2FpdF9mb3JfY29tbWl0X2RvbmUiKQo+IFJlcG9ydGVkLWJ5OiBIdWxr
IFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBaaGVuIExlaSA8dGh1
bmRlci5sZWl6aGVuQGh1YXdlaS5jb20+ClJldmlld2VkLWJ5OiBBYmhpbmF2IEt1bWFyIDxhYmhp
bmF2a0Bjb2RlYXVyb3JhLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYwo+IGluZGV4IGIyYmUzOWI5MTQ0ZTQ0OS4uMDg4OTAw
ODQxYmY4YmFhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9lbmNvZGVyX3BoeXNfY21kLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jCj4gQEAgLTY4NSwxMCArNjg1LDYgQEAgc3RhdGljIGlu
dCAKPiBkcHVfZW5jb2Rlcl9waHlzX2NtZF93YWl0X2Zvcl90eF9jb21wbGV0ZSgKPiAgc3RhdGlj
IGludCBkcHVfZW5jb2Rlcl9waHlzX2NtZF93YWl0X2Zvcl9jb21taXRfZG9uZSgKPiAgCQlzdHJ1
Y3QgZHB1X2VuY29kZXJfcGh5cyAqcGh5c19lbmMpCj4gIHsKPiAtCXN0cnVjdCBkcHVfZW5jb2Rl
cl9waHlzX2NtZCAqY21kX2VuYzsKPiAtCj4gLQljbWRfZW5jID0gdG9fZHB1X2VuY29kZXJfcGh5
c19jbWQocGh5c19lbmMpOwo+IC0KPiAgCS8qIG9ubHkgcmVxdWlyZWQgZm9yIG1hc3RlciBjb250
cm9sbGVyICovCj4gIAlpZiAoIWRwdV9lbmNvZGVyX3BoeXNfY21kX2lzX21hc3RlcihwaHlzX2Vu
YykpCj4gIAkJcmV0dXJuIDA7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Zy
ZWVkcmVubwo=

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A0939919F
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 19:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD436EE0E;
	Wed,  2 Jun 2021 17:26:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47F86EE0E
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 17:26:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622654814; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=thAp5U/BnilHig/A/fV8FHcVazNRnezQYfUBJs5V2nQ=;
 b=d7kSb+HtqI7d+XGRQzg7I4CAOFAIzqSN0QcuR3Xwk9BaAgmj+vFKVCJ1daHtj5n6SGKW6VA9
 pojIAv05DQPgCWFypXTQq5gb0Nt9xyK2evMMC/FdwAph2qi21/VBatJLak8dl0N8gpy36ozB
 +f9tapgwbGz7FhGhK+RFLMZ4LY0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60b7bf49e27c0cc77f64a0f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 17:26:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D45D3C4323A; Wed,  2 Jun 2021 17:26:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 732B5C433F1;
 Wed,  2 Jun 2021 17:26:31 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 02 Jun 2021 10:26:31 -0700
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
In-Reply-To: <20210602143300.2330146-10-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-10-lee.jones@linaro.org>
Message-ID: <c6c4443e3e7a3c5c9d97ecfc58f49fb6@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [RESEND 09/26]
 drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused variable 'cmd_enc'
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
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMjAyMS0wNi0wMiAwNzozMiwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jOiBJbiBmdW5jdGlvbgo+IOKAmGRwdV9l
bmNvZGVyX3BoeXNfY21kX3dhaXRfZm9yX2NvbW1pdF9kb25l4oCZOgo+ICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jOjY4ODozMTogd2FybmluZzoK
PiB2YXJpYWJsZSDigJhjbWRfZW5j4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1z
ZXQtdmFyaWFibGVdCj4gCj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBB
bmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyAKPiA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bz
b21haW5saW5lLm9yZz4KPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBmcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KUmV2aWV3ZWQtYnk6IEFiaGluYXYgS3VtYXIgPGFiaGluYXZrQGNvZGVhdXJvcmEub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlz
X2NtZC5jIHwgNCAtLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlz
X2NtZC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlz
X2NtZC5jCj4gaW5kZXggYjJiZTM5YjkxNDRlNC4uMDg4OTAwODQxYmY4YiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c19jbWQu
Ywo+IEBAIC02ODUsMTAgKzY4NSw2IEBAIHN0YXRpYyBpbnQgCj4gZHB1X2VuY29kZXJfcGh5c19j
bWRfd2FpdF9mb3JfdHhfY29tcGxldGUoCj4gIHN0YXRpYyBpbnQgZHB1X2VuY29kZXJfcGh5c19j
bWRfd2FpdF9mb3JfY29tbWl0X2RvbmUoCj4gIAkJc3RydWN0IGRwdV9lbmNvZGVyX3BoeXMgKnBo
eXNfZW5jKQo+ICB7Cj4gLQlzdHJ1Y3QgZHB1X2VuY29kZXJfcGh5c19jbWQgKmNtZF9lbmM7Cj4g
LQo+IC0JY21kX2VuYyA9IHRvX2RwdV9lbmNvZGVyX3BoeXNfY21kKHBoeXNfZW5jKTsKPiAtCj4g
IAkvKiBvbmx5IHJlcXVpcmVkIGZvciBtYXN0ZXIgY29udHJvbGxlciAqLwo+ICAJaWYgKCFkcHVf
ZW5jb2Rlcl9waHlzX2NtZF9pc19tYXN0ZXIocGh5c19lbmMpKQo+ICAJCXJldHVybiAwOwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFp
bGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328C3980B4
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 07:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC86C6EA09;
	Wed,  2 Jun 2021 05:38:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF546EA09
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 05:38:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622612330; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=g2jQLvmNDkv0M+pVgOjszfDqwE56kNAfKvmEEL+w9Uw=;
 b=mOnba22mqjVjgyASOUn6BdCDA3DTjHOgsgAKu3ickYibSHg6uUBwhp3bxJ05jX6nXDlyexCC
 29SKGPTMvmrUc+AuOVplyf+FZxchUkJUzfLJTg3UYYHKLfr8qVSVJSs/gOKOIOWBT5j+dQsE
 3MSKjA7xaBtFcssaVfFbtLjuQ3I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60b71963ed59bf69cc1edd2b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 05:38:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7EC56C4338A; Wed,  2 Jun 2021 05:38:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 28564C433D3;
 Wed,  2 Jun 2021 05:38:42 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 02 Jun 2021 11:08:42 +0530
From: rajeevny@codeaurora.org
To: Lyude Paul <lyude@redhat.com>
In-Reply-To: <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
 <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
Message-ID: <5baa08346ac035a9b72098b1e514b7d6@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [v4 1/4] drm/panel-simple: Add basic DPCD backlight
 support
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 mkrishn@codeaurora.org, sam@ravnborg.org, robh@kernel.org,
 jani.nikula@intel.com, linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, a.hajda@samsung.com, robdclark@gmail.com,
 thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, freedreno@lists.freedesktop.org, y@qualcomm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMDItMDYtMjAyMSAwMzo1MCwgTHl1ZGUgUGF1bCB3cm90ZToKPiBvaC1sb29rcyBsaWtlIG15
IHBhdGNoZXMganVzdCBnb3QgcmV2aWV3ZWQsIHNvIGhvcGVmdWxseSBJIHNob3VsZCBnZXQgYSAK
PiBjaGFuY2UKPiB0byBnZXQgYSBsb29rIGF0IHRoaXMgaW4gdGhlIG5leHQgZGF5IG9yIHR3byA6
KQo+IAoKSGkgTHl1ZGUsCgpUaGF0J3MgZ3JlYXQhCkkgaGF2ZSB1cGRhdGVkIHY1IFsxXSBvZiB0
aGlzIHNlcmllcyBhZGRyZXNzaW5nIERvdWcncyByZXZpZXcgY29tbWVudHMgCm9uIHY0IFsyXS7C
oApQbGVhc2UgcmV2aWV3IHRoZSB2NS4KClsxXSAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtYXJtLW1zbS8xNjIyMzkwMTcyLTMxMzY4LTEtZ2l0LXNlbmQtZW1haWwtcmFqZWV2bnlAY29k
ZWF1cm9yYS5vcmcvClsyXSAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLW1zbS9D
QUQ9RlY9V3pRME9jPWUza21OZUJaVUErUDFzb0toQms4enQ3YkcxZ3FKLURvLVRxX3dAbWFpbC5n
bWFpbC5jb20vCgoKVGhhbmtzLApSYWplZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZnJlZWRyZW5vCg==

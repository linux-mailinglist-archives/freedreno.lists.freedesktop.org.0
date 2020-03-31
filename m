Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5EF198DBD
	for <lists+freedreno@lfdr.de>; Tue, 31 Mar 2020 09:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220486E5B9;
	Tue, 31 Mar 2020 07:57:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322D96E5B9
 for <freedreno@lists.freedesktop.org>; Tue, 31 Mar 2020 07:56:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585641419; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=dVNPuFwMQs3mGQ6A/aNYnqJJmJ84rfGZXTYWK1NW09c=;
 b=VtIl2068Uqb+hnbBCwkLduAlfm24rwaHy8pN4v9UxDjvRwR5kk5Gcd3CG/tu3z9Dm+9IIE9y
 INregjivl9fSvmLrXlmhSUQH5hNVbrjO3TYxK2/tNQqBu9uMSVfSRXamJlsTPWvxIH5+jsG1
 lo5dprNptTV8Zp0RkB5ojnwnD5E=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f7c2.7f9b3e44fce0-smtp-out-n03;
 Tue, 31 Mar 2020 07:56:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9249AC44799; Tue, 31 Mar 2020 07:56:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CE7CC43637;
 Tue, 31 Mar 2020 07:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4CE7CC43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Date: Tue, 31 Mar 2020 13:25:52 +0530
Message-Id: <1585641353-23229-5-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
Subject: [Freedreno] [PATCH 4/5] drm: msm: a6xx: Fix off by one error when
 setting GPU freq
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
Cc: saravanak@google.com, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 jcrouse@codeaurora.org, mka@chromium.org, sibis@codeaurora.org,
 viresh.kumar@linaro.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch fixes an error in the for loop, thereby allowing search on
the full list of possible GPU power levels.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 489d9b6..81b8559 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -176,7 +176,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
 	if (freq == gmu->freq)
 		return;

-	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
+	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs; perf_index++)
 		if (freq == gmu->gpu_freqs[perf_index])
 			break;

--
2.7.4
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

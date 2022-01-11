Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1A148B9ED
	for <lists+freedreno@lfdr.de>; Tue, 11 Jan 2022 22:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF4A10E5B6;
	Tue, 11 Jan 2022 21:51:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545DE10E5B6
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jan 2022 21:51:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1641937888; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=vyBK0LSqO0I5EQ5e4hsKAdcFelt6JTL0Ja4sPoT+Tlw=;
 b=atC68umouWfJOXf0NUC/8yG1fVt68cJWv3+0BiPxQCpDcePvOAzMhUMSsBAPWMP8HSc37fij
 wkOtawY2ednQB7+DrgsKlpjQh8jTnvvLGa2mZHH9suebtdOxpHNWZAs+YbgrOV++MGd8PVxT
 8dmnuKH8utghugltLCPt1qzPjGI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61ddfbb94f9f22efc0a4b2df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Jan 2022 21:50:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7809BC4360C; Tue, 11 Jan 2022 21:50:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A68BC4360D
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jan 2022 21:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3A68BC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>
Date: Wed, 12 Jan 2022 03:20:33 +0530
Message-Id: <20220112031811.4.Idbc978090270c7b838387acc74d8a06a186a3cf4@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20220112031811.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
References: <20220112031811.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
Subject: [Freedreno] [PATCH 4/4] drm/msm/adreno: Update the name of 7c3 gpu
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Update the name in the gpulist for 7c3 gpu as per the latest
recommendation.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f35c631..2f1cc56 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -330,7 +330,7 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a660_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
-		.name = "Adreno 7c Gen 3",
+		.name = "Adreno 7c+ Gen 3",
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",
-- 
2.7.4


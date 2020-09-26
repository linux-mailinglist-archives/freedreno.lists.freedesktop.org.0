Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2626627990F
	for <lists+freedreno@lfdr.de>; Sat, 26 Sep 2020 14:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A816E213;
	Sat, 26 Sep 2020 12:52:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8866E210
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 12:52:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so6898010wrn.0
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 05:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ScwFgjf4CVFLL0QbktoshjK86UH6jL1pgVGi1tkj42M=;
 b=FCm0rhLweV4v32CvpTVH22mVrlTllzq3je8W8VDTa7EwNOCixcG+mM6SoFBejJ4VnP
 6jIINolttCNWgAhQxEvNE5kMtet6duC+LkCoOhgyN8XtXQjcQ1qhurpJHEgulFtln4XD
 /JQ5GMSFBIeUxS28yJLRp3qzyjALaujMXWJW8oO8vyI1NKEmCjY6YbJ9Wfv1sYUdSdA1
 MxFieGfCBIaWcXwAdHQnO1a88HlaA5qol3fTTOm3eCTyZfAIRPuVX/nFYiYfvEQ1TvbZ
 +CJyFxzVk7/jiR/5p16X2SVQQImY8+I3Pp0EdojZTsZKTgwgpEtCSw8EodOmNyJuwh99
 qdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ScwFgjf4CVFLL0QbktoshjK86UH6jL1pgVGi1tkj42M=;
 b=VN3/z1MJ0RpsMXBT2r32b9Z4t1itk1gTylbt/F5bux536yhWbZyEdWRBiaTZ6nh8wL
 oY25WZTpuEc6u+FN6PTBh6mI6BwvhiEp6Xi+Gm2+2soCvjsoE4C1REMxTiFVi//0Ly8b
 sD42bYd74RIyOq4JA7P1dlTr2VG1LXqtewC80kLoyAZ3FbDJi+iBtJTn732G3O4w8xyk
 ApSpcmwbFV2tCePHDeyVl7UtIeoFwS/DEbMgQIwBFtTQA0lU/BmRaH963KwBZSDhaNaF
 78ND96HE7z7L8lfkaXK1/2/C9GwuPJSWLJBmfMhu/unAJVjrg72X2A8585hFFFzWFeeo
 bSxA==
X-Gm-Message-State: AOAM531qWl3YejbhduTxFgc7T6hwZwkWWtDVvotCkyEpY400H6ETMf7A
 3u06l99HOARdh9YCFqU//5o=
X-Google-Smtp-Source: ABdhPJwRsAcaiieSYbXlX01tJPbMNfAAj8VCdZihppRjta/A7uJCVk3jfoMBRnSfNtoMf7RIQuNDWg==
X-Received: by 2002:adf:f80a:: with SMTP id s10mr9908215wrp.351.1601124719194; 
 Sat, 26 Sep 2020 05:51:59 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 05:51:58 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Sat, 26 Sep 2020 14:51:44 +0200
Message-Id: <20200926125146.12859-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 5/7] drm/msm/a5xx: Fix VPC protect value in
 gpu_write()
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
Cc: freedreno@lists.freedesktop.org, marijns95@gmail.com,
 phone-devel@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 konradybcio@gmail.com, linux-kernel@vger.kernel.org, martin.botka1@gmail.com,
 jcrouse@codeaurora.org, daniel@ffwll.ch, kholk11@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konradybcio@gmail.com>

The upstream API for some reason uses logbase2 instead of
just passing the argument as-is, whereas downstream CAF
kernel does the latter.

Hence, a mistake has been made when porting:
4 is the value that's supposed to be passed, but
log2(4) = 2. Changing the value to 16 (= 2^4) fixes
the issue.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 00df5de3c8e3..b2670af638a3 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -789,7 +789,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	/* VPC */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(14), ADRENO_PROTECT_RW(0xE68, 8));
-	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 4));
+	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 16));
 
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

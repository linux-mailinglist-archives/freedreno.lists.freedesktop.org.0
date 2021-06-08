Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DEC39FDA7
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 19:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CC16E588;
	Tue,  8 Jun 2021 17:30:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3864B6E570
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 17:30:11 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id f70so5762953qke.13
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 10:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4A/Pcyw+QD8Ug/Nt2Xmd1/EAfukVYO4RIkYOrmyswQM=;
 b=G1CaD5y6gwymINmHtsKEhWsaqJxxFVGj6787Wi/WaUi0ibM0X5gQeT7WW6yY0pEqS/
 3StBiA+9Fs6AXgzwfa2bIyqtGJyEuBOHjnXzkH2/WxlBTj6rbZe5ZIlhpuzOtnBAb9Hq
 4eGjLJiUi7c554WRkGjh/BGMvOUdNTc1IoeLLxHl7f6wbMkW1CHteyEy2tsjqsEpfZHY
 o8CSRZut2bTqhw8QmfqUq5t2xEH+RKRosHMzemv8JJBUqm37s1A8j62TPn/CfHjCfydp
 gzVypgdBjcGn7zKoB1akl6XvmI8kG3c7gzJWTb152tPbyu/BimAhaYfXB6I9OGVJTYyc
 evJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4A/Pcyw+QD8Ug/Nt2Xmd1/EAfukVYO4RIkYOrmyswQM=;
 b=jov2W4tOuwHhVugpUBsPm5mQYRe677KpDLd5Nz6ed/8toxI9glOM51WXzimf6CrNh6
 bacS8gk15YIjWdEvTDUi8Xt8UUb9XUA+kN89LfAz3NmejCb7AGLr0Ol5sNdYTedEKSHG
 17+0Flt0YXkxIz5HB8tZWxL5IuqIifeHlNL8L7/4hbg0NhxEstFTOjo1+NQ0CijCAg8Q
 8wRO7Qy2zK6kESJ/w2xGz6FJyv0ewKSYMdRbq7rsvwm8SESGWfBr1yiJ2dRQ8PjAepyn
 hQRXP1d8FxoxtnfQpf2fUUIfcNcOrhMPBvJktt7LgcqGokTgbXxY2MSTOhyluDhbFzNd
 Z5NA==
X-Gm-Message-State: AOAM532O+JOqdfiu787KmSIH5W9U8THOijwNG5bjbnbsBmc1jxtYNbo4
 r7GS+8dGWSaV62jRHcL9eViuZa+8K2wKTQXZsUEOiw==
X-Google-Smtp-Source: ABdhPJzTo4VczO5D3fNE/OOCfEaOjp6b6rtTfwnhjqlgt3NXWkN04Lg7T/UGxCTR954ZwROyXIX2Cg==
X-Received: by 2002:a37:71c5:: with SMTP id m188mr7310523qkc.97.1623173410212; 
 Tue, 08 Jun 2021 10:30:10 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 10:30:09 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue,  8 Jun 2021 13:27:47 -0400
Message-Id: <20210608172808.11803-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608172808.11803-1-jonathan@marek.ca>
References: <20210608172808.11803-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 4/5] drm/msm/a6xx: add missing
 PC_DBG_ECO_CNTL bit for a640/a650
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

See downstream's "disable_tseskip" flag.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 853be7651623..bbbf90d86828 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -844,13 +844,15 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Setting the mem pool size */
 	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
-	/* Setting the primFifo thresholds default values */
+	/* Setting the primFifo thresholds default values,
+	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
+	*/
 	if (adreno_is_a650(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300000);
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
 	else if (adreno_is_a640(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200000);
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, (0x300 << 11));
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
 
 	/* Set the AHB default slave response to "ERROR" */
 	gpu_write(gpu, REG_A6XX_CP_AHB_CNTL, 0x1);
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

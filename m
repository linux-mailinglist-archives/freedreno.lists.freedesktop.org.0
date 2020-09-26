Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1B27990C
	for <lists+freedreno@lfdr.de>; Sat, 26 Sep 2020 14:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB0E6E177;
	Sat, 26 Sep 2020 12:51:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8625C6E177
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 12:51:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s13so1920828wmh.4
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b1cxEWVtTchv9LulFIq5cTpW0TIwhYIam0Ax8XR7gpQ=;
 b=iUl9jLvlfWcKeH+Yw4X0PQOfTIudyWMz0fQTsHxVRomHClbQEjXWjpweVcW1W0AQaR
 QKyIEKdtaYwQeMM6nkSOcBETwg1sKbFfvi4YELIVMlnoAdGPyrntjn59raMcHUuR1HC5
 xFEJcKonKy7Zx030gD7d6U8pvViEbYLuTWOBrt0bxwajBHMPCVWe6NoWwPBcbbEF6Q0O
 SWYUysbXgPlXQ2wMHfFiqVYoY2H6Fp4sJkC8d74vbFhWaVmHSu7/z/i4u10ClqrZZfCU
 vpTktjziitJfehmosT7Dy+RR6nCcqHz7rrh7t4/24qvDOZebHEBtg6egU26ckjKSDiS5
 XJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b1cxEWVtTchv9LulFIq5cTpW0TIwhYIam0Ax8XR7gpQ=;
 b=HriZogiwcE3d2PqDSPeo3xWmq1UB77pTTSBeK9LHFQuN6EAC4T4/uRC9r7nh4Iwbz3
 f7wfQ3AVfDuE6bfkN3p900tW+LyKgd0rHjxxxavtk5j2sGl3lAsNL2mNWbNImGC7GX30
 pOfJ88FHrJ+qf/K6J28Zd8aUw7jPVVe9/MuWMGmm0KPo4uHEZXvoyP6cyS+La2REiq0S
 /BMBMjXbqZF82F7AVy+XUwuS1UVqu/6fyvjbas/NB8xRbpSS9EGwCvLzUDwQMQayYedZ
 NzV9KnLAaFgw8QBY8RW7GEUcn/gj4FKkGjWhLRRezk9/+FB94jX4YXS+nO6RwCwsgw18
 jlqA==
X-Gm-Message-State: AOAM533f/UtyxSBV4K29sZItRl1YoPILV321gnsUgSONFA+rS+oSwa6G
 r4IXMBYWamoEtghkvPmu9Ho=
X-Google-Smtp-Source: ABdhPJy7la5lEzdeHF2t0BlcyTOiYk2AU/h/MX3uOvPeWKgvVLnOfRYQMeImquyCmu1XpVvVYIliiw==
X-Received: by 2002:a1c:4455:: with SMTP id r82mr2498441wma.60.1601124716004; 
 Sat, 26 Sep 2020 05:51:56 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 05:51:55 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Sat, 26 Sep 2020 14:51:41 +0200
Message-Id: <20200926125146.12859-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/7] drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL
 write from main branch
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

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The "main" if branch where we program the other regsiters for the
Adreno 5xx family of GPUs should not contain the PC_DBG_ECO_CNTL
register programming because this has logical similarity
differences from all the others.

A later commit will show the entire sense of this.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6262603e6e2e..f98f0844838c 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -577,8 +577,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x40000030);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x20100D0A);
-		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
-			  (0x200 << 11 | 0x200 << 22));
 	} else {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
 		if (adreno_is_a530(adreno_gpu))
@@ -587,9 +585,14 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
+	}
+
+	if (adreno_is_a510(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
+			  (0x200 << 11 | 0x200 << 22));
+	else
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x400 << 11 | 0x300 << 22));
-	}
 
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

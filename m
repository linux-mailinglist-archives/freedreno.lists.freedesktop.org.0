Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C09A27B68F
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 22:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CFA89F45;
	Mon, 28 Sep 2020 20:47:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDAD89F33
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 20:47:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e2so2508566wme.1
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 13:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bKgQVwCCmQcmn6HakXnFm9OZzwMuHo5XzGULA63oxxE=;
 b=HtaX17H0LCDCfh2AnK/CTbogRhcXLSFVcCLz+we23hElBvDfhvSX+ToPD2RaN90sNk
 9wmKpwsNH4aAbYxt0Iktg3L6sbCfF3tZmFjI0raJFdeVjzz7B4McrrNBjwUb00a/gFWd
 7tJImUGh0JugHSIrxDOSWm/cI39LGMqWPNhGPt8iSTkBSVzy/Kt2RpfJQfkuMbljGAHV
 v+PLFXupBNHeWRM0kvYbppeigQg/1ZY/rtnJRXHcqcbrarWhDkg14x2zpS1X3ggh0Ehi
 UrhrYI0r43V5TnpeVkRJH/D5md2y0gcLId8T+BquFO6gFdisJcyjppCa0FSn0jm+Iwh3
 9bGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKgQVwCCmQcmn6HakXnFm9OZzwMuHo5XzGULA63oxxE=;
 b=ebiXT0lSv8KCSyO4qqNSWtXZykwC4UVBIkOAZcGUacJd0SV8gCkd8/ptKXjF4uR0pO
 oa6djw0KzAwp5kXfrxFCDHEclYWvvPKFga20lLK357AbYnncAROYAFHi/eDdiKxtC/SW
 69eRTgXBDiFgZB27nGx5iCKPO5RfD/VlrCGd3nJvbO5OV7x/Ey8jzQELAZ5ENVH3SOhT
 NWsLpfgaZmMw/29i343bTooPyOCwGkIUnG6VyYTjTIFcoBs1gwv4aM62FN2cwd9b5SpJ
 l0hRy/fjoLFGcHyLxuZdzQ6JIJGlU01qwglDUElp+gAgf3bCxUCtUTyJYtfGhVxKdaa4
 VegQ==
X-Gm-Message-State: AOAM5305VFPKByIHjANKAJGpIzCc5Eny1enaZ45TaHxCy/zlpYJjGAua
 NtWVo/G/nU+lCEJHI9FN+60=
X-Google-Smtp-Source: ABdhPJzfbMLv/WO+JF8OqmD89IoqUVjORTDPG/T/FAtiYSlnlJne0+Co/tDTBkTUlLmq1PnpuqkcJg==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr900910wmj.171.1601326033685;
 Mon, 28 Sep 2020 13:47:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 13:47:13 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Mon, 28 Sep 2020 22:47:04 +0200
Message-Id: <20200928204709.45746-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 2/7] drm/msm/a5xx: Separate
 A5XX_PC_DBG_ECO_CNTL write from main branch
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

The "main" if branch where we program the other registers for the
Adreno 5xx family of GPUs should not contain the PC_DBG_ECO_CNTL
register programming because this has logical similarity
differences from all the others.

A later commit will show the entire sense of this.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
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

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDBA27B696
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 22:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EC16E15F;
	Mon, 28 Sep 2020 20:47:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7027889F33
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 20:47:20 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e2so2508752wme.1
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qi3QBbwTIzLJyLiPTKqArtAX17f0oV+sDtlvdTST9EI=;
 b=FFkHwlEIKY9lkTUKPFFQJf5c4ZIzjNYFW7ukX1xoz7kGJ27+encAVjvi5xqmUaKSdX
 Yy0XbmQ5rFoCHUvrndTlTQ8Ym6wQICT1CCtk0d4TnwebxYk4hsPbMCviuYxD2bS6bR5S
 wjQCODFycwrSCMKqigHrPKdRHKG+X0nQ7Amf8X5A7DcyVIH6j3wT6Q+q9P1NJX4+Ba8t
 vmnTDiVzSAPamuTFEKNY7YNqmmxxczAqJW9eXb24P+GcI31uO41x1ZW3EcR9IWt4FFdI
 4YD5VI6giABZpkf2tsGoz9gMzuiYt3uT9+WUKBJCqMYzo4JWUCFM2dsRcopJizyvrG8o
 cHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qi3QBbwTIzLJyLiPTKqArtAX17f0oV+sDtlvdTST9EI=;
 b=dZtMQDTCO1Bm4K3TZf2m0xaaej0CCewr+K/oDyp8NPBYm6NsHIx4mVjy+cotWp3mqg
 +21MssCFjF5wNYUVHNcIZ5ZLesqYNd1fTWTrErKDoanvZ/apdrzjhDM5wdXk4pzgyT89
 7ViihQMkLf2bEncvSYLXt5p7+zALugHdBO1XUmG/R4KT0uTCbp3Q45XFsZHq9wzzY6AJ
 o0LKRLv6Ek0a1670VGMM7TiiyreCY82G1rmcaMvL+ztJNX7zbMo0HFRIALBLoN3w7eNk
 l+myK6vX9ifIlNQ1Si/73in/FdS3nxLsxYhY+sVRXdUiyazDnfpJUIiMYQ/3XVIP1jv3
 wNhA==
X-Gm-Message-State: AOAM533kwpzmLsklxK4rDErdmPk8KFz+oGycopMVCwXber+lJa1harEN
 KofWADWP1n6oz1dSSihmTf4=
X-Google-Smtp-Source: ABdhPJyjrWTObYZdK4RIzlZ1/TcPmklnjYiF4GcGB15/SN8U/IaNASVA1MBBGzulQH3waVkTRb7abg==
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr929365wmk.87.1601326039069;
 Mon, 28 Sep 2020 13:47:19 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 13:47:18 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Mon, 28 Sep 2020 22:47:09 +0200
Message-Id: <20200928204709.45746-8-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 7/7] drm/msm/a5xx: Disable UCHE global filter
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

Port over the command from downstream to prevent undefined
behaviour.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx.xml.h | 2 ++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx.xml.h b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
index 346cc6ff3a36..7b9fcfe95c04 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
@@ -2367,6 +2367,8 @@ static inline uint32_t A5XX_VSC_RESOLVE_CNTL_Y(uint32_t val)
 
 #define REG_A5XX_UCHE_ADDR_MODE_CNTL				0x00000e80
 
+#define REG_A5XX_UCHE_MODE_CNTL					0x00000e81
+
 #define REG_A5XX_UCHE_SVM_CNTL					0x00000e82
 
 #define REG_A5XX_UCHE_WRITE_THRU_BASE_LO			0x00000e87
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6dac060902a3..979397372505 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -722,6 +722,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	    adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
+	/* Disable UCHE global filter as SP can invalidate/flush independently */
+	gpu_write(gpu, REG_A5XX_UCHE_MODE_CNTL, BIT(29));
+
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

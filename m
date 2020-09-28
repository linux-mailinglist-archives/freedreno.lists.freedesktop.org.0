Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F827B693
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 22:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD18789F33;
	Mon, 28 Sep 2020 20:47:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A33C6E15C
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 20:47:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so2484335wmj.5
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 13:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ziMJA1iAl+X5B9d1htcymFy9Dzvpmo6/9Mbcbhl/So=;
 b=lhhlipNfqHYh9MhQQuWjdQvaiskcbpYDeBDMStFVQFJNXP9Un8SFDdHt37qmpBDjgY
 ckJ4yiJaWfpHgIfeAM+lHTY/fCdNo7ENInQAiL4Bsf6xuQdZInWhn0KqM1kkWnf6QkjI
 EtNY+0NUgDwnUG3p3fWjaaE8+gibgaUbxM+1JXk7p0SfDqIMGaKjTAoUyw1hh2Kr3l1Y
 mGc+4WUM/PJbOZKVzE7JrHR35LOWuGug6g24DAXtMfS2uIYoZ4Fz4a9e+fXKtowOjF+Y
 UkGvsLI4CiCoOUyga5wGRpXcgFQXa8kXZuxSVcaWC4BlaXyOlHiVR0WQCCuyEZYfkoO3
 4/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ziMJA1iAl+X5B9d1htcymFy9Dzvpmo6/9Mbcbhl/So=;
 b=KplFCt5KqhMg2GHelnFWOnbwZ2aeb76ACUsn0TuXgPUw+MNh9JEZ7KfgjUUDHHK1qa
 nsTPQkQxBUXKEFoshG0LJHZzMH/pVCKF3r0D2C6EIWdmPofKN38FuPZV2dRO60eCpUeQ
 bJ4nCX3LnHb/9ds0DiPjIXzTdoLGjKQfbDehipSPqLEO6qj4tAgymglnSIPGuhoEAssF
 TdAVUa8oAf95OAIV3C9LlLVdbCyzcFssCnyRjuNH0f9p2B3cePq30rfPvWLP3WrKCGX/
 FXRfur5jdE3FTi6YEKbQ5oYEXdclw/vUCtsczKD9pQqkYw6bEIpNbnqD/K+uGBhHVa3l
 hj4w==
X-Gm-Message-State: AOAM532bv+jzlVIxjBIhF45nKS5ymgMzIlDGuLgVDbPkgPjDIzL6O0d8
 mRqQFAX/OAce4HatPk/QXNg=
X-Google-Smtp-Source: ABdhPJwHLnaWduzznR4445DGO1uZiwlNxH5xDQYmlpXk/mmOnEUuf7Tpxrgpah5JChgfT7ZolOOVmg==
X-Received: by 2002:a05:600c:2742:: with SMTP id
 2mr919838wmw.136.1601326037053; 
 Mon, 28 Sep 2020 13:47:17 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 13:47:16 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Mon, 28 Sep 2020 22:47:07 +0200
Message-Id: <20200928204709.45746-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 5/7] drm/msm/a5xx: Fix VPC protect value in
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
index 6163c3b61a69..448fded571d3 100644
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

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1B27B691
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 22:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D6E6E156;
	Mon, 28 Sep 2020 20:47:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E916E156
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 20:47:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b79so2485529wmb.4
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 13:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VAXek25jtpefT57W6f2ieoFbKeRkwzBYBFbfBYFgMFQ=;
 b=HlSmtN3qAsaXa66jR0vokh6Lz9EEULyPGeLoPDbJuZG8A783rEruOVWIMPC/D9rE2y
 7AtWakZ9lNh23pv1qofxD6BlgbIhr/iQcl9dmaM/foNTI5xfaIVUAEk82IgFP+yGDvJ7
 HeUWIMNTOFCEtf3H7/GUC099cNuOCWcsBvJPprfKxG1tcxHQ/8uX2VWWL2HhI8vlqJ80
 sipSHx5TEb29x13VoAkRIFYMrRbwc016HGIJFvuOe1S2Twaio1ArGD+VQA22EpSFg5A6
 tJbduZznAi2i1ncWwIqR1moILvWGjX0YE9WnFL4CHBHhaWR6jV+mHBKOkOMsyuXLJmrr
 psyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VAXek25jtpefT57W6f2ieoFbKeRkwzBYBFbfBYFgMFQ=;
 b=T+IaEuUqKSBJh6X905nXnJn2ox7/kM9/WrIO5Zi9QxwqpSPrntZ/kXOWa2rIfR21EM
 vGjM+EIquCfYWQ6yC+ArskjWLUpFtudfycchy+MTULF8liB+UqpqBCIrLG2ZZIX/u8lF
 Tjd88aAnWXkel4ZBHLHb7c9E5mgBQKM73NO2a4nKnNrzf2XK+PGAn82cvJUNuSn7vFfl
 QkbnaEgZUxZknsYGWhNLFsL57JuFVjV/kGAAu5dA+bIGv3v1Ain54o8DM6D64QrwMnAg
 yE+Z+jv7sts7x70ftrVINDbnenm5X67eKM2iBIOw09kVWtimWWciyjrulikvn1btke9R
 jsxw==
X-Gm-Message-State: AOAM531x4woDUOTIqba6sfBC0YhA7FjPAuAdwoOoDY9YiN3YE+UE5YRn
 ULqhQRnSNqnwFok8bRXIjKQ=
X-Google-Smtp-Source: ABdhPJxFk4WhCEHF6JvTPb5ulS5tFeC+UJl80+kXrcBNXujIWb6/7EsQcyj2AvgKCVDLY1SycuvcAQ==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr981783wmj.174.1601326035960; 
 Mon, 28 Sep 2020 13:47:15 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 13:47:15 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Mon, 28 Sep 2020 22:47:06 +0200
Message-Id: <20200928204709.45746-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 4/7] drm/msm/a5xx: Reset VBIF before PC only
 on A510 and A530
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

Resetting the VBIF before power collapse is done to avoid getting
bogus FIFO entries during the suspend sequence or subsequent resume,
but this is doable only on Adreno 510 and Adreno 530, as the other
units will tendentially lock up.
Especially on Adreno 508, the GPU will show lockups and very bad
slownesses after processing the first frame.

Avoiding to execute the RBBM SW Reset before suspend will stop the
lockup issue from happening on at least Adreno 508/509/512.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index fd33a34961cc..6163c3b61a69 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1306,10 +1306,12 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 
 	/*
 	 * Reset the VBIF before power collapse to avoid issue with FIFO
-	 * entries
+	 * entries on Adreno A510 and A530 (the others will tend to lock up)
 	 */
-	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
-	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
+	if (adreno_is_a510(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
+		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
+		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
+	}
 
 	return msm_gpu_pm_suspend(gpu);
 }
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

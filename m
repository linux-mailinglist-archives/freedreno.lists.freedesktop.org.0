Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEEF27990E
	for <lists+freedreno@lfdr.de>; Sat, 26 Sep 2020 14:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083076E210;
	Sat, 26 Sep 2020 12:52:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857476E213
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 12:51:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so6823847wrm.9
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfU07Sm/xnGk1ZoqGi3z7IAKufG/nzCUlkWJYq8AY8E=;
 b=IzmQm6XbCQ69LpzKcQnuxob4HVKpjYiqdfqLjsIaRcZAMmkQkIn3BvISKHfk/iCC1r
 PyFNQ0ZGQyqBQECOlSP5Ii8Xye9vAp/tVeTZeipry5JoAOouu63UUipFnmQg5ainNyxn
 K04MVpXax6XxOTW4is5uLY0V2K9p6IYvput9Q3hRaPAobWrVVniKCJLbpyikrbWS6E1D
 UnlVEZ3byGqm2bmkH0rV2qag+phoVusP6M3RMiZRany0Q37pdfrhTbROzMBh38hv9isU
 Mg1gZ2AqiXBNIqsq497nzXSU6PRuXTQv8Tb2iDtwQ50+5gkXLaZmmCqSp3LmL6kFR5SQ
 zLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfU07Sm/xnGk1ZoqGi3z7IAKufG/nzCUlkWJYq8AY8E=;
 b=ndf+aEcgz3RMg8zQrIiHcEcOljWMqMS/jK7YIoMrIvAdsNqv6eO2tIXpvodyI+vLQi
 3PpKuHOIgN0I6keGt51gpqUTVpZBhuG4KynqY+p9J/ZnXOUAk8sh7FS6n10zfF0iIJvb
 kHb9JmjmS0Rk58lY8JASEAeoUJHCPWCWW9zJIhN6qzFGOrGaDrhWc4clT2xTX7xPeL3s
 TdVONnEHv2yMdup9yu4/b+oZWnZ/lylAwQboDSvKbhDXuEPN07tDFFi7mVtJC2yrgpeU
 UUFJRNI4QlawYTxptL9qAOsxPC5LhZ7ZOiQek8bKX4CLxXSi7CIOQfyhLZAYB/FX/eHk
 xfOg==
X-Gm-Message-State: AOAM532/TNreK2Jgi5RD3k+bN4INrnq+nmJZqnUAw8YeUcof9Vl23404
 fDizopvsvBUxlRiWAy2ntx0=
X-Google-Smtp-Source: ABdhPJymVrWyxKk8FPpBnafiDwxaLvCuGCbsK3Nt3czYF4XZeLZxOK6gm8PUJoJ+LrliQnqQ2ZLqCw==
X-Received: by 2002:adf:b306:: with SMTP id j6mr9029874wrd.279.1601124718190; 
 Sat, 26 Sep 2020 05:51:58 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 05:51:57 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Sat, 26 Sep 2020 14:51:43 +0200
Message-Id: <20200926125146.12859-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 4/7] drm/msm/a5xx: Reset VBIF before PC only on
 A510 and A530
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
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 9bcbf6cd5a28..00df5de3c8e3 100644
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

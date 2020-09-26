Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7368279914
	for <lists+freedreno@lfdr.de>; Sat, 26 Sep 2020 14:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEAA6E21B;
	Sat, 26 Sep 2020 12:52:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DD26E21D
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 12:52:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e16so6886404wrm.2
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=foqK6d6PeFS41hCQFnmZHZLvMNZeja8GwkTNzpenNPE=;
 b=HZ5zxkP2mVnrLayUJOr3gUjOa49srhi8RntJAa++LZmdX4rp3uW0qGuZBgLxsOBB14
 qOJ8QQqciOxgx6cjavko9c0jfKNfSyAKC02HUBiwGszIzhTG9jf8O7Vmq7uTm/acLfPo
 6G1n9WMFR0r/PxgAYrmlQZDp0lcqDTq4Q0D+2Vjg3GghubLw2PPsl8x9qOYkab1LTl7h
 4k4YlEGyVYrCFXpDvdQ05hGKmVqqeJhaj6i0YS1a9vLC3aD40D7/1+V2wDmJ90K7GPw0
 W23gaq6402ta5qnpbhx4eISlTXdHEOleAHtnPofynlrq/zr0fuGyx5liHS7gm1f1t9Va
 9YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=foqK6d6PeFS41hCQFnmZHZLvMNZeja8GwkTNzpenNPE=;
 b=eOQF8P0ThwvBU7GRe2h5fU7FkxWqzFwdZM1zQ2xpP8ENr73tawGm0FTh3z1UdS3RW2
 Xm1bczf4jtm/+NY6yGLpQanhF5dZqRUWw7By1r4rutipEYPXLRbXCl9bVYHZHs18IbL6
 YiZMAtoRPOQJJahsyHq0GfRoAQ/F9XRnMIim4WQlsEX21aRmHJDWeV3hTtis0D4H62du
 VILgt/CvsQajs2zxYAZkuIyo2dL7120nyKE6XafGajzQygM9VOZp+drtZRTZXb5dgjji
 IeeYKDP2msSa0n8hAOqJC1C7T7Dl8aGUmMcgUDXl0qRQDFJ42i2MeHk4YALDnxL7B7P3
 K6mA==
X-Gm-Message-State: AOAM5303+1NGJLWgr/1mXgaH2nsmAQNHteRPs/0BNv3S0Up66VQ0im2c
 xB9Br7PR51MnvOQKSxoyqo0=
X-Google-Smtp-Source: ABdhPJzj57ykvAkR8sPQK4WXT9fZ19k0L75upjkVIzxAPQQFacUyUnq9zlGMYnqhP+HWrKhHLLJlLw==
X-Received: by 2002:adf:cd05:: with SMTP id w5mr9428546wrm.62.1601124721243;
 Sat, 26 Sep 2020 05:52:01 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 05:52:00 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Sat, 26 Sep 2020 14:51:46 +0200
Message-Id: <20200926125146.12859-8-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 7/7] drm/msm/a5xx: Disable UCHE global filter
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
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index bdc852e7d979..71cd8a3a6bf1 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -722,6 +722,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	    adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
+	/* Disable UCHE global filter as SP can invalidate/flush independently */
+	gpu_write(gpu, 0x00000E81, BIT(29));
+
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

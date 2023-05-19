Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6918709839
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 15:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7EE10E1BA;
	Fri, 19 May 2023 13:29:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D96310E1BA
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 13:29:21 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af28303127so3964971fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684502959; x=1687094959;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TYnjMvr3c+U3gEgGMSSumyjYrLuRnotb/3F/SfKgnsc=;
 b=DMQ+agUAp0tVNmLZx211/kwHmQhA3PYSkImSPr1de5DG9lEgq4alZSaX6p95SAz3hY
 wv5c0046bZQXHumWaK2qLFuu9YlwglpXq5VYYKSyvvfj11lEsBbJB0XXM/LtW86BRw9J
 wGqE4SFkPaAA6+Wkr4Zv1VN3iyvR8r9wpjIVSxDdcXhyeaA9/SzEqB5G5GXNi9AJ459+
 vbzCYVPIYayYu5WstLPBayYQ43XAeLBIuFdJCUGvYciPzHuCGzN3D7Q5AcxjKodpItPn
 8dpFD1sV4QTJB32OV7KrN2bOjx4m+FME77vyckxxcdPmNCMGbzz6I0AvTHGQtxBr6zrC
 lv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684502959; x=1687094959;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYnjMvr3c+U3gEgGMSSumyjYrLuRnotb/3F/SfKgnsc=;
 b=BLWida1RZzQb7jdT32DU9RHnHn5z6xX3i0LFvntd9xfWwXHbF3jM57gYLcMQyK285N
 T6vNTugk/rJSWIgpGwkoSjfmicikzCamPRY+xN7Pzi2pw4aOBhUiSroRvZfUW88TauNU
 TeplzUB+FVbVkDfDSTKW4KcvbAPIsgBnOn0oymLlOhYmYjR0D9ni3WZ3pNA9AfspH5bh
 mGxRGP1eUbvJ6zj84ll4nFFK1MQVVYOwaU37pQqkcBW7cDU8BIBOqYFtLDu61UU3ZkQ9
 7laayg/GPzMiu/FKf0P9WRyidDWy+mLBr28j/R/9L8f3+ouXVE+O5tAqRr52v5fpPlG0
 xH9Q==
X-Gm-Message-State: AC+VfDw3X0Li3wXc0Zt7WgMs586uJmmbwyAQTGc1zbZzLmlnm1S7mOhH
 cugnvBQLO9d6eA3tY98uGzZ5qA==
X-Google-Smtp-Source: ACHHUZ5cDeYWVr8xvST8PoQMix+57x6ScJ9roYt9vi67c3Tn2bAI3anfXwI9ebXVIc59lYyN5fbqXA==
X-Received: by 2002:a2e:888c:0:b0:2af:1760:e48e with SMTP id
 k12-20020a2e888c000000b002af1760e48emr720157lji.39.1684502959499; 
 Fri, 19 May 2023 06:29:19 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 06:29:19 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 15:29:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-2-5b9daa2b2cf0@linaro.org>
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=1118;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=aeaKOCz5rng2fUAGM03IzdiKTh6ymb1woS+RnpEksJ8=;
 b=AojotZIf3CpXJZMM9oyS1CcyqM0LpHMLBCu7/eIZPDvNXJwMkWZ1OAeVWc1n9mtAsxdc07emI
 ZIZAHobVZHLDjYoHqqKFAVyQIXDix5wXN5itsFsOLkXWGrHYgugQab/
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 2/6] drm/msm/a6xx: Explain CP_PROTECT_CNTL
 writes in a6xx_set_cp_protect
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We have the necessary information, so explain which bit does what.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9fb214f150dd..deed42675fe2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -771,9 +771,10 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	}
 
 	/*
-	 * Enable access protection to privileged registers, fault on an access
-	 * protect violation and select the last span to protect from the start
-	 * address all the way to the end of the register address space
+	 * BIT(0) - Enable access protection to privileged registers
+	 * BIT(1) - Enable fault on an access protect violation
+	 * BIT(3) - Select the last span to protect from the start
+	 * 	    address all the way to the end of the register address space
 	 */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3));
 

-- 
2.40.1


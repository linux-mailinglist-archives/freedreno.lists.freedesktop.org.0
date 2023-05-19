Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB170983F
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 15:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E942F10E217;
	Fri, 19 May 2023 13:29:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B383110E119
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 13:29:22 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2af2602848aso6310881fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684502960; x=1687094960;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=doFIHuCbi1YVLGjN4vxnw9b75i10GnebCx9q/QOL15k=;
 b=vpC3ulkASRqGn8JDBs5tnXu2hHqQIx4ICIOpPmVLaDtQLh9IcY1j2VIAg4oQTPi2VZ
 5+1WsiWBj47Au35av90euQMg8riW7tadqA1QMvKRCqt8Q2Pq2K2rKPQtTWV4kmvwTQqK
 S/WjN4MxV3mBkbDcbJ2upI+GVVpJGrsY4SmOEIZOGqauNhy7qFaSH6SmZ9s7IUCyUOo+
 gUuMN74J6bJ62kPEIICPLxEb5VnjMNdaHfzh4Fv1NFz2uXAcLHy4hOAU6PoSe2Cl/+ju
 LB8SRb767qiigjewmeKGZBr7UANxz4ACVhjSqRkZI5rn3qZTRpDMjlzRaBg/M2uS9N9z
 6NxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684502960; x=1687094960;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=doFIHuCbi1YVLGjN4vxnw9b75i10GnebCx9q/QOL15k=;
 b=O1GjLqzMAkwCFHjc9IeoFqGYPaDrXf9fCdiJjN8Q3M1PMOW0+PTXUE2wwiFhM4vOoM
 I1Lo2PIO7TTNLmoB8CWM9Dp/6pJ7Mwg/dB6XNtwc2+8Odl0ihG4WSWrVP/1fIzRSjCWl
 DbmqxkpMovxtKNkkWypmsgTwYIYpEmFvGzsK4ePJukBsoIPvbAW5cdMe14uybjZlF7Vd
 /yVZPxs0xhG+OePZx7q7wKDLq8DzCstvNf1ojWzfXrACBqC4qsZnXRLDGzTxO6tZhpVb
 BC6oBOy/btBVj5egVV1L+2bFcqky2sum4SyA9INI3+xRWBv8bpGTwogKN0L4SJ0aKvfm
 eb+w==
X-Gm-Message-State: AC+VfDzg/mBXcrGwnb8x5MKXQtAfF/dE42iH1RRPY9ZupVDBXTxFeB81
 Cq8Xw5KMtKZY9a0rvbLTYYFjNA==
X-Google-Smtp-Source: ACHHUZ50bmhAbe1oi24zRF/8KffXoT3mBKIYDg3bqRNVsvlHDe8AFm3aTVWehD8gfdv1uUdgzNLnqw==
X-Received: by 2002:a2e:9008:0:b0:2a8:e44e:c75a with SMTP id
 h8-20020a2e9008000000b002a8e44ec75amr701082ljg.32.1684502960706; 
 Fri, 19 May 2023 06:29:20 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 06:29:20 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 15:29:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-3-5b9daa2b2cf0@linaro.org>
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=1049;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3GlljK/1BVjiAo5f22OuFyyc96OvFEAFjCCjuTjlQ3o=;
 b=bKZaZzUq5kYs/sf4jVMg+tulUXXSPOs9cKM9Zmu9anxjshVp8a3LrjoUZMPM461mYhJbXqfEg
 qMBLVFezKetD8NdwTyoRO+QuKHUO87LXt8BxebSTJjMvJVRYH/9MjAv
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 3/6] drm/msm/a6xx: Skip empty protection
 ranges entries
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

Some specific SKUs leave certain protection range registers empty.
Allow for that behavior.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index deed42675fe2..8707e8b6ac7e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -778,8 +778,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	 */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3));
 
-	for (i = 0; i < count - 1; i++)
-		gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	for (i = 0; i < count - 1; i++) {
+		/* Intentionally skip writing to some registers */
+		if (regs[i])
+			gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	}
 	/* last CP_PROTECT to have "infinite" length on the last entry */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
 }

-- 
2.40.1


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1F6A0819
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 13:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B610EB70;
	Thu, 23 Feb 2023 12:07:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC72810EB63
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 12:07:03 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id by8so5680510ljb.7
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 04:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lA46aZrh7JCYvUJGH1T5gGM4L2e9gxBI/zaHD8a6wjk=;
 b=PLe/CyETO2EUnwf+RSH0AasNbKmauRLKJZfVsF/rZ8wTbqYkyXivHaxkJSBIaYklLl
 mXSEWRAmmedO4u3veoJWGwxXhv31NCGg5EINRW7oYMjvDDb0C2pxZh2vH4K3I2FydbkB
 kQ4x0eMi9iPBqhrGRCPudufga6EASZ3KsRVi+zD/drx3yp+ayUmrAXVTSxPxMZHbcb47
 J1FkZ5p9/gW/SeypDB9zoTHhBCxcC3/HGjHZivqQJMWqr2+zITSjqsi1GUdwilbHSTrr
 seiSQO2J3tRHSV5PVmKSd5+Rfk8sWHO3SdjCNOPls0T6fYRIWVUpTxTYinTjmX8bBsfM
 yGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lA46aZrh7JCYvUJGH1T5gGM4L2e9gxBI/zaHD8a6wjk=;
 b=tqydmQyu2ltlJ/Ql2cMFbcnmtduwOpt/asn3hKrZciXu3ED3pSPnuwD2hArdbcXf4I
 LnmlmFEKjMfforN6nBCDxDELBwehmpCiIfm+miWzx1GMel0e8nsoU9MBIjPdXX0zLgkJ
 hp+9WbI2W3Qn4RDOsC5/BLf5gNfqpugR8cSzJEKqrLIPpDa8m7RnJNzPuIxe6FXIb4SD
 22vL6kOIpD0Qbd/+ETZHeQQfSlbwoNd9lWho2NGyEbqJwUdqIM5bZA9BvGFg2nBdev+f
 Du9axk3JRXf07R3WtlVHIF1NooYSsv+PrBrKAOjrwwS0Se7lKVkvNmzgrduPYmyHY/c7
 ge7A==
X-Gm-Message-State: AO0yUKX/KrupP4MTfNIC6A7WAQy9Rzo0OkQ+itv9WAWR238BEwWEOLH9
 LenbvE2cBFqzUui2vEhijap4Ng==
X-Google-Smtp-Source: AK7set+CHgalowyj5yTDwXp4shf4MK+X8mGrcGSXDeYrdxSh4ZT5+FurVuiJmXfm9/N0mVoIX1ckRw==
X-Received: by 2002:a2e:2a05:0:b0:295:74f5:fca9 with SMTP id
 q5-20020a2e2a05000000b0029574f5fca9mr4053538ljq.52.1677154021821; 
 Thu, 23 Feb 2023 04:07:01 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:07:01 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-11-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1537;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hCBgixgGTAon5uyerbD5Cpz3ZfVWUwsgRU6VDM4lbJg=;
 b=WQwCOMyxeo5kheBgCM0VxNgh17+F1R0MH0YqZl78vG51ejYXErPbseGngBoqhQUd7ZGYqdbrbshh
 IRG3owX/BkNpZWSzlfYTiqEFhyFPkqvYknqsQDm8L7iv7K5ggZ41
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 11/15] drm/msm/a6xx: Fix some A619 tunables
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2c4afecdd213..eb24be772934 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1206,6 +1206,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1223,7 +1225,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);

-- 
2.39.2


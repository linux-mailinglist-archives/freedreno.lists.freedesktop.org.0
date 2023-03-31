Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3216D14BF
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 03:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C161E10F0CB;
	Fri, 31 Mar 2023 01:15:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F7810F0C1
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 01:14:58 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id t14so21500131ljd.5
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 18:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680225297;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p4o6oBmHnEhp5oKh/mixd7WOHYgf5ln4PuMXkA7t4Yg=;
 b=ilIG2XmxB/j7n7ATeF8zJTqz4zU2CrZAhUg7m4fK8Ct9T3JCf+UojRN2STUA6fj/N8
 e/MkIBwAqqo6YeNmch6+KcXlbjkcMAUlfRa7Xldldwc8qjrMo5N6relst0oYtxTgE2Jk
 QTkBQuHpXE/gWpk6a9g+S85Dybzo2/bHMMSUMJIdIGTEzZ7XzGN2Vta/lJAQHImrjJhl
 JFTY+vhLgHk578tIAu3AAKZnL/UnaAcT770w/MeJW706mdvvAWDujHuW4esZOhIxHUsQ
 8xqhryyHkDC92IcC+aQ/sbPw3jEVGQzL4EJ9NK+PHwlmSVNlNqlKVNK3JErawbNLRb8n
 OS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680225297;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4o6oBmHnEhp5oKh/mixd7WOHYgf5ln4PuMXkA7t4Yg=;
 b=X3ys8jpq+8OzC3nnvytsIHtICl3XbYDApfSZhQfA/2ZDTCuhGPbJJBJTe6Pvgd6BEm
 Y4xi/pYZZrG3nzRdtGnKY0VEJONZ6JY4Gk9Rv3dYHkacxNVP/Lod0kdSNvzD1zqY9OQ5
 +IAu1Y8A3lfGeSm1SghJMarBizEnll6/Swm8ZVoNwGlOuUAkv8PDAxdDG4mjnhWXYSLV
 jBs+graVKsWr4y1bovAGsLNkq8DneqywPy6al7Y1oKIByiso2Z/ITH3zOH1rL7Zk7JI3
 fAtc5UoWicXGsyI82vloccci1zEpTT6ej28X73u56h3ZxIcTlaY/P5kGwx2pEX091cSb
 n2TQ==
X-Gm-Message-State: AAQBX9fQX4HSq/hzEcZk6UcD5q+RMb7I7EVGyHIU9+70/ur3zntRYPpB
 jFEz2jbr7adNfEwSaShsHW2VHw==
X-Google-Smtp-Source: AKy350Y8pbW2rnifmrFP6LIvKRu4SZkzHXfmhAHRIISb+6+uRa6c0W7ynL15+xedRsg87Zo3jeaRGA==
X-Received: by 2002:a2e:aa1c:0:b0:2a1:9b6a:72b9 with SMTP id
 bf28-20020a2eaa1c000000b002a19b6a72b9mr2513568ljb.13.1680225297167; 
 Thu, 30 Mar 2023 18:14:57 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a2e7207000000b002986854f27dsm134573ljc.23.2023.03.30.18.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 18:14:56 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 03:14:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-konahana_speedbin-v3-1-2dede22dd7f7@linaro.org>
References: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
In-Reply-To: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680225294; l=1296;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VXMxl1zaALk2VQGZ0SUWZWF+pL7ypf/TNwlzN5n8NSU=;
 b=kdwkwRFUtJBE2RUvooae/psy8PkBqKZzpIRLEnDz0bWAFsqckUPcG6f+uXQfdlVlK+Uu7jLRej2i
 6iCqX4j7AjGitZ8xuD3j/PrE/IF9redU8LaK+IiBz+VU46aV/KQr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 1/5] drm/msm/a6xx: Add support for A640 speed
 binning
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
Cc: devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for matching QFPROM fuse values to get the correct speed bin
on A640 (SM8150) GPUs.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1e09777cce3f..663090973c1b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1890,6 +1890,16 @@ static u32 a619_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a640_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 1)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1915,6 +1925,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+		val = a640_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",

-- 
2.40.0


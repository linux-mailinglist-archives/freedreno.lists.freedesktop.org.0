Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45236D1334
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 01:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2923910F0C4;
	Thu, 30 Mar 2023 23:26:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056D410F0AC
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:46 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id by14so2113286ljb.12
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218744;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w/CadsX/cgR9x9hYinvKdUNqwtugIvIpkzu1IofxqH4=;
 b=D30vwFl9P7JOarfMELFS1sqqzu5IUG8n0KUVid85FdPQrOmJ3NTQxdPFDCUsWdtYsD
 L0wE3vWOmVsjxV3qHPMQq9W8LAKWgnt0ZKVqdXNyRYKZ5Ywku5nGZpa9KunzPOvGPutP
 oioxn89SMqtnuS4FhqTBb2YVfB0v+mfH7s+SL0Qqp4EJMRmsbRGK1DWm0X9a4W8/hTZf
 KzqAQIVzPYKwSxpFzvv555AU2SZlDQQw2fUfWfU+PAsk9LNmKz+oPVqp4Usa17KBJOhr
 WekSWu/P6cIDlffYLE/OzOpFoG/sfhD1HNnpS/uFrsE+yZH+IkLnEeJAN9XyN0a3h1A3
 aOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218744;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/CadsX/cgR9x9hYinvKdUNqwtugIvIpkzu1IofxqH4=;
 b=wwyjd963yl/FM/CW/Kyp62Q5YKZsVBmYH5e1TvuiO2gvaBSZR58mPvce/x9RpXeXgz
 K4TdkRtjxJw205UzG5oRfdPrwcNZOehw2BT8TEU4Ml39k+ITHPNCv9A5R6Q+1YSypN57
 SojqqxTpXrciDFpctBokRGJb/mCBbeRcIuVaVL4xCqXsZhwr/ABDBRqqW1K+HvyfHwlS
 +jcVpg7JQQohKpXvERErjiALlnrKIBQGBCuLEtOQeqwSezIFvSH5fGlJV0eyD0qGciWO
 EVClXq+GN3npm/0nnxcpnHLXDLe44ONQPeHyZHyxBjt+QeerXqFjdxm9oz2XJZfmve2r
 lflg==
X-Gm-Message-State: AAQBX9e+ibHJjQYvd2qKupRgubYLoUDsQAYELD/5A4ToZtk5FK3U2C5z
 Vbk1mCLlVS+qGoJywDIiNk6qBw==
X-Google-Smtp-Source: AKy350YK4ztKrKefYHEV/s1psOhuMEKBceMA6YunRcHxQRKnTSU+yVxtC9Sh2OPBHEqtL9iSsq9DyQ==
X-Received: by 2002:a2e:7019:0:b0:299:c03a:1cf9 with SMTP id
 l25-20020a2e7019000000b00299c03a1cf9mr7384502ljc.10.1680218744293; 
 Thu, 30 Mar 2023 16:25:44 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:43 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-15-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=1852;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=sRjMSX3RSLjg5O+bbZnBcjOb5P4ZXSSVfgLMBDfv6/0=;
 b=2byAdZ0K4ZJknmJ/po2ONEXUn7MAt5HV2jkFIX+85s9yPzd0JQUgigp/xUAsBjXyTePMMNqdtmwy
 6QK2s1SeAI6IPLE36ITrYG7f2atB6Yx8W5XnNuZs0n2jYAqiskVp
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v5 15/15] drm/msm/a6xx: Add A610 speedbin support
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
(trinket) and SM6225 (khaje). Trinket does not support speed binning
(only a single SKU exists) and we don't yet support khaje upstream.
Hence, add a fuse mapping table for bengal to allow for per-chip
frequency limiting.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c61b1c4090c5..7662104c740f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2153,6 +2153,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static u32 a610_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) three SoCs implementing A610: SM6125 (trinket),
+	 * SM6115 (bengal) and SM6225 (khaje). Trinket does not have speedbinning,
+	 * as only a single SKU exists and we don't support khaje upstream yet.
+	 * Hence, this matching table is only valid for bengal and can be easily
+	 * expanded if need be.
+	 */
+
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 206)
+		return 1;
+	else if (fuse == 200)
+		return 2;
+	else if (fuse == 157)
+		return 3;
+	else if (fuse == 127)
+		return 4;
+
+	return UINT_MAX;
+}
+
 static u32 a618_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2249,6 +2273,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_is_a610(adreno_gpu))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 

-- 
2.40.0


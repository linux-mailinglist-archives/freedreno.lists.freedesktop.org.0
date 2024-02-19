Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9FC85A4C8
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 14:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BF910E364;
	Mon, 19 Feb 2024 13:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="na2pTi/m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B308A10E3FE
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 13:36:16 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-563e6131140so3659729a12.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 05:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708349775; x=1708954575; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mjP12Zq06nby7HMeSJ/EUbYJ63ENO6BkYD8FuiAok6w=;
 b=na2pTi/mI7s7U1T6apxOaVnU6iWgMdLJAM6m2kHI92wWohW/GaLgha3yI3aKTzXAeP
 YaWxd6GAsiw6E74k5hiEHcytTxNMlxnjfTYkNUtyESHJKOncvVp7Kgbi+Mhlr0RAL4tc
 RTxeShY6qPVxQOkyPZ1hVgqtOiQMZ6PCL+aOyLDs6p0SDsjtg1W9qmVY2ikma8PwKTjp
 exyZKLL9/esk79B0kARkki5VOwn4sWho1FcYdNuKeW/Cl2qrxoNPPU5YVnNYCEwM+MnG
 SqVZ69UZxZV0KNuc+idE62o6ndzvmgPBEfQkWgzIFyWT42fSetBNbg92Sp1zbtSvMIg5
 LU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708349775; x=1708954575;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjP12Zq06nby7HMeSJ/EUbYJ63ENO6BkYD8FuiAok6w=;
 b=XUCTUFge1hK95XBXNbvCjSOyxj4FH1oZdBBjA0LQmnYCbLcYYRvjis8dEsOLWQUxvH
 R3KT3yhhY11EqTCB8d/zHEgZtEAayzWQU1N1cWd35HxVT1oDfkP7iqak7bn0Wf+koWlU
 QIJ8ggDDeLpwQ9wdqElw4eatdOtKtX/mZPQPn+88kEZzv+iElljxDStrQ0NUH/gDMszI
 dLhMKKn3AqKNJjaKYXA/REzB+CZzMU1nVAyIFgz24gbz5WIjEz5xxVxUVw1GLdL+ec+k
 2jGaPiM6v5iJv9dXoxfSZ9Y7gESeKArsLUnsS1X4yXfh1OcPZkQl2Gs3zG5ZEgHPWbpx
 xySw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQKw2hUjHMdx0/lVREEayAxbbqMF+pV+4+Y2HBq3maouFYaGgAMSqwlnvM6OOKLDsSgnHjD4uDqFJwxjiE0jT4vYvwUhi3Bfie14wPH3GL
X-Gm-Message-State: AOJu0YzjDW0wMoi7ltcDdy/7NRNNBmS+Bho84DT46jeSnm2fgIc/VOH7
 tYSeAJWvB7coO2lJcj3miF8t1H8fHdLPDwRA37ijSyHFHM1vgW8grW37DWEhbno=
X-Google-Smtp-Source: AGHT+IHMjM8WymNt4vEQq/mCWKYvpVNBNNxjTt8NZU0BjV3r5AoZ1THDhcM56s0PPBQZdIzF6HDHNg==
X-Received: by 2002:aa7:db59:0:b0:564:ad01:20b with SMTP id
 n25-20020aa7db59000000b00564ad01020bmr139795edt.25.1708349775056; 
 Mon, 19 Feb 2024 05:36:15 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 q29-20020a50cc9d000000b00563a3ff30basm2900168edi.59.2024.02.19.05.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 05:36:14 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Feb 2024 14:35:50 +0100
Subject: [PATCH 5/8] drm/msm/adreno: Add missing defines for A702
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v1-5-d260fa854707@linaro.org>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708349759; l=1379;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2VUaTHaFXwk9sVr7gsAachnQpNO5KMem0UoFA2HST7g=;
 b=uy8b7slouVEaFRzlMDQaQuGj6/EdLKuvoxlWss5WCvpYfkQIMuuko+sE6v3X1yKkbgzKjx7sS
 Sr/e/dPpNpcCFZmvXDeCJmc5sQgAXJeQ/E2oSh1XTeW54gedzNfKZ7t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add some defines required for A702. Can be substituted with a header
sync after merging mesa!27665 [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27665
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 863b5e3b0e67..1ec4dbc0e746 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1945,6 +1945,24 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
 
+#define REG_A6XX_RBBM_CLOCK_CNTL_FCHE				0x00000123
+
+#define REG_A6XX_RBBM_CLOCK_DELAY_FCHE				0x00000124
+
+#define REG_A6XX_RBBM_CLOCK_HYST_FCHE				0x00000125
+
+#define REG_A6XX_RBBM_CLOCK_CNTL_MHUB				0x00000126
+
+#define REG_A6XX_RBBM_CLOCK_DELAY_MHUB				0x00000127
+
+#define REG_A6XX_RBBM_CLOCK_HYST_MHUB				0x00000128
+
+#define REG_A6XX_RBBM_CLOCK_DELAY_GLC				0x00000129
+
+#define REG_A6XX_RBBM_CLOCK_HYST_GLC				0x0000012a
+
+#define REG_A6XX_RBBM_CLOCK_CNTL_GLC				0x0000012b
+
 #define REG_A7XX_RBBM_CLOCK_HYST2_VFD				0x0000012f
 
 #define REG_A6XX_RBBM_LPAC_GBIF_CLIENT_QOS_CNTL			0x000005ff

-- 
2.43.2


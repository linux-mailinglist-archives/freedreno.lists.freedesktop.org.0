Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB2855DBD
	for <lists+freedreno@lfdr.de>; Thu, 15 Feb 2024 10:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5748D10E4BD;
	Thu, 15 Feb 2024 09:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RzZcA7EV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4A610E475
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 09:20:36 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-411a5a86078so5277195e9.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 01:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707988834; x=1708593634; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5ygFt5WEvBpqUpx/ZfEWpp/27W6mJ4fXmmus9YC0aao=;
 b=RzZcA7EVqDxCFWXB2PAl3MTx8/5IDtBrnBk5WBKgRtaxvKT47JVnIicXR7UP0bhdsn
 0H4Mm1X/118/97wKAECfJyhtJPV4D4AHtOdZxJk/grKT6+YMU/IlNa4dUmGn+8AJ8m5F
 olyGxnECCJv72envzwSjSKBnLpOWRzYrcvnxNn/m+PEW7wFiQKKwUtusPYd1luEH9bqG
 G6rKuCaHN2Xc1UemT4NRxTRI4C8SOwHeuSYouSZWEAUQHovrGSPhscg1RSNxGaqBma2h
 vxJfwoMU5GvpS/3clCbUZNktYZK1ZnhTQFHBAXS5iiELvJsJXBnWsuaWO9xnd1oV83vY
 Hsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707988834; x=1708593634;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ygFt5WEvBpqUpx/ZfEWpp/27W6mJ4fXmmus9YC0aao=;
 b=AAb/JQCwPMNuq9+/o0/iETTzaTsGh1iCNpIq7prauidpVS3b0i/zv7MYwQIFhe49V4
 XUfHl/AlBbteiwIVpwo/1r3bfVn0fTxj/u/2aAfPMpNRJvrdlUWoBZJ2/PToqOCvbxwx
 6C+4Y8fndOTfaRzCG9MQx07RtU0/mvccj7ytOlcwdzSyD3OIwkORq6c5mP+qFuEZGlyU
 hvOFkCQHlptIT44mOhdIuUVW+e/XTDKfkl0yrHiodasi8+gINayjQ/Fc3O6HauSzfQ/e
 2iKZ0Q110HJiswF7twhN69ur57ii0gIxFyvtBIUAQkvnzLTfjKx21+Vm/mZQWd8QCDmO
 B3ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn9gc5EE8UpZrkQrZlrjCGj9xWRZkqaQ4CDis1OWXggsR7TqInr4UXvBo/C3AuFmvMIYIf3wEoN65HqsVwqsKyU2TN4Gmy4EhoRqsiehuA
X-Gm-Message-State: AOJu0YzEhOi3fjeK7s+HJrF2LMRkP2USsRMWvsNPQh+54S5Y8qDIa3bY
 ZbkJY5Ho/xvQLx0GOuNew87PEKZc+A6NSjB4Lj3VajA9vzbcU+bC7IQbifIP0Hw=
X-Google-Smtp-Source: AGHT+IHr6EIY5IaqJsX6nTJIJL95gxp6F5b/cqLuuSuiPNhGAbkKg8Oqmhr9/MhVWmYu+JmkeXZw2A==
X-Received: by 2002:a5d:6205:0:b0:33b:131b:d8c1 with SMTP id
 y5-20020a5d6205000000b0033b131bd8c1mr830193wru.66.1707988834512; 
 Thu, 15 Feb 2024 01:20:34 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adfa388000000b0033b66c2d61esm1156435wrb.48.2024.02.15.01.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 01:20:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 15 Feb 2024 10:20:25 +0100
Subject: [PATCH v2 3/6] drm/msm/a6xx: Add missing regs for A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-topic-sm8650-gpu-v2-3-6be0b4bf2e09@linaro.org>
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B2VkxjrRCyr4kbi/Ih6iBNEXikEKFqg0faRJON0SE+g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlzddb1o2L2JxYU4dBpeU0HKoP1vroEL7LdMCezqtZ
 gfjwvXCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc3XWwAKCRB33NvayMhJ0YUkD/
 9qLaDOjrM6piXhQRYK/i3fQkR18QxDH9oUXsgK71P1WL7T/sD8NNMAoo703snTLkzqTlmnf4CXu1qd
 7lC7wxhiKxpQXO3B5GdZ/RKiesscwFJn44lVY1ybLECyxTldEu7k4RpkeZ+tslnzVw/D990cKWHViI
 2QbZ1/KogldxveyiRY8iPVTjJI/YB/JiKrDJlIKE9dKcwpurOIt9ezL05fCs4lejcvcKcgOup46guY
 wfSsjHyFzWkeiBAtuk0XPAuo3gGFrXIvWobHrEhfvArLoPVihzapOipOwP4LI5HMONmcQKIlyoWfFT
 OqOmbrHNHR9Zt7pUS589p/9EZIIARfbX7pXxHkd85yDxt05Xx2CBdAeN+R5ntmxOjthtvpyPpivqfV
 SRp8exyNiJo5PskG49xEhVPNK0lCuLMie/tA3EGzz65+7mHUDG4mHDUS1iFwIvi+ueq0k+gLOWj1pD
 NkmRfvclMXK7tW/tEEsdiRq9J0V7ff07QWwOo6Aht6u8nXT4PTl4QLU4HUL5l74RB37Y8u/VCe/xWc
 leZE6NwHMngwOo4np7EQUu2AeCyKefiFsCErQEs4CPecO2H6rRhfoZkBvc3g6hauQ45kln3lEoggnr
 6eog8DskhoUC+fXUOhab9hmCAba/BIQdkfLJuDMcrgJ5/2Mygit3ECp9JPiA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Sync missing regs for A750 clock gating control related registers
from Mesa a6xx.xml.h generated file.

Those registers were added in the !27576 merge request [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27576

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 863b5e3b0e67..58877464692a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1725,6 +1725,8 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_BLOCK_SW_RESET_CMD2			0x00000046
 
+#define REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL				0x000000ad
+
 #define REG_A6XX_RBBM_CLOCK_CNTL				0x000000ae
 
 #define REG_A6XX_RBBM_CLOCK_CNTL_SP0				0x000000b0
@@ -1939,12 +1941,19 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_CLOCK_HYST_HLSQ				0x0000011d
 
+#define REG_A7XX_RBBM_CGC_GLOBAL_LOAD_CMD			0x0000011e
+
+#define REG_A7XX_RBBM_CGC_P2S_TRIG_CMD				0x0000011f
+
 #define REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE			0x00000120
 
 #define REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE			0x00000121
 
 #define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
 
+#define REG_A7XX_RBBM_CGC_P2S_STATUS				0x00000122
+#define A7XX_RBBM_CGC_P2S_STATUS_TXDONE				0x00000001
+
 #define REG_A7XX_RBBM_CLOCK_HYST2_VFD				0x0000012f
 
 #define REG_A6XX_RBBM_LPAC_GBIF_CLIENT_QOS_CNTL			0x000005ff

-- 
2.34.1


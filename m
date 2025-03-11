Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D9A5CE8E
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 20:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E691E10E67D;
	Tue, 11 Mar 2025 19:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U/+QvCtc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D17A10E67D
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3912b75c0f2so337458f8f.0
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719768; x=1742324568; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ix+uU1xNjgf6yeJ0CN+CN8S9z1FXI/b+G+I98D4ytEI=;
 b=U/+QvCtcDJe3XZkCxOkCxOxVUfpqU+g0LJ2F7l4Hahkn4xWb4ltNX2j4XS0xPE9EBk
 fEI2WsyBBT4B47T6XdijR61/ix/JBGHi0zTDS/XO0lHge4Y7VE6y0iPUQlID+HWiHhvC
 cKDcYJwSUGnb5GTiL9lm0AqxN0z02AxsP38TsQREcipC7KrKm6fZbgSsx24s+yHBZBqF
 b950Rpmtuar8YL0tgZUn/i8XIfW24R1efUVDD8VvZupdjprDSM4naQDPxv74EAUyB9xE
 kkkIu/8XpV1UAgtJSs7kfXI61r/9ffieqsGPMK35MoK3QvOQpenTo6yEFCEF0+9l5aKt
 /UXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719768; x=1742324568;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ix+uU1xNjgf6yeJ0CN+CN8S9z1FXI/b+G+I98D4ytEI=;
 b=SaiLaAaDUnO9j0+FMSHytH/zaWSY8q8IeEP6QCwM+LPlVl90dfqhUoTlM1fgPr1/jq
 u9F4ulm9e2edVawFNI5jxebofHlchjDJEuDT5njgum/L7B5/x8OJ9ZT4QyfRuxCw1qG6
 ua0XRt8kyGCbM3+ZVCBTYc3XEieaYrPWW2aKPJ3FIhcJnR9yIRWl9Plr/qM9mniNYFWu
 UwjZzqX06fBKUlCcEAZYKxpz3KWo4CcCBsjeUdToyw2QLWtB+SuxhHb2Mfalm9jK1DKW
 L3a2sRgYGxfHk1iZJSq+U3CApqZtpZ9CZauwidslHhz2jYLmT0bLEF2TEAgISwAIKDS9
 ggGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVgtmgimljD1mMHyFI5GiheiIB0jf2NylTxMHWH+SggGQ3UENpye4LwhW9X9btyUr8IromV3fcNxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVGm+p5cec3VqSP4B2cgV8mC+DB+ibGd4ONEdKjXaJ3OQTZTsG
 Kug/OyWSDvw9hPNlIExDvrRZZNerjpR3i4PMvCT3ayVdXlTixy4h06nLDDb8poQ=
X-Gm-Gg: ASbGncvsCU24AVBJ7OTIl4Mc7NsUl1m+sW1O/+Yf5gWzw+XjgBUlCRelJoGQ32amOXY
 W/tzRhkzCe6iEmb682H3e66TPbMgEjFt1WmAWjRaehIpRUwlaOZ7idwkGhJyZUxCgHJlCPOK2l0
 gAY9Dib3opAqQUSZoYUn+lrFwicj2W2Q/VqjxewL1xYPvwDeiak4+gMzl1ryNZQp8H42hlZ+OAk
 XbAs0ubCXyUJexF4Cf+z1/gw54rbOMHXGkSaCowASM9pcEJvZd7Af0p3Yrhi/QNettJSuXrYTjG
 yrv/LUmnwVEDkxmVyGB5ADmbCtLvUDuLDhUC3E//31SUwF2qykYtyZ3lNN4=
X-Google-Smtp-Source: AGHT+IFJ2OFI5YZhOfkvAINV6IYwYgC6p9uLZV8JfzIM0FiUVQywYJMpVIcHgAsz7JA/MhP+jO6cBA==
X-Received: by 2002:a5d:64c9:0:b0:38d:c2f8:d914 with SMTP id
 ffacd0b85a97d-39263a0ad68mr1990391f8f.2.1741719767980; 
 Tue, 11 Mar 2025 12:02:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:02:02 +0100
Subject: [PATCH v4 12/19] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-12-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HpuEY64L0Fw1OnHLOTzTER9uuArLg4VhJ9JNiMiD75M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IivLsaIHqQgiO6+2cMYQjRG97Ch6IzMUYSp5
 tc7WaSfnJSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIrwAKCRDBN2bmhouD
 1+ZfD/wOIimq9hDJoUuy2MEqzcNyzOAa7I26LtwvTc+khsLz+/gD5VNQWbz9LUMVfnHzTqooqMN
 pQCui0f0sngHA3D7tmbaqAyKIrfJWQra/RgtxJGsNSkddI6itGQBWylNUVmEjca9qy9odfWtbAY
 XNz+9CrB6jEl/qmAHo0EFlSzyXvuQmfxmO1nHXyowiP15owVnd9K4spxswS/M7faYeJiq88vJCl
 9RDEx3q9s4DybG8/nMWQc6CxLszrvV+u6ym6341aZSvm9zunl9Utcf4foZCA4TFR6yC+k6ZKWcg
 4ipfHUqO/PM3XBI/j8fuFqzEZILiad75PRTL3OfUMVbOU0k/leTF64vw0CxgiuGD0ll2qUk7Hw4
 wt9lMEFlPvOGZmZXTY2W+3H5mumzdFUCS06KRJmMP9Xgx2d73q5l6R7ZQADmfTBqNaf/0IxjVdZ
 +lKIJHu2nnWJKN0CSPxkBxTSGZYuBW9fCIWlyhQRgWnXPvipZ//drvScYaPWvJo77aRFAogUEY0
 p6+dIR932XvHuhRKQbeOFoQpj3LiUYGahMtIgLJVHbntzTLu0wk4jWE5AacGFQMt2cGr9Umla7A
 gRtpEtHafBJRUzbqx8KaZg3ZrecmFukKUGLXN9CQ3QrlcGuG1Q5XBHst4vIu8g3TqkIEY/Rxz0A
 x+w8nXg97bw44pg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

MDSS/MDP v12 comes with new bits in flush registers (e.g.
MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2ce59ba50ffa0d14eaa07e993fadf0f218390ef1..3e5e1e09e9d00ade74371489b2b4e50e648e2d16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -261,6 +261,12 @@ static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
 	case LM_5:
 		ctx->pending_flush_mask |= BIT(20);
 		break;
+	case LM_6:
+		ctx->pending_flush_mask |= BIT(21);
+		break;
+	case LM_7:
+		ctx->pending_flush_mask |= BIT(27);
+		break;
 	default:
 		break;
 	}

-- 
2.43.0


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35609199E4
	for <lists+freedreno@lfdr.de>; Wed, 26 Jun 2024 23:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0F710E9B7;
	Wed, 26 Jun 2024 21:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rHU+iTzB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D7510E2C4
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:05 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so86318631fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438364; x=1720043164; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BJ6Ofnj59KCGRdS4jKTFy4IIJWcn+np9cmCpcqde7DA=;
 b=rHU+iTzBIvUwXOwjZWRiGEKwjU4u1pfidqpUTBMTHvHDxcSlDLnYWcE6ZZuWLShif0
 iJIf/vAGFohGRg7ZWh1/cUXBLq3jwdmmnpLriOF3H/lW+9EXQrNV50AEM7CVNST3xVyZ
 0mBiXLyeSyIrOycYNcV3LIqPdl/I+yeaSscHxCsLzUu8C+Ln/LReTwmkcI62gRuKbgbM
 H872R74+GhEw61hlOMnC6qE1+wx/vkbzadj5SsJgozYJPvzBNmY+VE4FgjMINDwc1JJU
 2N4w1ZS5aOopX9DRSU0qLQ42177ncgd5qRB6VDbs3hGDMu/swrkUGZ6m+1KBCKFUWHMN
 xRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438364; x=1720043164;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJ6Ofnj59KCGRdS4jKTFy4IIJWcn+np9cmCpcqde7DA=;
 b=qJLomDFoYzZu6stp+lm0EEpnh6J1r5pV2s12yq1/PH758N0p0B1FRE2Pa8MsGqlLlq
 OqCOS136g3lDaX/YP2+hqwqGk6YT9VJvjWZ8jhqOOAxUa1mgL2CO4+AOOL58XxR+4drN
 m1FrK+rQilajcBmtQK50i/4/TLprHYcKP8rkAZTzAxV7khIf6B6wrG8+V5EjX0ZJQtda
 LOPtWc27RlwUS84Nd+qhUhAjEUdXu4tFKyZUm8TffrsEX4iIK9/Av3YEuoYEGDnAz0Bn
 n0dCQyHbyEqklTzrRl9dPtNfffUMAWdrIQ+Gb1edmTieROVEVyhB5zcDoLThJQDNGCeQ
 wgjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOqAqqo7YLTswpMkQ8kHP2vdUQbV6EeTVBvu6TxaX/7pq6Ntj8coWc2GizDDuHycNA/PcREZBE+9xfhR8aAZIypVcXArgcB1u+44CPbORv
X-Gm-Message-State: AOJu0YwcOQmEegT3p394lfzCMTL04KyeLzXV3TyjKzgrYG76ZC7Y7A5k
 xZyOvk+M61wuXd1/vMLrXSkeeQWUemPXo891NaG55PIdzsKV5e+hHw8EmTEjffc=
X-Google-Smtp-Source: AGHT+IE915cZlH9nn699bYkq4F+smrZwnMAUSpyQaKba2INNBB2cS3+zbtnje0X61BPw/JSw3562AA==
X-Received: by 2002:a2e:3218:0:b0:2ec:55f3:40d with SMTP id
 38308e7fff4ca-2ec5b346102mr69215361fa.30.1719438363820; 
 Wed, 26 Jun 2024 14:46:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:55 +0300
Subject: [PATCH v5 01/12] drm/msm/dpu: limit QCM2290 to RGB formats only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-1-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AABfn+5Wuop9C4JWNFNmkXvAwigJm3H71KL3fIC108U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwYuYOCQf2HImzQBD039gclCXtQ4YiEg+N93
 3Wd7KLe4NaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGAAKCRCLPIo+Aiko
 1fffB/9KorMTaducYeo1F664LtegB//a9stV/tH9mH/NDSIYmWWPJ9YXsFT2gqxLjyDT4BqDsQT
 6byaCMtuVkc4sv5GWZ5KVzmJ5gKEiB6ionJJ9qeB4cphW7FC1ZnXiTzW+ZOi3dElbqHialO9juO
 SjAynXEHeTCZtxCf0R3td/h4hiD6MaAEmsKdTUpdfZgYVHZAcs3tqCDPT5HlrmcKBsdmwwYcY0H
 SEvg2QSTf3JFVUV0qhJCKXf3Ytfg/KzF+XUsLUPIReTKyjTZbmjcKQoifYaBYNdoLybFTe1IWs0
 5126eGHKCLripRExohwWuUcv5rEA2Ro3zpdgjrOq7UXOLpIQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The QCM2290 doesn't have CSC blocks, so it can not support YUV formats
even on ViG blocks. Fix the formats declared by _VIG_SBLK_NOSCALE().

Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index fc178ec73907..648c8d0a4c36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -308,8 +308,8 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
-	.format_list = plane_formats_yuv, \
-	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.format_list = plane_formats, \
+	.num_formats = ARRAY_SIZE(plane_formats), \
 	.virt_format_list = plane_formats, \
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}

-- 
2.39.2


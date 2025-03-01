Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFBA4A9F4
	for <lists+freedreno@lfdr.de>; Sat,  1 Mar 2025 10:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CF310E17C;
	Sat,  1 Mar 2025 09:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nLhQPO9Q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEF510E186
 for <freedreno@lists.freedesktop.org>; Sat,  1 Mar 2025 09:25:08 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-548409cd2a8so3051706e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 01 Mar 2025 01:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740821107; x=1741425907; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5ofpBUooPWWaBC1Mgfyuj8wcWUv2U0LtD4mwNGBXHw8=;
 b=nLhQPO9QNXy1O1JHzFPUgBAedUqzqG1QFFe44PsvFl0xykDxy4SrOGA2CqWdyQ5QTR
 gs7/vHsoPgnoyga2KJKfABlTmoDSK6gRhM1rFsxe66thlu7Y10NLn8JLWHF1J4sAnfoP
 eJnpi9mR1SjH/HzI97k110m6As3GOmJZOpMCGr24yglekUx1PeDFH/qsnCjRyr7e7I9y
 RM52BH9RHGEcQKqwmYwuLBzF3S81aDQPfJu+uh6oAxHfq5BdxIRc94mgCvPTawQQDuOJ
 awZou6/gt2Y4JfHhVCKuFN9zncfYdaPO8w3mGV8aq1BOLYBX78JZts6TjSguKP/vmedd
 7llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740821107; x=1741425907;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ofpBUooPWWaBC1Mgfyuj8wcWUv2U0LtD4mwNGBXHw8=;
 b=P3M3k6pVX22IpzOtjgAw7szuZsbPY2C1pkMkoKl0jt7DDRwOExhcrByYxBKWSM8RD2
 dsMfFHmerasZz9eJ8rG5w64Hfs4EpLJIcj0E+Jw5QDjLs1HkFqBxOl9fRY7FgaXAzcnp
 6YuTsDU9NOUdm6eELtyOpHGccAzWJWldukbMihppOpeyYp0jS+755sZNoqJgHs6xO9W3
 LA9AJf/BuQmiwq3YzxFrAgqnhRTnidAsXF1le7sOnp7XaCL2D7JE7oV7U3bUXH28CYri
 i8VJcGtJMLy5VbATvL4A2tbofOsH/B3WemDb9G4CARg/HwkXVFGUc+JhyOFTn+nmPxt7
 MJdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHh28G5TVInnlyGAPGGPi16ZBekv6SfxX8I8M0Nm3QSdspGCRpH9oAnd0Jvvr/2lnLOK8PiWFkVxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6EMdEda8AhfteQ6w5UxxWDusmEs4EuQbOWcmxfswJv6lOcI9u
 ARVkQjAX1IMxGm6xLRjAh4XGf7Z0bZbjIIduy9x1EdOx97AOzkVsVOOFtE2PEUQ=
X-Gm-Gg: ASbGncsSqrMcZ5WRbO6HLIYd4KVEJOOOHvWEysGXoopfS6Gkj4je7rZN7Ceh0MGlV6P
 23ig72/Gi/zoUTSfjMKgWmFPy+86YaF/v2Rs13PefP7bTTDD7Casfg9h1ShGihfRA8VWZmVu3ET
 RzakB5KSTd0eOAnXwUPRYIK3G+zp3xmHdlWWDfG6LMX54D92boOSJzLBLJhIzYuNyRpVAaecE6D
 UceK4xZCdM9i89QrliT8I/xRPBRLDuJhqj4YrACCQ7RM38Ju1ibTbHUJ9jKlEvaYi29SVyeuUww
 6tKfc2UoDFmLvXkaiPg6Ojmv0h7PLhpJMmDtGmc1/QVvO1aSocbb
X-Google-Smtp-Source: AGHT+IFTUhe/p95CZNKJGAqG1p7sHLGDOvpr/WdekUKr6EplX6n/Lb/C1JadtiI3JNxmPIfMMazmMw==
X-Received: by 2002:a05:6512:398e:b0:542:28b4:23ad with SMTP id
 2adb3069b0e04-5494c11b5a4mr3148909e87.16.1740821106875; 
 Sat, 01 Mar 2025 01:25:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 01:25:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 11:24:56 +0200
Subject: [PATCH v2 3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8953
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dpu-fix-catalog-v2-3-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3KiS1JFwz6siEC5WVugc4OTInSpbOeJ8pCpFDBbI8EA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/qhSxlfJgT2tZu2nzENWHi/au3+z5m5nxaGzpnq4P/Ne
 +WEhAKhTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMZK0cB8Pkny1u1dbz98w3
 jqnft7fvUZfdeRapjeq/K1zXCGwv+vQ5OyG287DkzhQThQ+v/q+/8fnkqYtWp3fMv2IRVqj3pWO
 /bnH/D3bTz8fuaeSapm81eBdUtT9AxPpnfFa/cuua0A7VyutlBVqXq+IP852//86N5bzHhf1X4z
 RbfgpM4Wn95bpEbabUKh3JPgURhfqQhtOhrh3yi9M3bF+4adsKE18Zl4QVlTpeD0O/qyrHyhz2F
 YhYXZh4e9/OzvjS1FldamaTroWLb89O8zlS9qU+eG0Xt49wLwePs27vhckxhZYPLU44bo7XTPHb
 NuthlVZG7Jz0I36mhz4Ksjea75xTLDPNZoWSVtGxWQavAA==
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

The MSM8953 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 14f36ea6ad0eb61e87f043437a8cd78bb1bde49c..04f2021a7bef1bdefee77ab34074c06713f80487 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),

-- 
2.39.5


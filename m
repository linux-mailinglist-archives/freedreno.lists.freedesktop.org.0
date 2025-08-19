Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4165B2B60C
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 03:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799C110E503;
	Tue, 19 Aug 2025 01:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eDAD3pL+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762D710E503
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 01:31:33 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b4746fd4793so1355378a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755567093; x=1756171893; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=eDAD3pL+Wv7mUmvk8UIAVcXXmu8+8rBOd06XdEVhQh4MbTBqLZxdP2NaVclDh7LrqZ
 H9RaEA4z/LGAwZg6s1lD1dXaqKWWqar7faTqsXLMc8yG7W0MA77j/Ddsppi0Lgkjt8aZ
 ViQabswzIWec/UlqSNKhufCcoDrvyrmclMsetFFsmt6boO9ih537dweGx8R53TE/iX9G
 +yCRlceBhjvS/wuqKS7CJT5lWPVOTyM/EyKHIfU9mPEmnZfQbJhMZvaNOf8PymfBvt6C
 DUFsg1bZeKTIGXFuApzbP8CqT38EuoKSlZYJG62i9wHIEpvuTPIOiQc1Stfc69C09n6P
 5cwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755567093; x=1756171893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=u3eOUNEUmvUSn4284EkOtBdm/7BtfATxk9soHEWdplx6MSy9Uqj7dt5G2+aZfm60MH
 i8xFyXH8d6HbXEzNL8oCXWTb9XAFeT9DALq5kVlenEFBub8JzlKnVt3+GY85apRLjASy
 yQURHkR85cfmdXGG7oPrXYB/1yd46xRH5gwkXaevu1gVCk0QLZEPCGL8FFQyIaOBYSjO
 aUHWKfXMreJdUKZE8lAOkCeeX+8pfo8kIgAzlABIuiOOZSeJSHiW/TWMeZQiHJrpzrT6
 cxr/yK0fudki2ah1ybb4Jv59c+pM1GqBEMyY4UQbSn19BoCoPxpiYwI3M0WjbcYNg4y9
 jIrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+LeBhAGgVOM1K03ZqmykviWnLMvS0Gs0OJ8sTUo8dQt78SNTAHuS1yWlGE+hPh5ykhPPZqZUEVuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK7Fx2Nk9k1ARyzJvaykkpwYEaLLJe163l2e0Vi86XQ0SgE44e
 CtD13rioIsuOdabax6pnYr7BPXlVdKL9rzFKus+kxyCSyasE+LgcDWWkifbpCsjzCZo=
X-Gm-Gg: ASbGncuup7DBC7TDZgf5s1ml8TKkTamTHn6KTtfLJhh3kYRUDmAzJwpRDokAvkM32hq
 cBcpKzRL6CR5YDU5Tp7JUh+28w14h+FfYfzM3QKwzSmDIuVnHykB1y40DIXszmVlJ1b1gBgxm3V
 8uT4RRkwjC/3bYLT78j//xfExitunt/LXs8MK5Vtzw7a6hZcEk7T9K3AroJvAkrbMY3A60oqlrs
 nLdIMDzOpAs/9hpMUULMtJnO5xtt8yHplvY4513BIJ/BEhv8sc91vSGRD0yZCCgVk9826Iyaq4A
 iW6cRI8Ccu8VsbZ+/4EuPrGv0KQlp8uNonz7tpBC6u3aW2q+V+c/6qzB0+bEJ8CW/KOjuFCtJq1
 h0tjVFeQ+IV86+xTosg==
X-Google-Smtp-Source: AGHT+IHVbtYW4RYQHQZZskiSfzFwAgdNTCMwz7Kd2QtknRvYYfJid2ZZhGW6Kqr8W4eOUL8j+y1ocw==
X-Received: by 2002:a17:902:e5d1:b0:234:ed31:fca7 with SMTP id
 d9443c01a7336-245e04ca7b3mr10841685ad.48.1755567092833; 
 Mon, 18 Aug 2025 18:31:32 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:31:32 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:30:59 +0800
Subject: [PATCH v15 05/13] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-5-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
 b=tjVmr1icovhUDDSu+7xCILY21LeUOkpXcuU8bCCTs9359a8eqqh7Ucze0DQ59Ne0RsSEPBbFS
 W+ASKuucYSxDL8++f36loqo0PdDJ1JBQt26jhvadshdJAR+5eZCiEmL
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b476d3c97ac9b6b4c5ca2963aa4a5805d57c8d7e..2d88d9129ec787df6dac70e6f4488ab77c6aeeed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1158,7 +1158,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1237,10 +1237,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1


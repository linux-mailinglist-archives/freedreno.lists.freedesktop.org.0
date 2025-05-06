Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1CAAC9F0
	for <lists+freedreno@lfdr.de>; Tue,  6 May 2025 17:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618ED10E6F3;
	Tue,  6 May 2025 15:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DTMOpgeN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1722B10E6F2
 for <freedreno@lists.freedesktop.org>; Tue,  6 May 2025 15:49:06 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-30332dfc820so6863557a91.2
 for <freedreno@lists.freedesktop.org>; Tue, 06 May 2025 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546545; x=1747151345; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mlujadKcoeKmC/n1ImzL34cvC3TJH9wSs5Ab3nngFQk=;
 b=DTMOpgeNE4dtk2ZC1+Uw/k+V7X/EC8cr2Cr9AN/LZChqG27c5Rd6UbuiyVDgSTLp0v
 zdQ2yBFRKM8oluWOUtbXXUlM3Yv5nL/jhtyMHMMuzebhs5CwjPb8lgF/Q7bFosJQLyZz
 CxcQKmBjpX4lSNm5Gb+wDuvWMZgMMxRns8c7Q71qdA5QB8O3cCySSxD5FnYjNVz9FKU3
 BzXSbKchCggVA4Pn357RVnmDPeoynDc4tuA/iYcSV/QaPpgwG12zQ72Uqk3LavEU5oY8
 c0vox5eerKy2yPUMJovvZaYa1Ix2AvvNTtiF8M74D75VsQG9iPISmQP3bUwsi97k1q+h
 yUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546545; x=1747151345;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlujadKcoeKmC/n1ImzL34cvC3TJH9wSs5Ab3nngFQk=;
 b=P4AZUfpDPfsfyjRKPJ3XT2KYJSQbjzeAuJQzbxw0d9mNoOztQ+6TdLxb5AQzAI8u2A
 VnSVHhCamLeZ2eVrWq17JVImWp8vZS5eFXccveJoT852P/IrMOoTu5Z551yZh+WaTqUi
 hZ5OaQkqU410bMWVUs4XVweCZtsZcnfL0Dh0jdQOxwBIB+kXfrJvUyOK9cGCVQ90CMVx
 TMvrOcvgI4XVntyKvU4Tl4vIfpaNLvXYQYu8DbCxXOw0OxbUqf0FvSDkSP8rViT268/X
 k8/KOA+fzBQ/0FcLlcNuWaWN3TWClGcPW6K2LnuU0gnKNb2xbW7/YfAtFRlDw6PbRJ3e
 AmGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyVIBXBkSehiv2otLrFPzZgYiptKj2pwDWGq8N29XNoI68zBhRgY461ruZU3L7m/RAKOUvxPEbhqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4f8ZFQ041dWC5x2E8qjdnWl1pzsEioC5H6ZKfrsKjkD7JgXLB
 tjEWONDDWfVfANxsEuSQODEh6trua2NxDrPJSM4LyA4bXUHncVzP870Q2oOYyo4=
X-Gm-Gg: ASbGncsa/dtuGuKf7ZjPhriwz5BCQPONbQyVcGJraQH6rGixt7j4LJfvleXuNvgAskr
 K7Qi7vidsWe31BjrjUa8sqtsIADWCFtmIr4PvoeRgwYNladTEWaVvPWFQVBmpsRibSh640Ngzis
 Ta2vIv7vM/xZ/i3Xcmv9MHdnsNkw1kKK5NN66sR1hjg1xjlLjDFcs4QVPiP+J50mY2P7+AU8+Yl
 RslaWY4Gz74fLrUJN9+r6IlsBL9QJnmS6JtS/40aFX1UB6GTzFGaSf5Oy4LylSvMU76U5uC6H3M
 VAD6lY24I04VGT8FLs7VK7q2Xc610yhq0Eseiw==
X-Google-Smtp-Source: AGHT+IFS6FZoJuDcTCvjasKd96JWhWXD/99BvVru50V8guYaaSYjpZZUDkxGXVJl5z1Bx8ea/lqMTQ==
X-Received: by 2002:a17:90b:3909:b0:309:eb54:9ea2 with SMTP id
 98e67ed59e1d1-30a7e1af162mr4218720a91.20.1746546545635; 
 Tue, 06 May 2025 08:49:05 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:49:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:40 +0800
Subject: [PATCH v9 10/14] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1599;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Yfa8LfJUqX0nGl+TeNHAer8ejcrj24FyRlRcXtmXu8E=;
 b=68OG/s/ha4iwdzGf/813VdpaYg/VDV1Y7XAOiTDn9rs/YFaOBSRRGyeV7PRqMDvSaSTWjbIOC
 mZADjlPu+Q+DcWqr1m/ArwQt4pYpEZKx8Idi4hVzDMNBARl6PXUIDEo
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

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3e4ff345bd6d9c0e2a08274874fac40690409cf0..a125a477404fdafee6495f6d3778160f14a01a96 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2372,7 +2373,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1


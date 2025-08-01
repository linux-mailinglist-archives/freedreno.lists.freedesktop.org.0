Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA46B1848C
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 17:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFEA10E8B0;
	Fri,  1 Aug 2025 15:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c7gA8oeA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587BB10E8B1
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 15:08:44 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b423036a317so1090230a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060924; x=1754665724; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=c7gA8oeApVypzYvNk6yvibQGFoPZRcxPH/1zkC1GbmPbVUnwzebWsORB82Rf7mJFrx
 Ph9BvWubvCA64ysV9I4zIlaZSPpam3sE05s0aAnPOS9+GZbSq3XtX27KVuyewYiMl6J0
 wLyq/xJpmCHYd0WWcPPfUThvYxzxt/69IKuzFrEEq8ul6So1uQzLKFzlX8DUMVCeZwn9
 pSuw88w6TXHzuyMLz8xmaNclcDS7NCJWVl+fj6+9OOTGTnhes7lM59GTbDYf5qYCP/Uk
 WtLSPjdVBmGFuD+mnme/OXlgZNWyoaemZ/rzDf57ivEbj7uc2yFh6tYcEpzLVXIrazdF
 90qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060924; x=1754665724;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=YZFX4n9YNcBGZCiQx1EYjtlqHlqOkqR/kMkZgoZGRYz+0xpu4N0NHpmHLg20Hozs9t
 yo9aaNMSL6oNyGHauHnvfDqzzJ2NF/B4L8sYcAgR+w2PPxAojiNwFYJFstaOXhn7gmk6
 TJVMUf64rJTwRjFLfPPG/2u+010vsOOlNXfzAnpq357ponx2568Go0LZifeVpfgkMVAa
 VrBN6BNHPan39uxLJ/ioo6d7FIZy/a+nSQZPBVwByjRWhZqPUtA7l1KaqvTB5YCWhznn
 mjYnq4nw4D8FmZvCWV2gCsBx6hqabI+XlMMAnTuKu585GK9Kpdtg8gBJqLpeWfjVQJ7W
 HRCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/M1ouKm4uvtD6o0c00NgkOK99XspXrvnbL4k7Vj8u0rCvYwSHyoRI3KvNANZHMXQM+g/sT2cu5j0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt5mjh5UFcZV2EebR8qB/6qUw5YCckkhjGE8e0FHAOffKpUixj
 w0Q0/dp1dV6eRMOUvEY9eqShkrdFPcgnDMJTGWXONujwPmpdPErgcKz/6Gkk6KUopw0=
X-Gm-Gg: ASbGnct+yJ9MyOtlVVtfUjyVz7D8E0pL5y7EIw86005Rw+dvpDiCK9nD5PvD/owd1RP
 vkNxy9TKNQezTeq4ShC+N0rNBZUU5b4Vnrvchxg28q7V97pIFneETU2j2AyN+1IQDghvB20/c/T
 XsaxIQPLSrSDlJWVUcKUHg8DKY1+7oxDt44/ewgDeoTLTYga7pV98UvJWJSmOztlsDNyG7VaQ8L
 Ju9Wp3yr3xl7XtOCFzT+AxbnxM3g2zfsueTnquv9huUhxd69khpi+ZbVy1RLZYSMHlZL35MmSCc
 bp83H9niUbKbZPEaZMvny18PYoZ59ySIJprX8CNqHW57ASJx7s6uY2dyYdmRFakuvj7f+irwwPg
 Tn4hH+OGuLcj6zYegJA1nhzwJA2Rd
X-Google-Smtp-Source: AGHT+IE9UAyxTpK4FvWv3OXz+ocPajVif5bxOvOmnO1SWRMqXt2SsxSVT4XeHmgC4TDkosdykSCiGw==
X-Received: by 2002:a17:903:1b45:b0:23e:3c33:6be8 with SMTP id
 d9443c01a7336-24096a636bbmr158574575ad.8.1754060923651; 
 Fri, 01 Aug 2025 08:08:43 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:08:43 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:33 +0800
Subject: [PATCH v14 09/13] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-9-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=Z+E7gfuNEZEyh4WTb79WFYqsnLg0ICLcdnjakTmbZ7RdMP3xs/RcV6+pAzmWVDpHSDX7boNRx
 ItHtGmVpMIDCSCe80J0k77eKAwbUpP/rS2yqTla9dZhdnhtR3pwPrMR
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2d88d9129ec787df6dac70e6f4488ab77c6aeeed..4616b360812491afbe63f8ffd4a57bc9604382e7 100644
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
@@ -2387,7 +2388,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1


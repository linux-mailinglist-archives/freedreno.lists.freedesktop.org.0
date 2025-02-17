Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DD9A385BA
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 15:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9C710E4DF;
	Mon, 17 Feb 2025 14:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iqmo/CCA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DBF10E4DF
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 14:16:57 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-220d398bea9so60594995ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801816; x=1740406616; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
 b=iqmo/CCA9iwKxyAPEbiJL0kuJcDL6sD9L38SjSLqQyaY1FmPa68DwlANsCigsj26V5
 YD9HV6sauJ4dAVw+xCdZwY5cz4bpvl94nEMY8ejhNIKzECQImJnRXQrK8aE/3euKCZRn
 oo7KmI2tbI/N7msRsYJPijXHaj2QysjD7fnib6/j3+zF/TxeguP4y81s2bKH92/Ga819
 JQKRYcd9ald6S+3tt1a5sTZyrWHOxv03eWgxPgM4yd+mnPMXx/Ivc3PAn0ryXja+lePx
 m7m1rfCfeRVXIEKTzPvbKJlZ+FwxKemKXbMMEIQV4vrrk7LFRTLGTnWoECnBYPS4Gj6B
 ZHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801816; x=1740406616;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
 b=PSrPjiBDnI4NlDjPzHki30btQqC9rvLr7MKzn7J0zw1AjsgBEK+jGWYJ1kaLpwod1H
 BdAmlXrVfEFT+xWd3bJJhUWSlYbyTtj0ijWN7FrjAIZwuAcYj20XPswYHucGaicZP1Zu
 MOL5QOBjZJH+7vwbb4MPI8itIEc589MtvVjFYNBb2UwBVaDa2UljYo0xeUg+VHSrpmh3
 cqw5JAhLUtrUBHDzWmAZJVoB2EGyAuMHvCZaDc926jnto7SfQIdBhpiGXKD89HRdfCPn
 g1NClSj4KrwRnwfaJAIQM8gWEhliETGEC6QtcVtMrZcfHktilSGTX/dd8ZloroK6e6gx
 8xHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX02zlCvijmmkhhPYWh3W2aiFrbL/qc5Md4Rzsnhb9WxTGUqdrqfPM+f+E76Q4EXSkrYrjlUfDWLVs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFMNzybI2CeKjNgkXPQxg4X4/z/CH2B3CecF0s3+0OQjtKMydn
 KCZerZEQQ9RGLDi9MmdMRrp/08ok9C9wbb9MSgTEyxgTb68y9M2FZFv58bYrDN8=
X-Gm-Gg: ASbGnctzGnSvO7t6uoeIcY3N9EleQ8qO+2HvtChHxRUewqsfVMNB7qF8j3n/CSRGqMr
 oa6mJpUJ14m3gUWt19URE03AM6TSXKk89S5tbmJlM0/ccqAsOTquQYYNU1L+RhyDL1l2hgLtG2K
 /REnXnkFg1gpbJxaw/tE1ZfVJ7PjDaqpio4i/GjCxvflsjV18OvgmIQYzNmKuPLSikM8MlPsxGm
 /KTpE8Ape76uM7D+kjfZ6+vP07UHJ6WT7NIQsHw15oyxPiKBt82i3vG14n5L2tgepXT7frmHVyy
 4ESaqbacfmFG
X-Google-Smtp-Source: AGHT+IEzS4KfqXP8Xt5GHMhRafBYz+RgwbGhXZbMd3m4c1JZ4WuTSy64hH8ktZu0531hH/zPEWjhCA==
X-Received: by 2002:a17:902:f802:b0:221:1c2:2012 with SMTP id
 d9443c01a7336-221040d8543mr122081405ad.49.1739801816584; 
 Mon, 17 Feb 2025 06:16:56 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:16:56 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:52 +0800
Subject: [PATCH v6 03/15] drm/msm/dpu: configure DSC per number in use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-3-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=2046;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OxydkO597ugBLy/eoQLhIhZIi3C8VBz20HvkW34FMds=;
 b=lhqZ5hF5B/LxqlpWvqkkYt16wWBab7XyL2JKhANDd8P3fXIeDeCBYNDuOWhE5D35Gixz8qzDh
 NTv0ao21qDWBwzxlK6RGvis1Oqq9uwC7CB3quezik71QV5Xd72QHSdn
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

Currently if DSC support is requested, the driver only supports using
2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
configure DSC engines in use, instead of the maximum number of DSC
engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c734d2c5790d2a8f5f20c4b5aa1e316062d9b34d..5b98ae96bf5d46872a7af801d4157820d72af01f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2027,11 +2027,11 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
-	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	int num_dsc = dpu_enc->num_dscs;
 	int this_frame_slices;
 	int intf_ip_w, enc_ip_w;
 	int dsc_common_mode;
@@ -2039,7 +2039,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	u32 initial_lines;
 	int i;
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (i = 0; i < num_dsc; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
@@ -2068,7 +2068,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	enc_ip_w = intf_ip_w / 2;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }

-- 
2.34.1


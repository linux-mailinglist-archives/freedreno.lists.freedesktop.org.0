Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB39963B7
	for <lists+freedreno@lfdr.de>; Wed,  9 Oct 2024 10:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691B010E696;
	Wed,  9 Oct 2024 08:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jfHYdrji";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5404610E699
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2024 08:50:30 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2e2a96b23e4so260733a91.2
 for <freedreno@lists.freedesktop.org>; Wed, 09 Oct 2024 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463830; x=1729068630; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c7bIuQoomWT/rx9ticSN25UJS+k6AR92dNlVIMn4xi0=;
 b=jfHYdrjirj3h1IUbtqAhGoelVJC7rpSCBkh+yzSsBgesXc2blDQbc7/I/ETx4FGvH4
 XdgVy4JBH1mWKY3WWiBb+p49kuSZX+p+W3g01bU0Sv4F4ymg68wxgmw2MdZsSOAoKIA+
 4s4H69FXpfTPA5W+4uO8db9XscyPqcmu2+1qZo9lOBQ2Gw3ZKNM8/UOqAOmGsgpoc9v3
 oZgMExUR8eqljWYBuNyjD0wTKLXB920PCSfkhaoZoNoyuBsH3WYK+T0SZLrTEt12tgba
 4mWYot0MOZl/PHRcOKFJVM2p8nPgK+fJ8RGyqkwNJqviW+JdXKepd5NjtcnEYh0E7IDL
 GR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463830; x=1729068630;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7bIuQoomWT/rx9ticSN25UJS+k6AR92dNlVIMn4xi0=;
 b=cnpSXkeq0bi4+6ckaWcIDfdd2+HsoE8KndD/rknsI7ZjCzcXR7HH92PcW4ilRtW7Nd
 Yx4mHo/VHVrKZeYQP6slUIE2N0ab/B88x1BdWxXyM9srnNuTl9sQGscRtOrqIJYJQF80
 if+EWSV5wqrCTTZwb8+XA+mlNj8VKNtPc8fLZvCTeuqCp9rkH7mi3SwKs1aYxJ5s0Cae
 CAoVDyNxDbJORxdoxphqrKo8eYGjbZP54IyqlecFDyLfWHSR4Ip9/IOTPEQDimtbsUpD
 1pScHzV95aWEikXTYdafFzWQOdTBDJXqj6B4Vk/Eb05IUHlstxVpT/pYNZRlCR9kwjXr
 yMiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhaqKTceTLxsyeydnl6SOCcpSGD5ZJzrHADRLigbzXeSE5loKhgFJbY7d7MD2YrTzuQ48CS2WJw6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+cnrhfFshZAd6Rv2rpCVZwS66AhG32HlAoPkJpzoKAkmqa22b
 MaEbHg/7YvUhUcASGR14Vp2TlkDk/2U1Z8zDQ3idEdCUdWK5jrHR8xljDnoQXCs=
X-Google-Smtp-Source: AGHT+IESUTwygnYBSZdBsUDXgtACJ/v1ab4RJl/GTGW8J3oCmqBYI3AAq2s4v5mchDc9OY7NZ7CVOQ==
X-Received: by 2002:a17:90a:cb01:b0:2e2:9314:2785 with SMTP id
 98e67ed59e1d1-2e2a21ef23cmr2286037a91.5.1728463829841; 
 Wed, 09 Oct 2024 01:50:29 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:50:29 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:14 +0800
Subject: [PATCH v2 01/14] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-1-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1834;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=AOnvev//l48K9poLpI3b2jyK6oiNPwqIXWbViweShqc=;
 b=ZoaNma48RD560N7Wpt6QTcmjBW200b4i9cEzu0XKgwNwqPVL8i7T69/tEfkxovejkPIu+Mr28
 li84Bu4qOo4AR+M+tDz5CECNYXgVmRhxQvGYnbyCwDuNNtvMOBsqH7e
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

Add resource allocation type info.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 15b42a6683639..2b03ab907c2bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -778,6 +778,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "none",
+};
+
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
@@ -828,13 +843,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52729F7611
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 08:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A910E33B;
	Thu, 19 Dec 2024 07:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ifndbKNj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C6C10ECA1
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 07:49:40 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-21670dce0a7so5440415ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 23:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594580; x=1735199380; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4KnECnBShXY3h8fLirhSC2vujN3PJRN+mScj8HCQ30M=;
 b=ifndbKNj1Cdmj3PUqU8wVrFj0tPTxYpSvzbnuKG3NLXK4MULhamEmJqnep+hxkyuT2
 YjP8an56CSMv8cydcLjTxh+xDaoGkLIlPzUE+gah0pVBWdrHtrOP/mxbXMPTMvnjAAkE
 tOJHmWNmmTpn/rmEIfAUxInqE+owjflXrcZaoodlePsa3Fz7qxuv9gn1eR1jdsGu7Q5X
 cRBkM9u1Phme9jQDOriOwT76gv1nv0v5C7ZHYi1C9E+GAncpmzIQuJFb17ZNWU7Ipdu5
 s7Km2jy6iARB2KzFk5PWey56PBPnd7xkBpiFXxWaWy8krpzQgsfHFffEhTJymOWf6Kr5
 So2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594580; x=1735199380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KnECnBShXY3h8fLirhSC2vujN3PJRN+mScj8HCQ30M=;
 b=kTZtoOAJ73m/nJdcVqBXWtutswr5RRnJQRPK5Q5rXgC7idyZ3u9tFatP3juq7OCpZ0
 eLATXLfcUMRFDBDyAdCxQIsJ3tptJvKKg3sHPeETHZsWnopC9HiO6S6lqxiIUBrYiihJ
 kHzplMXpuL3Ci3bb6NBeScQM7CH9SVYaL9ScLBT/nE64FVjO3x5FCJHc387Im3MU7o2A
 O7ESfsQEjMyBubvAzrb6JjDWuT7Dm8GhfiiDCF2WFt8ZcNde7H54iuu2Eq+Sh8Lv+IUB
 lrm6TrmztkogxEPQnBv2NO/9vGkG+FncY4oCAv3QK49vlP0b95ULOcwEUpckPo/dh/oH
 9G0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6o4K9cTGRHqwB1kvgpdtmdYLagzcm7YSNFyPeUaCdrbinpziJKrvpm32os0+5g7cjcBkhyh1ZH6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgunDzXJHXNmNc6QqQ3nuvEgjN4/dK/web/CSMU3umAC+b1EFV
 KQSIjf3njTpFoWaDjfuKGm/yRuoWEQEAbJ2QgT2rTIXFUhet1QJEl+8ybUnBIA4=
X-Gm-Gg: ASbGncsT/DwpSUmsJxtVkSkbF1+qchYsY+XteVaxagPMJBEqcbZOoO1ZoZ4m01tTH7F
 Lc2TKkTnElbAxgWAxXxOiiAtdeq/ioA5X8jd0whaEiAFQzs7dmJUj42Hu2j9obiG67JXVLRxlQJ
 OdXzzmnh+F+oKjiAND+r2gbVJROWJgwg3Z5zTQHTMqKtXZ5GhCNxEmavyiXpwbf9ay8MvxFxob5
 ii0VwdpkO+aMLdB2zMZsF36LlILxD9SWRk/9fgvds7jk4VBAfJgxQ==
X-Google-Smtp-Source: AGHT+IEabF9aXtQp3aenhR64WxS1g9cOj/1L2FSLUAESIqxrn8JkRWX1Txmn+76M6Wb3sexpEyps+Q==
X-Received: by 2002:a17:902:d483:b0:216:3c36:69a7 with SMTP id
 d9443c01a7336-219d96e8fb1mr29034205ad.45.1734594579793; 
 Wed, 18 Dec 2024 23:49:39 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:49:39 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:19 +0800
Subject: [PATCH v3 01/15] drm/msm/dpu: Do not fix number of DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-1-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594567; l=1800;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=H71UugjG5IQJFjXijgWx29ezewCBoV9AAKOOrWRKHwk=;
 b=dUzlSdGY5e36I0gVxFwpQEvjNoLa0A1wdKlZECUaxHkjySXlll3b9Uyws+NzCj8x2f+Y9BgKm
 sggNoaJFPFdAts/tP1G4bwB5pARZ8tdxN6l7vnKa8WC8Acwxaq2KQoZ
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

If DSC is enabled, the only case is with 2 DSC engines so far. More
usage case will be added, such as 4 DSC in 4:4:2 topoplogy.
So get real number of DSCs to decide whether DSC merge is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ddc60e658d63f..650df585138cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @num_dscs:			Number of DSCs in use
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -204,6 +205,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 num_dscs;
 
 	bool wide_bus_en;
 
@@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_enc->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
+	dpu_enc->num_dscs = num_dsc;
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||

-- 
2.34.1


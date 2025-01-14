Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408F9A10B99
	for <lists+freedreno@lfdr.de>; Tue, 14 Jan 2025 17:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2172F10E12A;
	Tue, 14 Jan 2025 16:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QwU5ADGO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A383610E3C4
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jan 2025 16:00:04 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa659775dd5so82411766b.0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jan 2025 08:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736870403; x=1737475203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=036P+TMXTDmBCcuo6XqZkVW5lvGpV28GsgySqY677wI=;
 b=QwU5ADGO9U67n7X6M5OeR3gmiRt0FYDhqW80tw/pblk6JXeLuZSTHFSLgMikd+mvSc
 xe3YRxKgxDmc5c8RclwaOorWIszgBD7MYU9hie4ULLOw9xvoaFG6KLYgiypvOrQSUxKd
 UZBGT5EEGVrdKwv8EozjjbMLHA+sZuB81I16D92ARg6EsYrZ+bXfSe/hkyxwYOd2v6LA
 NORnhSCCjXF2gHbHpVhtDqZpLbiKyrTa2ILdlTipFVbvw/gkFKa1rUsqpCej4a0Om5IW
 ND49iDM5GHYAW1oITOxoDcdUdX9DffsqVUaflHa4osDmfLgt87+S2ONuLlfe6SPd4SeQ
 Lpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736870403; x=1737475203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=036P+TMXTDmBCcuo6XqZkVW5lvGpV28GsgySqY677wI=;
 b=W0nLz7kWfZIsonvnLRo3NO9vFalaxpzuUoxSmfXksuvsBw0905I9fpRaz3vsHpR1Bo
 M/qzElgzFsLOuQNY5XKrb8iMUfaCS8kxbVqr+P0FdNwBcBnymRZh8Jf7X0AY8dzicOy0
 Zs+eumKFdSKNFC3d5kvmQ9DYGohawh0z6raLbUjCFWOwjtoyANYlDyaA/WdzYO6UuPBo
 DLwP0DtUdTnJRZ+Vjm0tGxaTH2vg1tORaXrqMz569ZNhclUyo68SxyhQwXaW/UNdqBlf
 xItkhz4TsDCGrhQpdlEVDqJJtsVfBzBqaiFi36nxou87QkYyPQy/QddmzGEAvngAdL5z
 hWPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWROsGD98ZNV941O6X7itM6PFnS95Go13JlHcb+LtuX78upD47NpMzqnBXTuEHrCDkaNO3Yfglew00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw36AUqslT4WGSLC+WGMfKdNxxMwKOJ9Mz883YDoHHQl8Y47nqO
 G0+ZlO3ReL7UzfV4MM2OYR6biR3PIxgypLsS1HFJwuHF1JzNy+SzW4u6eENP14E=
X-Gm-Gg: ASbGncvMZJKqgkLpytZ/u3+5w4VI7HBXK0IpJpyXZ2hVB2YazRgXVxVWVBR/ymGlpE3
 6jH2wf1qt/h8Qjw8In3Ti7SnmjSyQPGSuQMQ/oaXNwHDsJo+UBmA83nI3zNrM+dHEVM4RZ2MItz
 Svngsbc9g/AC62X4aAIxgfEbQeQ2zmtbZaTReVZenIiDKDLqLQaTPc3yCFGYz3ILzLWuOkrp8/K
 5mjp1ZoJCke9HXxc74f5YKEVtV8toR0LrfljTFjGdrpRyMCmNMaA3oj+TsxyshTTrkq0Fk=
X-Google-Smtp-Source: AGHT+IG7PMlVz7CMMGWaY0OGnnMJa79kLHXPYfRYGus1Svu/ubNikdklVMAggGNIsgi/jcBKMo4Vmg==
X-Received: by 2002:a17:907:97c6:b0:aa6:79e6:5b03 with SMTP id
 a640c23a62f3a-ab2ab5759b6mr916847166b.6.1736870403102; 
 Tue, 14 Jan 2025 08:00:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af424sm651908666b.137.2025.01.14.08.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 08:00:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/msm/dpu: Simplify using local 'ctl' variable
Date: Tue, 14 Jan 2025 16:59:59 +0100
Message-ID: <20250114155959.583889-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In few places we store 'phys_enc->hw_ctl' to local 'ctl' variable so use
it everywhere.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 ++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea99..702e344f5aad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2183,8 +2183,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	memset(&mixer, 0, sizeof(mixer));
 
 	/* reset all mixers for this encoder */
-	if (phys_enc->hw_ctl->ops.clear_all_blendstages)
-		phys_enc->hw_ctl->ops.clear_all_blendstages(phys_enc->hw_ctl);
+	if (ctl->ops.clear_all_blendstages)
+		ctl->ops.clear_all_blendstages(ctl);
 
 	global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
 
@@ -2193,12 +2193,12 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 
 	for (i = 0; i < num_lm; i++) {
 		hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
-		if (phys_enc->hw_ctl->ops.update_pending_flush_mixer)
-			phys_enc->hw_ctl->ops.update_pending_flush_mixer(ctl, hw_mixer[i]->idx);
+		if (ctl->ops.update_pending_flush_mixer)
+			ctl->ops.update_pending_flush_mixer(ctl, hw_mixer[i]->idx);
 
 		/* clear all blendstages */
-		if (phys_enc->hw_ctl->ops.setup_blendstage)
-			phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+		if (ctl->ops.setup_blendstage)
+			ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
 	}
 }
 
@@ -2250,7 +2250,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 
-	phys_enc->hw_ctl->ops.reset(ctl);
+	ctl->ops.reset(ctl);
 
 	dpu_encoder_helper_reset_mixers(phys_enc);
 
@@ -2265,8 +2265,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, PINGPONG_NONE);
 
 		/* mark WB flush as pending */
-		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
-			phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
+		if (ctl->ops.update_pending_flush_wb)
+			ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
 	} else {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
@@ -2275,8 +2275,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 						PINGPONG_NONE);
 
 			/* mark INTF flush as pending */
-			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
-				phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
+			if (ctl->ops.update_pending_flush_intf)
+				ctl->ops.update_pending_flush_intf(ctl,
 						dpu_enc->phys_encs[i]->hw_intf->idx);
 		}
 	}
@@ -2285,8 +2285,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d) {
 		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
 				BLEND_3D_NONE);
-		if (phys_enc->hw_ctl->ops.update_pending_flush_merge_3d)
-			phys_enc->hw_ctl->ops.update_pending_flush_merge_3d(ctl,
+		if (ctl->ops.update_pending_flush_merge_3d)
+			ctl->ops.update_pending_flush_merge_3d(ctl,
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
@@ -2294,9 +2294,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
 			phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
 								PINGPONG_NONE);
-		if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
-			phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl,
-								       phys_enc->hw_cdm->idx);
+		if (ctl->ops.update_pending_flush_cdm)
+			ctl->ops.update_pending_flush_cdm(ctl,
+							  phys_enc->hw_cdm->idx);
 	}
 
 	if (dpu_enc->dsc) {
-- 
2.43.0


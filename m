Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02DA45F1F
	for <lists+freedreno@lfdr.de>; Wed, 26 Feb 2025 13:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C21110E2CD;
	Wed, 26 Feb 2025 12:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fuOMq9NF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C1210E2CC
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 12:32:28 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2fc291f7ddbso10783842a91.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 04:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573148; x=1741177948; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rajdpuATf4cHrwTeJ8T+ZsyTPgo2DiGPUjAIn6iu1Wg=;
 b=fuOMq9NF1MOcfCejM5EK/nrAUl5VyWlz6QptdV21aP+pLVHfjpV9wOzrxNwvAsfRAz
 P5l/+5yRzX9juDT1ZBg/XebZQgZtDB393E0pvNndH8PsqY+ifTWLjVNoMPyCqROP2ZD+
 ut28DpiG5LBdhfJi4LxSYt6t7Xk9zpXI07UlS6nFwee1YBvIScF6AppJVthDu068WlBC
 sntbyjfKzdNyq5e50XVMQYz3IkJHiR4FZloFKlY9fwq7Ldcr/x5GurJSTnuGAxZpA5wc
 YhvRIKoyoKBVVRRT+UJsLrAMjey6UOg2JNVevyvktpASiAP5eaG9fCWmKNmeIXvejfkN
 f5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573148; x=1741177948;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rajdpuATf4cHrwTeJ8T+ZsyTPgo2DiGPUjAIn6iu1Wg=;
 b=fQTY/hshMe7mSHxJOuu8CiLkcKA+YHvgzvTm6JkfmUwuxVaNamsHpgEbDpYaFhjpKf
 F35e7bDZ/vjmOrl3lw5X1MIhqIAwtVedUdtLjtcO5LOqF+meLf4L+gscyEqeY2MFFvl2
 s3Na67OGvdrYubdrGr466HbqfoWStH1OFzX9+23rdDkHQeq3kxq01/TlsRUJirZG2Ahp
 vPmmAcpRVDpxzBHl2gZBMCLUTjQaLqalrtvpLstjnJvbLP/VPvMZ57Swft31o5CeVJmt
 fOdq12eRd446R2+5/Nr9aZ9nMKBk7Aoy0JuQv371uuOWQsE6G9L3xVyZc2pooAcsSV6v
 0F1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSiCzln6oPbFE8gbqwbae5YLxgPsp2Xv43rkPeTrthbV2UNDhXQjt+xGGkoZd0E8wR5Har8/ovvs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPci+HCmgKbYcDiBUyLjOMOKVJsZrI51eh1czf/us11wKzKbB+
 2OEfTDp1jQAnwBun5eRtR1lksSL0ZDNhjXuLc0CDtReQ8gOFldLkuVqGJiU8feQ=
X-Gm-Gg: ASbGncsTorny2MSzaYI9FmO5DbSKeAhHFSZ8Ar0PiBA2W8Vejd0mdhJnVhHREV87qhH
 VI+SCFmKiJeerPVAKMVb4ML+BlYREvErLemxpM6B6uVnP7VQKV0Dt+a9bZbHi6P9WdzM8jLEXz/
 e/9aBc7e5URgrKZv7re3v5tN6EJOcvc8YCmwnIGYqQZHqjHkiUSlxxrK3h41VRBi8NCTBAwCddq
 yEiX7Pg0trxFxKroOQ/eyG9sgi8AWQlcB7DXGZzwhqcQ3kO/wzdZSIb7gtQaKE/T5dd4TKFp3rs
 MGz8cjXFg/4XqTk2lAq/kNE=
X-Google-Smtp-Source: AGHT+IF86x+3JtGSuvvDrydZiqFZ+wC9maj1cZbfnlplFjFOAng4eFAvvbksYNd/GXPBrK2GwFsO/w==
X-Received: by 2002:a17:90b:5688:b0:2ee:ab29:1a57 with SMTP id
 98e67ed59e1d1-2fe68ac9600mr11759074a91.2.1740573148497; 
 Wed, 26 Feb 2025 04:32:28 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:32:28 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:51 +0800
Subject: [PATCH v7 02/15] drm/msm/dpu: Do not fix number of DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-2-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=WBM/p7IonF+GUTkphvNqY034IFJPvXxbXKnpEjol144=;
 b=Gsx+uVZA8t1OCJerV0i6O0mFqa4gtWo0jTTX/YQL9ypeWl/c5RKdtbKT3JKuvGm4zZ4XPxNMy
 aytHLSBTtCjCyTWrMJfwQMQqfPn6Vvrn8/WLH7j/FH/BxC449gAust5
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

Currently, if DSC is enabled, only 2 DSC engines are supported so far.
More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
get the real number of DSCs to decide whether DSC merging is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eaac172141ede7bb4002ce1d0268b2f436fffc6c..c734d2c5790d2a8f5f20c4b5aa1e316062d9b34d 100644
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


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B1B84CF8
	for <lists+freedreno@lfdr.de>; Thu, 18 Sep 2025 15:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B236310E8A6;
	Thu, 18 Sep 2025 13:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KgQr0E8l";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EAE10E8A6
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 13:29:25 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-32eb45ab7a0so861848a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758202165; x=1758806965; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SW4I0bHOJyIFQFMrj5TK+GBNLfagwAY9utI2/PYagvo=;
 b=KgQr0E8lRb+kY+ksQxG5NC7yBZx3ZaqOrDBy/H4DqDRT+BWvIItLAV/1yecFPebGSU
 iwolHWnXfS1jfSiG8znquJ/5NUFxS5CRm8UUMrKO/kQ0WfFXlRxPUT6qrB6RC7ku9wiU
 AX9pwH4x3Lu9jJYZGoQeutei1I4MjtW6545LH4k7pkQFYvGag0GKLxjRtrAza253ykYJ
 xvNz4hq53zzK/mN1GjTwcPpNHaJd/d0qdLt//rUBoGH+Eon4jK0HYT6vCGW1L4VbWbOK
 orOH6RKLUnF/E4bvCus3OHny957Lh/zVyCdre2C9bpvTFRbA/WuEXfdj2svXJzaExqff
 yeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758202165; x=1758806965;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SW4I0bHOJyIFQFMrj5TK+GBNLfagwAY9utI2/PYagvo=;
 b=QkCgmxealWg6ZYTzgFg9YSIsQ3i/kDDviT5IALaE3eodc7myoBKrpfcPzLsXfnyzFn
 vVEJDRt81O3K0vnRhBYyEdBVmuoYAc9uDCyaemOIY8gABF3Wnih8zDM5/HZ3K+P0U9Jy
 aMYAppkg46xX+djj4sMHFHT8W8u8Rf59ln3hGZC6J6GqZHeZ/frPXvHJRQra80eixt08
 22UL3RwwHJGG6sdrYFFIy8N05aGznM2miIshFKqC4nXas7Yra0gpuvd+YKeTWsZorewL
 IS+M2nCgElx47gllsDgfXk9o0idTppO5bV+LVmiky3rYY0LqY6iqz8TgvG+DL+Eg4nSW
 vP8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHCvn8QhedKtR3WT/f69NviGr+f3niwFu00ZuLjYH1S8kLLfs9j6YhzcxZ8FoovkROa6cRDHErhFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFTSX19WKw3uukh2sdbYkzBch7JcEDj36fd/rrhQZtfwrGAE87
 lstX2ND78YPzo37V8c16eIQi8k8YeCx6CBZaKOwFQpvf28RcPvKr8bH5NcIbRC99UxA=
X-Gm-Gg: ASbGncsZjAVV0csjLkj2g/wST4A7iknVZU19uu2reOamhc2W7znOezOLmHUjSaf6aEj
 GN1yyIJ0qvE0aicRSwLySXrTGZCmRrsYgA60oQo/++sr79DZNviDv6u5HYx/X2xWoMRl5W8ZThH
 mz1sxo3Auig1KaRP/wMwVMJdbT6XOrdjNl8wWGh/BMuDavwzugg2umCsAgwstLUKnHy/Qw0VAq7
 oIBiMbdgpQBrmSSQiF2vZg8t2Cmmw/B/8MFDLqwBSYb7WmqapzT6cQSsUhGU8bJFeciRO7Aiuqo
 EoLunbEoGgnJaAf36r4F0VnqJEji07L1rhowj793HsKnh17SUuSzH5eH0IuXkfDgBtbPljVzOPE
 ZhyHWzefoqu3zUNcmpO8IzGGliH4ID/8Va1A=
X-Google-Smtp-Source: AGHT+IH2BOShDFL1Cf1QibDMgt7GXFKPflGMs+oalRPNEjL00mKNm0WKOv0PuLnvFP5Kmrkq4BfVkQ==
X-Received: by 2002:a17:90b:2249:b0:32e:96b1:fb56 with SMTP id
 98e67ed59e1d1-32ee3eaf849mr7991245a91.16.1758202165117; 
 Thu, 18 Sep 2025 06:29:25 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 06:29:24 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:54 +0800
Subject: [PATCH v16 02/10] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-2-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=f/Sw/vwQEvrkF3u6LWBntZd5AAvvANHPgf3CTk8y8Jw=;
 b=8qMPBs6WF+TiriJSLAoXhaLroMMsTySRuEA3zKlrDBrgXsBMnBiUWxdE4gNtj85pxNPvLgUYl
 pLA2HenSuA0AB1x+Ez09YcdO34tmtXeFRknhiDPGQ92BmJDXLXq/hXM
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
index 258edaa18fc02f837122c84842b59f2cee68d66e..1318f9e63ef1e7bab078ae17e39d9ed19c04f465 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1160,7 +1160,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1239,10 +1239,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
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


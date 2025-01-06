Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50198A01E0B
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 04:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0908810E565;
	Mon,  6 Jan 2025 03:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T7XB294/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0015E10E565
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 03:08:52 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53e399e3310so16617830e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 19:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736132871; x=1736737671; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a5CrB3VVs4RubiecuAESwKhvETynOyoovj9hYHIh994=;
 b=T7XB294/lbDqrG+KNvw4WsjT/EsOEevylr+ZRSfM1Vv0T89oCFUPz3UNWJOvmGxaz/
 Alldf+sK28uT75KECP7DMrXMnmwqRtNjDjn6dXAhkBIQZnLIpsAtpen48zwAQzQYMsLO
 6gsUrukdoyHMmf6JWg8pDhuOOdQrj+ty8QRt20yFdM/5rd7e0d9JaacWs40Mu14x8iz/
 F08ui7uZbnmydU+hk9y7+eNS0JVFsq5BNdpje7S/Ga8kMCFhTiOA3CGc2taHMN91AJ3b
 BBWKfS3aNdTxKVliOYvm+hDYlPHO2xuCfdp8P+hnm2rRLqF6td39OmHw8cMNHwwSOVgv
 yrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736132871; x=1736737671;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5CrB3VVs4RubiecuAESwKhvETynOyoovj9hYHIh994=;
 b=mS9XX2PYMncy5kP7Cw89s7yhbrQ7hfqFdNEk9U/9jeHQARHHGXwBJrRCNdDGtGNdaY
 lwJhO2ftc7mJoRkVK/j6mTJTqDZSS2V6ZmyFQNeDy47+qaR+9FEi7mQTBeSVmcqcpf4b
 6A2dMgo2Z71p54bMNsO3pzkSTOugMYlHTVTJSBke0PVElm5Psb5FFF4FNCnL91YTsQRe
 2Z3ZMxI7XydXoNL5kE39Zt929NcHcggwjpO0U6ZvEKJalFPeen1Zl6yLxTWBIIYkpYz2
 SL93fdoysrQ27/yHOFJGo5QGZg02EHMEnkFYGSUKEz04KIx9yxIaC6icLkGda1Iksrgs
 Emww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA0BT/5i1EoaHoslmoekiSydAwlgisT2Zs7Dqh626cludKiS8vsrzMuDFG354b+5KdnmPlvGyXS6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLBvsCEaU9QSHvlTpIM780KlyHy+0mB+awCcgXntxYv8sGty6a
 CMlEqjHN8UTuAsW3KWq6Vlcw+klTI4Ea7djLxvK7XXM6EwxmT1XYr22AUVnLLQw=
X-Gm-Gg: ASbGncu+XMVXAyAlVU5XZ00wCKXEN+9b8zb/UXjbicQJfcLM4rO3QxxH2u9r32N+TFB
 Vz3layaoDsVTXcGGm+RyzjxpQVZE1yQMnfNfjGQUGukTI7gQI9cur2+y3smLr5FEX73yeVapmUS
 Y+pvFQKJaG+K/esj/UtPnHreeCIAYSkFXXsuH/eQfefHFhgfskpEh/l1eZyyWJtlK93Ts6sS+V9
 6mL3F8mI7pLSv42kJFYK0mTKPwD4+MYzSirSxsHO29WLJJIp3aFtGUoFlJx75c8
X-Google-Smtp-Source: AGHT+IHzx6/+7iGF1P0U7GWJ28wdjB2danjMCVHHo/L2A4YNnr8iSGE26LZqT4t39m0vn1B4eunyiQ==
X-Received: by 2002:a05:6512:3352:b0:542:2972:4dee with SMTP id
 2adb3069b0e04-54229724e2amr12217322e87.46.1736132871412; 
 Sun, 05 Jan 2025 19:07:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:39 +0200
Subject: [PATCH v4 5/9] drm/msm/dpu: also use KBps for bw_ctl output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-5-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KJrUekUQHpsltHpQlGGp+aa7hsu1HP/5xOuInMxMEys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5AyXKui86uo80O6nJIzR09aronJqlcaPRc
 n3a4bydiG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1Q51B/9LaocYG/L2mMpfx5wBR3PisMBgyCmDdcxoHwEvhA7kQT/cQWQz70Bj2xpCVxp7gb0vJ6d
 aFdgE4IQyA2z9UDFRsX1i/Ti+S2kfW+0IgI7onaWQpH5Ec1PgIRTOAW5rGCc5UuMTTyfomkN0nA
 COg0eejJV5sMHcx5I6W5EXU7F4AmT7L0yvYYoZI91hCCsTfg36p00MzUdtqn/4MB3CvrIrhDVXQ
 v+28+lOWN9DcMKnhOXz8BO9kE2n/ZGGd+pTkB7g8OM+yiTGRTQerVBFzIUN7w8VokmNosPutKl7
 g03NputU4t+ibPynj6fsWAEHOS0FiHBnoTwJvoEQiGg6GD+1
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

Change debugfs and log entries to use KBps / u32 for bw_ctl and similar
data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7cabc8f26908cfd2dbbffebd7c70fc37d9159733..b93f7556f187d46b325a689ad01ec177cecbc37a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -135,9 +135,10 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	}
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
 			crtc->base.id, perf->core_clk_rate,
-			perf->max_per_pipe_ib, perf->bw_ctl);
+			perf->max_per_pipe_ib,
+			(u32)DIV_ROUND_UP_ULL(perf->bw_ctl, 1000));
 }
 
 static void dpu_core_perf_aggregate(struct drm_device *ddev,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8a523eb308630943871c2e075d3d0d9094606d05..ac3c6c5ad1cec3856f0eff2ed71153d3c2dc279e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1486,7 +1486,8 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "intf_mode: %d\n", dpu_crtc_get_intf_mode(crtc));
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
-	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
+	seq_printf(s, "bw_ctl: %uk\n",
+		   (u32)DIV_ROUND_UP_ULL(dpu_crtc->cur_perf.bw_ctl, 1000));
 	seq_printf(s, "max_per_pipe_ib: %u\n",
 				dpu_crtc->cur_perf.max_per_pipe_ib);
 

-- 
2.39.5


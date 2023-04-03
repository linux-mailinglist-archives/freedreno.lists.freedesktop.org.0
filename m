Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451526D4076
	for <lists+freedreno@lfdr.de>; Mon,  3 Apr 2023 11:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A94810E458;
	Mon,  3 Apr 2023 09:23:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B54D10E3F8
 for <freedreno@lists.freedesktop.org>; Mon,  3 Apr 2023 09:23:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g17so37186572lfv.4
 for <freedreno@lists.freedesktop.org>; Mon, 03 Apr 2023 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680513802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gaquRMKA5vN1NbkJUAlatscdzdszTSr64eMgADFB5o=;
 b=YAUgqcEM46wNYjl4QvuUbuoXPCuvmjARXI7E+kId0b8x1f2AXTXIZdkEYIXL4Nx5sE
 IYfyFNM8bCOGjno6ilHIu6B4z1fOupXebwaQQcaRgkOOBIf3mRbw1jCN3LpHawi6Mjoe
 wdbxxpzH7gRct5OtvNAbIhe46Qk4Vsdl7Sei0MfWysdqVB6Og4YkgKs7ZukizyzZf0Fq
 mWd+oT2+DFHR04DVosw/lkHgwAUVpdMs0aA9CYtc4w6J+LjW6gG02KWb+KUfPMd74jlR
 1+ltFtaOPzJiwsekyNUfSv9rc//Ot9+cOCqpvkxTTDCCfOeWylLjdLlmxI6hr/HmIxmk
 kyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680513802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1gaquRMKA5vN1NbkJUAlatscdzdszTSr64eMgADFB5o=;
 b=k58TAxRE0a9/R2ZHxKgBADEZ3NVmq42i7L31nivoXFiswhyTSUcMo12WKH6sahKgB8
 HtR/7OI6ofJ2Mq1z/ZKec/aU7P6dmFpTmGUfRYMuANo3qD5m/0CQYzcozaRpptJrvxP7
 nLBePI47g/+nfZutEdzvQ0doSH6Ic2ecGr4xn/TVObEqQ8dAC+iTTCZaeAyN03s7WJKx
 D9NnVm9V6TSJkTjPtd1BgmTt0VFekQTpiHU18M2S0p6bRm0+BMKtm1PGnSbfnOw8iqAV
 /AwRDTYq6tug0kVgsB0AmlMpktD6zCDsBOIP8GR4dCKtnY6TBqJaQl2Wlk91Q2F6xRMX
 l8jw==
X-Gm-Message-State: AAQBX9e2RQiEp0DzJpUnteXg9uCgZNrU3suK3IwKMqvD0x9f9FmcTbYv
 QkMLoo+2yoJ+Gg9kdXGzSrwu5A==
X-Google-Smtp-Source: AKy350bZMCk1vD6sNsSHEJdr/MLqWXuUSMv7DPVdDg4Mkdj3jWEhG4jvn09CINvTgFpBYKppWEvKCg==
X-Received: by 2002:ac2:446d:0:b0:4ea:8892:58dd with SMTP id
 y13-20020ac2446d000000b004ea889258ddmr7984581lfl.59.1680513801994; 
 Mon, 03 Apr 2023 02:23:21 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 02:23:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  3 Apr 2023 12:23:12 +0300
Message-Id: <20230403092313.235320-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 11/12] drm/i915/dsc: use additional DSC
 helpers
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Switch to drm_dsc_set_const_params() to set some semi-constant
parameters. The rc_model_size, which is set beforehand, is preserved by
the helper. Also make use of drm_dsc_set_initial_scale_value().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index bd9116d2cd76..2d4917ca1f14 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -216,6 +216,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 
 	vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
 
+	drm_dsc_set_const_params(vdsc_cfg);
 	drm_dsc_set_rc_buf_thresh(vdsc_cfg);
 
 	/*
@@ -251,19 +252,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 			vdsc_cfg->rc_range_params[0].range_bpg_offset = 0;
 	}
 
-	/*
-	 * BitsPerComponent value determines mux_word_size:
-	 * When BitsPerComponent is less than or 10bpc, muxWordSize will be equal to
-	 * 48 bits otherwise 64
-	 */
-	if (vdsc_cfg->bits_per_component <= 10)
-		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
-	else
-		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
-
-	/* InitialScaleValue is a 6 bit value with 3 fractional bits (U3.3) */
-	vdsc_cfg->initial_scale_value = (vdsc_cfg->rc_model_size << 3) /
-		(vdsc_cfg->rc_model_size - vdsc_cfg->initial_offset);
+	drm_dsc_set_initial_scale_value(vdsc_cfg);
 
 	return 0;
 }
-- 
2.39.2


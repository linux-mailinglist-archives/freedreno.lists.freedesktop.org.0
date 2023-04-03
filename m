Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33266D4070
	for <lists+freedreno@lfdr.de>; Mon,  3 Apr 2023 11:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4BF10E462;
	Mon,  3 Apr 2023 09:23:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C4510E3C6
 for <freedreno@lists.freedesktop.org>; Mon,  3 Apr 2023 09:23:21 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id br6so37138445lfb.11
 for <freedreno@lists.freedesktop.org>; Mon, 03 Apr 2023 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680513801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/vvD74dTg6Ok9D3o7oMegz307H2NDMir9mYubi5ivw=;
 b=K1azTHao1MjTShcSN2oVWr5jewh1WrWWg/uSMSPj0cZSepspTsLsUE8yhji0HfGlfS
 Xve42Pem8Gr7gFEsGncWjK88pEu2u/i54aUpnGnXjzo8Gwvj3yFzOep9DoXyfwXT2Jit
 igZD8lH7oN4vqdNNl3G7fM5pnI/IhAVqrmckxc8lwS1+AQgJIc7Ku6fK3yyAOHqX3ZSr
 xTHl8NoZXJGgUAeu8KkoXVYT5m4+1DsEM+CHdnCF3zczgCJ+cr2bfYWtbBMDzkRNiLlP
 NuT9FxUS+CrO8IGrxTIWQ3IAEhN9rtrXvg14nnfc/pkPsaKuB48sSSizzX8124BUZiNp
 C7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680513801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/vvD74dTg6Ok9D3o7oMegz307H2NDMir9mYubi5ivw=;
 b=vdDcvumXEOVweZXA0mhrCXFgYJYKMOUxbBSHsUABTHTrtomlFsFXHjnfmEp++jDmiW
 mPKj5ezXI1f1wCWby7CgIuAHUzfDP+EhJVbwV4pdw8zWNg2ZxrFWkh8/6cMUJsrFgct8
 9pQaR7+TkTIVoy3JnW8ZdORFYLvcLZqfxsO+jJNxAxWmlZYNoS4R6Uy3IAE+rzEvZS2Y
 bkKf3D7Darrn0/x/hi5V1sqsNJMd4WQjm2+QG5Ix8bWFcZA1TgBIlFS9r+wgeZFAo+Pn
 Qr1HSFfj2Jg3lKbQHkiwGpeHlzeVzS1+EKMFZGApB3KEcf5ifq2wURD5vrW/qWos+BRq
 0NfA==
X-Gm-Message-State: AAQBX9d72r9oAZfLYT0SBZk3elDaBoJBMXne1ToLTBaYIK/PP4fDwweB
 mBJR2ZEBXszOEvcrM/1E4xKCtg==
X-Google-Smtp-Source: AKy350bJEhdvMEKnfbjk6VbrKH8zClgxGzO1FgBv9sn94U6YU1pIrLcBf8WPtHz6DgtOTGbP557o1Q==
X-Received: by 2002:ac2:54ae:0:b0:4ea:f8f0:545f with SMTP id
 w14-20020ac254ae000000b004eaf8f0545fmr10148214lfk.52.1680513801365; 
 Mon, 03 Apr 2023 02:23:21 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.20
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
Date: Mon,  3 Apr 2023 12:23:11 +0300
Message-Id: <20230403092313.235320-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 10/12] drm/display/dsc: Add flatness and
 initial scale value calculations
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
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Jessica Zhang <quic_jesszhan@quicinc.com>

Add helpers to calculate det_thresh_flatness and initial_scale_value as
these calculations are defined within the DSC spec.

Changes in v2:
- Renamed det_thresh_flatness to flatness_det_thresh
- Set initial_scale_value directly in helper

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/display/drm_dsc_helper.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 4448c482b092..bfa7f3acafcb 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -26,5 +26,16 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
+static inline void drm_dsc_set_initial_scale_value(struct drm_dsc_config *dsc)
+{
+	dsc->initial_scale_value = 8 * dsc->rc_model_size /
+		(dsc->rc_model_size - dsc->initial_offset);
+}
+
+static inline int drm_dsc_calculate_flatness_det_thresh(struct drm_dsc_config *dsc)
+{
+	return 2 << (dsc->bits_per_component - 8);
+}
+
 #endif /* _DRM_DSC_HELPER_H_ */
 
-- 
2.39.2


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E42250EDAF
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 02:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8577D10EA42;
	Tue, 26 Apr 2022 00:41:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55A210EA42
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 00:41:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bq30so29188218lfb.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 17:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BgJVXf3N+o2MbfE8Sxe7s3Hg4gl2fsc9sl4/MZ7Xec=;
 b=Y0uNStUwzU/oXitgusJQjzs+6P6vKrDOyx61uQ+wVP2xAfkFXurLACebiufrGx3Dom
 SwcPd5ljkUSl2dxQ3Tv4MJLO8ji75Xzg7E87+l5vKVzf8+cxIi89Ko3XJPQ9A1PJ8Z7C
 zwFGEtFgs9M9V70Q2BFqw0Lo53egxsmiPsHje1sq3xiBr5DYrn8p+N/+qREfiZGLxpSI
 ITKQ3Y39p9OvyDVnJuZS0BpUPnnuZNeP3lJ/X6GShrwmpGQJP1uoj6jQ08RGU4oPKdFt
 D6OCVQbF7qZjFmdKJQ7tjsWC8HsB9WjXU2qW/wX56kiNJA9hMcR+dc8nCPYyYN8/9Zn6
 HjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BgJVXf3N+o2MbfE8Sxe7s3Hg4gl2fsc9sl4/MZ7Xec=;
 b=I8S2GRusTmbE7g9HsIDeLjC1Ms9ZFEieCl/do9Knqi1NwYeLtgd1QKJPwxOcHPVDer
 Nf0OI0haDKLH/eVVLGeCgBfYE8yITHSZrXyEmunnl1w8Yf2yX3hMXTZoz4Qn5A9nEifR
 Qz/3dYnKtEfjZEjURs0XdNXgmrXH1z/2HO7G0WC7GS51UTN2zvbSVUKT3TJADcCV/nae
 VM/4/4216Xc6GG8w8HbHofuJzBbMHlhnzR8Sm3CDR+am7mqa8vzuFiyCID2Ujv3aAB1v
 46bL1dJQ5G3hNIRrz0fluYDpK+d0/SGN0tQbCz7Ww4uL2uOzVU+QrzcQLgH1umJLsPVa
 aOUw==
X-Gm-Message-State: AOAM532hkbFAgVyLRLjQ621sxnWZA8FzE17w8PhdgZfGroUSMAMxuyQN
 ROLTD6UKF2LlBlEEHihjUAYPSA==
X-Google-Smtp-Source: ABdhPJyfz2HW+yUkl/y/GKEmlC3J2qoEYBy4ZnCi7wRttEGrV1xocUKmOW+mhKSGpBGgAFvLgt+vJg==
X-Received: by 2002:a05:6512:1084:b0:471:d10b:4dec with SMTP id
 j4-20020a056512108400b00471d10b4decmr14921576lfg.21.1650933690030; 
 Mon, 25 Apr 2022 17:41:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p2-20020a19f102000000b0046d09d60becsm1564792lfh.141.2022.04.25.17.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 17:41:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 26 Apr 2022 03:41:28 +0300
Message-Id: <20220426004128.2832555-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1] drm/msm: select DRM_DP_AUX_BUS for the AUX
 bus support
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add missing dependency on the AUX bus implementation.

Fixes: 82c59ed16695 ("drm/msm/dp: Add eDP support via aux_bus")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e99719067cd0..a6110fc67ac4 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -12,6 +12,7 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
+	select DRM_DP_AUX_BUS
 	select DRM_DP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
-- 
2.35.1


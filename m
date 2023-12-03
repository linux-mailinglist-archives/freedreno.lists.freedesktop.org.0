Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD2801FE4
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 01:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0F510E23F;
	Sun,  3 Dec 2023 00:06:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5CE10E243
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 00:05:38 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bf2d9b3fdso101801e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 16:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701561936; x=1702166736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhduEdY9rfFEo5t7qo9Oszbc0IZqRQzEBjCv6mdoXAM=;
 b=HrXqqQc3Q8YeXfP2VmBdtzux/IrBTUy7eEwZuVu3NiB9PhablUHh3DlsdvknPKsbSo
 zpHGV5s4gdtFwSzChehd7OwIvkpkuNG4llByuH6dL2jsclDBC8dHB06unbgwOVunF/5F
 tN8uo6Lik3cW223iBEW+YMD5aTGwCc/tjvVu9M8bKvb1BfHP26fe4/8DFPmYs7gp2kWB
 2uV3dXvvXl2sKBMknvf+rNXfo/TkUnpcqhV3E/jYmgwG2vWfLzMm9axKr57bErmL5Ecq
 mI2xvWEVs4IwA4cJDvDfo8dEOosO/bdDjkpj73EJkn3Xr4wXK0aRtey2cUv0Vvej163Q
 wMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701561936; x=1702166736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhduEdY9rfFEo5t7qo9Oszbc0IZqRQzEBjCv6mdoXAM=;
 b=AabaKbQMBmSK9zWRHIo0zvhyzHeLfeXN0ImgpayNBeFXy5qr+6C5hO/tZ6a1zL9c59
 Xxec4RD+iU0qgWoVtW78jCwLiWrkVJxyIivtYYnJ6Kar+Wzn6pifij9dx1dsL1P5jfk1
 37Cnycp+7ei20LKwdYgh7IcbhhsbLvFFvzQHommVojSuPKsyVruRSabkWyulSwgpDPGn
 liO3Igyo0/S09FY5AJd8BDzR8f4FA5Y8hxN49VXmkihTBF7CcjRDpiionrmwxsinNsZI
 y0jpSnUWQbEotVB+p2k6HugWWq+RpdXYMaqoIDFUlM/0Sqnq9cfbZ6uChYZ5hs+FSqH3
 nKAA==
X-Gm-Message-State: AOJu0YyqwLiYvVr19b+yrvfTKwWjQ0iNZPjdvA8fIKZfwm3ePr6xMPjb
 lOzYEE9eL3nTKkEod1B2ewmYwQ==
X-Google-Smtp-Source: AGHT+IEnH09BN8lJCnFzv/1AEwB1sYe5O3yf8kfOev9tVf+ZhwPkF/62e21L4u2Nl2L7UYNUJg5kQg==
X-Received: by 2002:ac2:4f05:0:b0:50b:d764:76de with SMTP id
 k5-20020ac24f05000000b0050bd76476demr3115828lfr.109.1701561936482; 
 Sat, 02 Dec 2023 16:05:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:05:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  3 Dec 2023 03:05:29 +0300
Message-Id: <20231203000532.1290480-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH RESEND 2/5] drm/msm/dpu: finalise global state
 object
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add calls to finalise global state object and corresponding lock.

Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fe7267b3bff5..73f70e67cfef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -385,6 +385,12 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
+{
+	drm_atomic_private_obj_fini(&dpu_kms->global_state);
+	drm_modeset_lock_fini(&dpu_kms->global_state_lock);
+}
+
 static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 {
 	struct icc_path *path0;
@@ -826,6 +832,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		dpu_rm_destroy(&dpu_kms->rm);
 	dpu_kms->rm_init = false;
 
+	dpu_kms_global_obj_fini(dpu_kms);
+
 	dpu_kms->catalog = NULL;
 
 	if (dpu_kms->hw_mdp)
-- 
2.39.2


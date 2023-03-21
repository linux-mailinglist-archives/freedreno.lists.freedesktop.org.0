Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A421A6C274D
	for <lists+freedreno@lfdr.de>; Tue, 21 Mar 2023 02:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBC210E6CD;
	Tue, 21 Mar 2023 01:18:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CCC10E6C6
 for <freedreno@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j11so17186050lfg.13
 for <freedreno@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19Mh1AennFks/7EMfm7YcmHqybWalPcK9N+h2nso4NM=;
 b=E2Tm00ZfPxZRTFrHiINcrkN47RtD3K7YkBow6t5sagMcYhCs4GYZQoHGg/vR6HQmXb
 cF6B77vvj1ANdqtdDxsaEGY6T/qCd0qmn5Q6qof2HCIJ/ptt5w7d78cPC1xbNrZnYtXA
 0AWbaPfclpDzX1iKhFc6pTvwdY0oJNu8LsjHulfdaEsXWm9h8+/0KfIKKMGxC02L0Z+X
 JVg5lLBVSdnCsfSf0TTes96FsomJDvRSkUqJzZIlJSx9Q7Wtg/wj7I2UvBSnz70pTy2W
 tMsbpy1/WZ4nNFsmIFfWp9AI5Ese0gbZthX/Vr81PLI4t/+h2Q5qUkvGuxfKM+cV7MXZ
 ePEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=19Mh1AennFks/7EMfm7YcmHqybWalPcK9N+h2nso4NM=;
 b=oRl3oGukL/qS/x1kiv7b/HyZOY8YGst2q5drjqYh/V+b/PPl1eRfImsFYYWoM+MLun
 /c+1LXQIkqNIP4UEVS4jH7v/F20wO/urBc6fHVZgRxn5b8p+ec8mlef0Y06gd4M1SNLC
 GIdxr/1wD8jOieIatXA81TnlIEsMGqtxfkwHSxaMzJ26Hb4qyx9BW1auusYqaT1f4gYH
 ruTriplMZ0jlgJE5sMNUmZjS+LnDhkcTpFvJUflJedHVvohmBA79nb0Cin/xjcxdDlCh
 1kDex3ubX2BbGxlndazN4/iHR9S662Xbv6q+GDmKLgpr69dtGM08MLc8z1myFWvlA/WQ
 Kjkg==
X-Gm-Message-State: AO0yUKUZuuJGze8hBwNnry3qX6mh9Qg048ZIPmsLV2P4VoZ4CrvB58H/
 Yd0ioZhCwXoq8LyjqU7w7GXz/Q==
X-Google-Smtp-Source: AK7set+aTiuu1uL1+bgmR9So63+iQYZYtju6YL2CUqZSRgh063oiaoRPpeS4LcJfucYU8Ou4ChRZJQ==
X-Received: by 2002:ac2:53b6:0:b0:4dd:a445:e69d with SMTP id
 j22-20020ac253b6000000b004dda445e69dmr313101lfh.26.1679361510839; 
 Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 21 Mar 2023 04:18:19 +0300
Message-Id: <20230321011821.635977-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 11/13] drm/msm/dpu: add a field
 describing inline rotation to dpu_caps
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We need to know if the platform supports inline rotation on any of the
SSPP blocks or not. Add this information to struct dpu_caps in a form of
the boolean field has_inline_rot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2d6944a9679a..33527ec7c938 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -489,6 +489,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
+	.has_inline_rot = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.format_list = plane_formats_yuv,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4847aae78db2..cc64fb2e815f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -400,6 +400,7 @@ struct dpu_rotation_cfg {
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
  * @has_3d_merge       indicate if 3D merge is supported
+ * @has_inline_rot     indicate if inline rotation is supported
  * @max_linewidth      max linewidth for sspp
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
@@ -416,6 +417,7 @@ struct dpu_caps {
 	bool has_dim_layer;
 	bool has_idle_pc;
 	bool has_3d_merge;
+	bool has_inline_rot;
 	/* SSPP limits */
 	u32 max_linewidth;
 	u32 pixel_ram_size;
-- 
2.30.2


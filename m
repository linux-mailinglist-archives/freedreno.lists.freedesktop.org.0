Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E16C2741
	for <lists+freedreno@lfdr.de>; Tue, 21 Mar 2023 02:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA82110E6BE;
	Tue, 21 Mar 2023 01:18:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ADE10E6C4
 for <freedreno@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id k37so4278739lfv.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3gZrcHEgMaoVLg/Qn82uZJfC8UCV4DXP2rS4CdikJk=;
 b=ubcPRMxmRwEd85TrfYF/RwP07EFJYEh945p6zqIsaVf+qEtLWvPWR+c7mYruJouS7s
 8+x3swC9Glg/NfQ/cQXkppvzxZmAy5uzWwacFfgUF8P7Ed8Fo3+SUAn1DEMCSGcb91Ks
 R7aJ2m7pdbKLm538cec2q50wLiHgJT6SjAv3q0ZsPx0bITbjcIHUNzkqRdmTK69fl2hE
 0KMGIge19xJMZQ3KrBhpu/C8Bp73iT5xOOXW3aQ3N1x8353qTu2NKmSepQnnaUkSk8CM
 7GwcAZZm/odQuZkjT2IDdPWLFscTAXNBFGo83Ov6C/8jNY42qLBYf4GfnwRJ8hVOLBGV
 zqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3gZrcHEgMaoVLg/Qn82uZJfC8UCV4DXP2rS4CdikJk=;
 b=BdUL3inF3n9kvm0VGLPPGNTh0jHdNK5++mg5dTae9PRAgEztdhx9BYfeS9cXNLEQWZ
 x1wHsbDtmQyoJgH3+0R/bv3uFoL81M2OARpRA2y0X6NAWE5bTXod6ucps+9NH8ndfGZW
 h69PKB6gb3Ba4oBQ+SWqMdDyWVECOceRZMWBtXzUYcP47xIUDtUDA75CtAPuuFvnUg2s
 fQO6ykapcKOasY4+JzE4hOPJcHHKQcWsEspI9Nxpper2F1FVxOwwJpVlIkKu7nPsR9FQ
 F5h+oMQP8AL/umxfQ18JpphOzCkenla+OUneHvaQY1/0aoGy67n/w+ELNlxWzz8XgPn1
 4pNw==
X-Gm-Message-State: AO0yUKW/mCJ+kk31uSzg9hnLRHA4p1ZzzfrzZBGRiNelB2s2kiD8PVCW
 EAbUsPCBo/vWDrq1ItYQZR9k2Q==
X-Google-Smtp-Source: AK7set/R+d/jdQwRe0GjLylJCWLzBcnmxTSOu/bfURtntrciRtQ/h/o6B+OE49fG3/rWDbQOQoc2JQ==
X-Received: by 2002:ac2:5218:0:b0:4cc:96f8:f9c4 with SMTP id
 a24-20020ac25218000000b004cc96f8f9c4mr260566lfl.45.1679361510080; 
 Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 21 Mar 2023 04:18:18 +0300
Message-Id: <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 10/13] drm/msm/dpu: add list of supported
 formats to the DPU caps
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

As we are going to add virtual planes, add the list of supported formats
to the hw catalog entry. It will be used to setup universal planes, with
later selecting a pipe depending on whether the YUV format is used for
the framebuffer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 212d546b6c5d..2d6944a9679a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -315,6 +315,8 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps qcm2290_dpu_caps = {
@@ -324,6 +326,8 @@ static const struct dpu_caps qcm2290_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sdm845_dpu_caps = {
@@ -339,6 +343,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7180_dpu_caps = {
@@ -350,6 +356,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm6115_dpu_caps = {
@@ -361,6 +369,8 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8150_dpu_caps = {
@@ -376,6 +386,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc8180x_dpu_caps = {
@@ -391,6 +403,8 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
@@ -404,6 +418,8 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8250_dpu_caps = {
@@ -417,6 +433,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 900,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8350_dpu_caps = {
@@ -430,6 +448,8 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 4096,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8450_dpu_caps = {
@@ -443,6 +463,8 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8550_dpu_caps = {
@@ -456,6 +478,8 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7280_dpu_caps = {
@@ -467,6 +491,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 89b372cdca92..4847aae78db2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -404,6 +404,8 @@ struct dpu_rotation_cfg {
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
+ * @format_list: Pointer to list of supported formats
+ * @num_formats: Number of supported formats
  */
 struct dpu_caps {
 	u32 max_mixer_width;
@@ -419,6 +421,8 @@ struct dpu_caps {
 	u32 pixel_ram_size;
 	u32 max_hdeci_exp;
 	u32 max_vdeci_exp;
+	const u32 *format_list;
+	u32 num_formats;
 };
 
 /**
-- 
2.30.2


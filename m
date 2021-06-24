Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1433B3202
	for <lists+freedreno@lfdr.de>; Thu, 24 Jun 2021 16:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1546EC27;
	Thu, 24 Jun 2021 14:57:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0C76EC26
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:49 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a11so10734279lfg.11
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDsHX0hxp/QVNOmO09ufPm+XNBvCicnDs8mQ30Y15QQ=;
 b=qhpAF/vpepGprjlgjI8xJn8+G7gGXphsnZQOd99413gIcRZFHqhuUtOd1L9w0SPbDz
 TI1gpe00wVuFH4q09c/LlAouOZa1EzndjHKo7he+G28wmrtOlj+Q3AKMztdiLKDHDl8N
 yu35lG3D0W8jRAMrbByn7j7S+uDWBPbotQZPx3LQGOn3cjclIQYcb5NpOf0RJ2hoogAN
 AT+nMVWIzs9IocRdfT6dM4ZZi+xUGS0DTQM88lVUob5pXhHw9YD8OpG/ipEE0+7317ZM
 Yodyu6RnpTqudNpQgPr5aFeCJv4VP9+48chN3XDc+BlGHHDSirK5t6/asBNywNatKWeA
 ouJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDsHX0hxp/QVNOmO09ufPm+XNBvCicnDs8mQ30Y15QQ=;
 b=DVJ8i3n6xEliQZULvlCe1Ocnib/oDPouhJKxEID0PZXcuR8fBv9Ki8CsceE8ICi2lZ
 I2VxJBalvjKKoAVMalHFQhuZxEZbZbkRUv8D+ezH9pvhyOyp4kkoTZTAqHSrRDLxBQUH
 Sge+u+eaFYm1giHUYPHZRDWg5kL5HBqGLAMXr8IpQwTcsh2n6VeiEmRmhUTfQhEMGVfP
 8izQPltQphfIMDGRUyiveOKu/lpV1+R31MhoiSeDLvUjxZvDE32I25R8Qsa8Q6iPNG78
 q3td0WpZPgFd/ONx0X7H9FCaiHygQ8Iy9GCLz60LYHxld3eGD2PBtZeImnEXmx+JGZAk
 AeTg==
X-Gm-Message-State: AOAM532aGij/5SSXhqGqMfft1u+0g0eJvkfg5YoKLo2Ni9spywxygkjT
 94IK1x9u1VMRjHogHwsTmmLaIsNNJyyfag==
X-Google-Smtp-Source: ABdhPJz4bQxAuKE1ltMkjvXZYNHkRWfiKi3UUQBb+zgz1zbpf9ko3z0Mnx1v2N3Ci+gqYG90yTAfQA==
X-Received: by 2002:ac2:42cd:: with SMTP id n13mr4118450lfl.330.1624546667500; 
 Thu, 24 Jun 2021 07:57:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 24 Jun 2021 17:57:28 +0300
Message-Id: <20210624145733.2561992-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 12/17] drm/msm/dpu: add list of supported
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As we are going to add virtual planes, add the list of supported formats
to the hw catalog entry. It will be used to setup universal planes, with
later selecting a pipe depending on whether the YUV format is used for
the framebuffer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d01c4c919504..b8e0fece1f0b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -195,6 +195,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7180_dpu_caps = {
@@ -207,6 +209,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8150_dpu_caps = {
@@ -223,6 +227,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sm8250_dpu_caps = {
@@ -237,6 +243,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 4096,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_caps sc7280_dpu_caps = {
@@ -249,6 +257,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.format_list = plane_formats_yuv,
+	.num_formats = ARRAY_SIZE(plane_formats_yuv),
 };
 
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d2a945a27cfa..f3c5aa3f4b3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -324,6 +324,8 @@ struct dpu_qos_lut_tbl {
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
+ * @format_list: Pointer to list of supported formats
+ * @num_formats: Number of supported formats
  */
 struct dpu_caps {
 	u32 max_mixer_width;
@@ -340,6 +342,8 @@ struct dpu_caps {
 	u32 pixel_ram_size;
 	u32 max_hdeci_exp;
 	u32 max_vdeci_exp;
+	const u32 *format_list;
+	u32 num_formats;
 };
 
 /**
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

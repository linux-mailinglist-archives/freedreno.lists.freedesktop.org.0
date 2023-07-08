Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F20074BABD
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 03:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BC510E05B;
	Sat,  8 Jul 2023 01:04:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23A810E062
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:12 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6fbf0c0e2so38655331fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778249; x=1691370249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfadn5RYcxzW3bydxCOGekJMqYKQXpQf89DYILeFA6M=;
 b=VVnvzEdcmW8uqRQ2naUKeP+xREh7R1CLb6LvO8EK6PHEJZ4SXNWcAaIUBCLkpNJXfs
 q87m9hujz4HuqYnXxj+nYYBVv535XRkyQgDkpzn/2znBjNWNUegPLkk7rA6QKlpX0nUk
 3j1MERndvEbGEca39HEwCdfZFkk1+Ev1/2xUWOWjjzgvSDCnN8WKAD2ElBqzGvk0+SfL
 5+ZHNpEkDpbfOqUJajfO9HILx3faXeMqkFgSSES1L+lNhR4sIohISVeeKdozVVQN5po7
 PbnOqIJESnJy77DnfSvNPa2/85mljv3u4icHDCNe3Sy+kxoFoj43P3mjU8GZIbMZLIOT
 lULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778249; x=1691370249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfadn5RYcxzW3bydxCOGekJMqYKQXpQf89DYILeFA6M=;
 b=hun8Hll2f/yTdup4wq+OHHXTovmp0iUtPV5ARZ3xz3uVfSQ1veeA7CgSiBJTv0Maxl
 7I6+zw/V5KnNAyt21wm4QRXzvOgw+LWrwUniiG1uwDIcX4TdY40Qzr5TGvkAMZrVBdZ6
 88hQzXzyuZeRA3GzA6SxOTGjFMwvNNO/y9gqgOpsoK87EfwiP558VN4/ziOj8U30iDfp
 XgPJbSdP3i5zUbffyyflFKKry9h0jncAWqPEsNBd6/CjXXINTbmz9CVLMe9JO/f/nPhO
 QPhV/PR29T7g9wQNzxdZttCBRGdyVjUS9St/Tt/IKJZWjyBIXLG24m1hCcReIFn2JQm2
 mO7w==
X-Gm-Message-State: ABy/qLa5CZz5kJ3skmVGxKXOzEeY+XKh/ilN/+sv3n0ci43Y1m/pKcme
 ocRKi4zMyj/Y+9iQYyrLK65R8g==
X-Google-Smtp-Source: APBJJlE+xRVv4dS/H8P6fWlSLRrpda5JAhkrbTbV8WAFn4HIJmu6gI791/v2Icmxj2rjkwU354w9kg==
X-Received: by 2002:a2e:8611:0:b0:2b6:9c1d:dea3 with SMTP id
 a17-20020a2e8611000000b002b69c1ddea3mr4958137lji.2.1688778249443; 
 Fri, 07 Jul 2023 18:04:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 04:03:51 +0300
Message-Id: <20230708010407.3871346-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 01/17] drm/msm: add arrays listing formats
 supported by MDP4/MDP5 hardware
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

MDP4 and MDP5 drivers enumerate supported formats each time the plane is
created. As the list of supported image formats is constant, create
corresponding data arrays to be used by MDP4 and MDP5 drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 49 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/mdp_kms.h    |  5 +++
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 025595336f26..ba9abe8b3acc 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -81,8 +81,8 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define BPC0A 0
 
 /*
- * Note: Keep RGB formats 1st, followed by YUV formats to avoid breaking
- * mdp_get_rgb_formats()'s implementation.
+ * Note: Keep mdp_rgb_formats and mdp_rgb_yuv_formats in sync when adding
+ * entries to this array.
  */
 static const struct mdp_format formats[] = {
 	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt ... */
@@ -138,6 +138,51 @@ static const struct mdp_format formats[] = {
 			MDP_PLANE_PLANAR, CHROMA_420, true),
 };
 
+const uint32_t mdp_rgb_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+};
+
+size_t mdp_rgb_num_formats = ARRAY_SIZE(mdp_rgb_formats);
+
+const uint32_t mdp_rgb_yuv_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+};
+
+size_t mdp_rgb_yuv_num_formats = ARRAY_SIZE(mdp_rgb_yuv_formats);
+
 /*
  * Note:
  * @rgb_only must be set to true, when requesting
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index b0286d5d5130..11402a859574 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -94,6 +94,11 @@ struct mdp_format {
 uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, bool rgb_only);
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
+extern const uint32_t mdp_rgb_formats[];
+extern size_t mdp_rgb_num_formats;
+extern const uint32_t mdp_rgb_yuv_formats[];
+extern size_t mdp_rgb_yuv_num_formats;
+
 /* MDP capabilities */
 #define MDP_CAP_SMP		BIT(0)	/* Shared Memory Pool                 */
 #define MDP_CAP_DSC		BIT(1)	/* VESA Display Stream Compression    */
-- 
2.39.2


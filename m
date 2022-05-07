Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED5051E6BD
	for <lists+freedreno@lfdr.de>; Sat,  7 May 2022 13:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A3A112C01;
	Sat,  7 May 2022 11:59:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1889112BFB
 for <freedreno@lists.freedesktop.org>; Sat,  7 May 2022 11:59:46 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d15so8033023lfk.5
 for <freedreno@lists.freedesktop.org>; Sat, 07 May 2022 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71+fcv8KnRRz4CuqYuY+NOVmoaQwb5cZ/U5LdVWh7tM=;
 b=n+rNKj/VaY5MM0sGyHUQJc3L0k9VjSBfjX3fHluOgmtXWvXdWQXaSX6yLmkUUDHzds
 Wo6aLL/R8X8lv5rDJUWrKwO0nZxgEK+iwo6alutGariALUk9YhkGLfBcoRATi1zGzCgB
 eCjmXwI+HVWdgZ6TqcF9m2LKTLD9z1JtIcJCVXL966+KjbAjisfZO7grad5wgOFwsZ8V
 mMgdSdopZPUphNGTPb9xG1rA9aDSeyLRqkfo/dajP4iNRmxqEsW2TcuRrzPTDoYep2SN
 scqmZfJJQS5r2hRT8lcIEYoMi25Z2n+f1tWqWOhGv7nfkQiVH1thBFTasrLdyG4l0Q+T
 219g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71+fcv8KnRRz4CuqYuY+NOVmoaQwb5cZ/U5LdVWh7tM=;
 b=ak3MWP6DzLf2W4EQqBtFVYKX5a0ZblIR2K+k3M72L0b0KgAYOAs8hO1EiMQ8nvVRLV
 SlxGGEjgVUvN1R7uqKkHkBWPzPaolyQWwNxxiRUCN9x1QS/27g+ivafutmXVmP+Ahz1X
 x7/vSemMO6e1izzESKybOTpePVhJaZcIWx/U+qciATJTa73l3/B04SwPoyLvRCHFQLxm
 rYpH8jbwTjfpt5bRFi6UBtD7Wydv/2eYoDSVYvnLyOyqfZHFqNFLXnRI5yejGdshiLBb
 1QjPdVy96FkbJpUXvavjjy1/QLTD0tismIW+AeR27+dZZ4NPz2cWZWaEoG0ERgJjwa8k
 gmog==
X-Gm-Message-State: AOAM532bpg2kRYjGE+vOfBpc4g00bykOz/qkJAMdXtKCRg5Xpb4VHGhs
 8Nw8VJsM9H5QNfdoL5LqFAsQgQ==
X-Google-Smtp-Source: ABdhPJyONaIbERmZr+B2RapCSr7d8hvEZej6e1O9rIrrCtHkWpZ+eP62baG228pimeIkFEF+zzbdNQ==
X-Received: by 2002:a05:6512:12c9:b0:473:c33e:a65b with SMTP id
 p9-20020a05651212c900b00473c33ea65bmr6301435lfg.285.1651924784990; 
 Sat, 07 May 2022 04:59:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.149])
 by smtp.gmail.com with ESMTPSA id
 f3-20020ac251a3000000b0047255d211b5sm1083738lfk.228.2022.05.07.04.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 04:59:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  7 May 2022 14:59:41 +0300
Message-Id: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] drm/msm/dpu: dont_use IS_ERR_OR_NULL for
 encoder phys backends
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The functions dpu_encoder_phys_foo_init() can not return NULL. Replace
corresponding IS_ERR_OR_NULL() checks with just IS_ERR().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 52516eb20cb8..07de0c0506d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2144,10 +2144,10 @@ static int dpu_encoder_virt_add_phys_encs(
 	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
 		enc = dpu_encoder_phys_vid_init(params);
 
-		if (IS_ERR_OR_NULL(enc)) {
+		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
 				PTR_ERR(enc));
-			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
@@ -2157,10 +2157,10 @@ static int dpu_encoder_virt_add_phys_encs(
 	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
 		enc = dpu_encoder_phys_cmd_init(params);
 
-		if (IS_ERR_OR_NULL(enc)) {
+		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init cmd enc: %ld\n",
 				PTR_ERR(enc));
-			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
@@ -2170,10 +2170,10 @@ static int dpu_encoder_virt_add_phys_encs(
 	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
 		enc = dpu_encoder_phys_wb_init(params);
 
-		if (IS_ERR_OR_NULL(enc)) {
+		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
 					PTR_ERR(enc));
-			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
-- 
2.35.1


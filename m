Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F94CE53C7
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 18:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0D311AF3B;
	Sun, 28 Dec 2025 17:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uf/tp21T";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kp7awoqH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0201211AF01
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSAuMwD2801368
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CGyPL6KHRYRMQ39eO9G7zyY0TeTIkBgeR3+nmWeanBE=; b=Uf/tp21TzmBWEvgP
 Ggk1niZyXxbf3GCIJK5GcXRvaAkv7i15eT7pfYRdqlr+bTqB4vqzeGeFWOsLhWqi
 5TWVSKDykWL7DoizFvJHUYoviNu7DsrrYV1ELCE8T/aiP2xhE2v3i24MxhDUvc61
 BoK4EoM+GkX+OyrS8tQg+geE1N9uzYEut/MxxrFuFJvfVys8oYCjRk5O9jfXB+om
 ZdKQKF7Autqrftsos78szIQt9s2xwHC0eeMn7PLgTZ7CbyCvNuZdnwzboCHZjGWI
 3VT2PqngpmzH5liozgleHWSiYMDgm0OeBDK/MtqJzEpK79/QThu/ObH/qINGTsQy
 2SKz5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5jext-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee09693109so170510851cf.3
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942504; x=1767547304;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CGyPL6KHRYRMQ39eO9G7zyY0TeTIkBgeR3+nmWeanBE=;
 b=Kp7awoqHK0sTf7olXB5dIFN4RdDXxe/OvAyWBl4YdhOkqTJreSnPaEHuvPUNgEZTU+
 UneBV2vW4qkAlfxyFj/E+h4LQNG2WeqYZlqCGzqTpwPqWO1SvIv4oOkqL72lvuasfE+B
 VA9gcBFHva1dDxb4dSw7SDSGurpefRBeKAcgp9fi36INt+rh6XMMyPYg7lmRWO9AszJr
 bCyz7JcauE3iXIz064jfiIqvrbf+KeSGm9bj2uOa8/U2/Lg0X0zTp3XjxOttJPuczhV+
 dcTu7E2vCpeug/o9J0kKopwixpM8Ezx8U5heRV6RrfPQoxJkGk/uVj8Y+BOT58zhkCbt
 Q6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942504; x=1767547304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CGyPL6KHRYRMQ39eO9G7zyY0TeTIkBgeR3+nmWeanBE=;
 b=RlMDTak28xpBqrhuRfy0xApWHE+h+4AQsSvw7DUxJ4/UI63gSRFh/qftkxx4LmAqtV
 JtBFtF2y79JIObZWIvLCvj/gvYWuDQLwV2AqOA4Ywg8nyOqnMhnCN3JNcSshMBsKVFKZ
 EkunArNWmgs+WFEc/DAQL2fusEcRUB+M2Zt3ET1xnyZwu53vAhpFjO6tH34HhNmlz9lr
 cBNcabhvkZdH7VwU54mzRQQ4iX3S1LUOyfEqpzwdTOchjM6p1mPzpdOAPQMjBheSxx/Q
 XGxG9UjL2w15vVzlrA2ZPaWe57e3UD2IaY9yq5/W7thrQeBOAQo8BMFfRXPdmTRU9Jax
 qxpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA8aDawXz3Ul6+O9EmUnU/1JZJSKSeRgrKqUpyLUHNdhPUrFIgeU3qk+4TvjDTSY2wYXqKsN9kC9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsfeE5y5Ud5Li71mdd/W0dzdaB7QNSoaEPaPGclYBG797jqPDV
 U3O7rgzcZbNYQQLmroHoh7/pvyLPsU+d3v+46pzmkH/Et7p3gR/K1t4iAeUYYwH/WKFuiEXgHy/
 M2jTVKmes/e/5Lgy3DyF1r0m0RBTjSqux/GUFfpUxNuQnP2Ynp13PMqg0hLlTD7EIdD/9o50=
X-Gm-Gg: AY/fxX6acgu8Dm34VZ/iugREyQnwmH7cdD0zta5HcC5uUoOGS22KfM6hq0QOmtAYimo
 CXvB3YkI9l7/Ac9zmXsL5gi1U3PwVPFbqYAR4C2TyoGCEhzNQJcY6Ro3eE9c9s9RQ0rHQZkVlPY
 9u6pSEvm03M7eKe+3rG7dRfq6pRu7EpVrUqpP708wuMdpQoCPscm/Je77hWli/ivSHmNuGoDPJI
 i1C0HZ9FjHgPiYszlN3wYWri94cSTqVnK/2rDI9wFDFMRxv0LB1k7koh6L+AMGw+OkU7pVUDfV0
 n24sPFuupxu4PXjqWI7saVn+ATFKl/i230Lh3QScoMBQW+EYDBmH/d9KIOmdk/60qCIPpwMwMml
 hfNaYsqZlcdNyYeuin0VZEhiQAVJrmv2j2rcJiT1AaU6bnP5kYRa4N2pmrmDW102lEiHZcaXIjc
 X64Gu7UlYQF43Dp3P5J4KtNaE=
X-Received: by 2002:a05:622a:180b:b0:4f3:58e4:a35a with SMTP id
 d75a77b69052e-4f4abde3e12mr414052831cf.76.1766942504510; 
 Sun, 28 Dec 2025 09:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECq0Qmt0XAxFswq1cu73NAKtByntaPjKWodblDIcL0xgfkkSH03R1wkbkJ182GBH0vNXPH7g==
X-Received: by 2002:a05:622a:180b:b0:4f3:58e4:a35a with SMTP id
 d75a77b69052e-4f4abde3e12mr414052511cf.76.1766942504089; 
 Sun, 28 Dec 2025 09:21:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:35 +0200
Subject: [PATCH v4 3/8] drm/komeda: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-3-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eBzpPbb7DQH4mV13wWJlrn34m8m6zEyV2uFIH/bk69w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciAKlQsujWkOpLqHFrKD2XVuk+2pZawHVG4
 1UF4s0FzrOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1Un0B/9wVD3LDimX5fzl+PflgjNQGNawH3LkDsOTuXS6mmAMJoOmVBnrZPVZmArDidHcXXPDeRQ
 8L712inmPVorbB+TBGXSGmaOjgkijlxEn4yrVivkSySd64MuuYqFe9fCR/0h1pzO5Ah/fhgDG/H
 NhtHHzJ0PSJsRjGwjplpouC5WpwouFW8FP3+Ow29Cw0LfLlTjzohyH28PwIrOy8YKDF3wBpFmZa
 klWf9iaFvj1N9WY2IZoSXXmrXNcuce8p/EVkjV2hsRb82YJX9P9Y4iZNXVKGkwMcHtP3Gp2P+w1
 OpGRCWk9mpNvLaUoTirYlk2vfUZrrS/pK+A5WUQwDR+Rvf9Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: iBHo9jyuNnWBgBjSh8WidNkesCga5ri0
X-Proofpoint-ORIG-GUID: iBHo9jyuNnWBgBjSh8WidNkesCga5ri0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX6NcXrKcypWXL
 DspgLz30nByyRMxmsgC8g6J+YDK5RMrvp0R0I4/Y0a+5s9D9TnYOGjJfyGMmFmWZsWstE4BiEV9
 HiYKUdAX2kbGLSlkFzVpFro7Zmr/7+eHN9HxByeYK5xLT7AkzXBzfMBvxpMFd3p2FNIPLIfJtmR
 TC2Qz/dVVViVfl9oy1dItL5+u8HbDcw0oRoOduLE5diSorGPmwLGBe1wxwDYzyGftgPff/S6QFb
 qVxzPxMlBieQqGdD55Di0T2GlMFZVPQuhwVRcMwJ3DeaLgnloaxcp8YFXfAWpuoRL0nLPNUfL/b
 B0rPRUMW7g8WDbj//ayc9H4ur+zI0g6Tihr3cLV5oMJKTB32C1PFpf5gPyPj4OxIoVavORmrt8x
 TYqOw1BiCId1CuteFAWv99Q200n4r9TiihPiUvx+kDZAdrTxmOEwRexYpg2ouZKQjDh5z0p9tfo
 kKHPQ2EhqIFGbBkAExg==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69516729 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=EE5oNXVUeA2ILyHCr4wA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159
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

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 875cdbff18c9..bcc53d4015f1 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -5,6 +5,7 @@
  *
  */
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 
@@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
 	return 0;
 }
 
-static void komeda_wb_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-	kfree(to_kconn(to_wb_conn(connector)));
-}
-
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
 	.fill_modes		= komeda_wb_connector_fill_modes,
-	.destroy		= komeda_wb_connector_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	struct komeda_wb_connector *kwb_conn;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_display_info *info;
+	struct drm_encoder *encoder;
+
 	u32 *formats, n_formats = 0;
 	int err;
 
 	if (!kcrtc->master->wb_layer)
 		return 0;
 
-	kwb_conn = kzalloc(sizeof(*kwb_conn), GFP_KERNEL);
+	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
 	if (!kwb_conn)
 		return -ENOMEM;
 
@@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
+	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.47.3


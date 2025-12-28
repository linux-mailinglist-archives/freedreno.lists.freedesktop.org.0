Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B7CE53D1
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 18:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53F311AF6D;
	Sun, 28 Dec 2025 17:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYHaLFlD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yf3e3YoZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EDB11AF8F
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSEkBid2773520
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eDPUkbWaxp6KrkSFA85zDg6sVbEErv1b26+6ctk/jsk=; b=kYHaLFlDC35bkGHD
 OdWJbpsrEG4tXDjd8ZRlG78SP0I0IfEgHKtIOOXDXX8RQCV7YuIpU6KhrMDdHURl
 DN0+OTQmmUVx1FKwoiXsL0aW19RGu027RVFBeYo4cbLU1rUE/LgQO/kDkPahXNt0
 X8PO37DDjeAp7GE7oSBEkvggk4BgJG9jXhToSnvBS078IBzdedw5F9G+VTV0sBPF
 WDnEHHGzZooWUNtI4RgS09T6oCqlRp+6ErXP/0sRfqIyBA7Kxm9qxiWZgj9gWsQF
 uir8ymMHK3WcE2WC+VFV/3pfWbSZZSTXhs3cWObTZDgzdtrvPhPAkGeCdy2r9Ok5
 gOXxXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg2h9b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a2e9e09e6so313540876d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942507; x=1767547307;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eDPUkbWaxp6KrkSFA85zDg6sVbEErv1b26+6ctk/jsk=;
 b=Yf3e3YoZY/ibgx6e/xZ+PWxJhaISzuHNCqEPkS7PsWbo/5/Bf/H0RzaZe0od9VsMrK
 9H8suM3FtEww7dlm2FQAA/w2D6tDmhFJ+AxGYqwJHGxy6MYobHZ1E2frOQmpgPCxPp4R
 XP53sLfqZ4sFw5UwpIgu0seSTSsd7e9RLCH2M9tZSjgFv2YEm64H/ni1cKeurtX0aCou
 7BVKzuXfToiLe3KDwTCHk9DFIT7Gg16IEjoFXnTj3yu7pH0KHnDOwgvi4oTKlAmbMIx3
 FInsW6sn9kh7ptYJ5GWXjwltWYr6JxCGGa7l4tecvoliYOuiIy5ohKrkBobreaatpaWZ
 E04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942507; x=1767547307;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eDPUkbWaxp6KrkSFA85zDg6sVbEErv1b26+6ctk/jsk=;
 b=uOC8NoIujAeKHNwOXfwsN3o9W9KR3OvZOW76REl5NYJ3sIUZ51wRveAFItE3MuC50G
 lGq8Afxjvxi1ipnd7GxXiMbOzeuKq8kq+6usjmRdndlCsMXE5T/Uw0Skl/GNi3pUVG1R
 LNxK1tryW9q0Ze0PpNVJmAGWp0Ms3DvNlgrxHf4l2EjAW0krNQIaAk6joS1QBDh9omcf
 ltQt+4P4T+8TedGozs3JmxW/IW5dBX4VW4P98eWAlkz7RqS95EPnW7YkOBP3J4gIoqhz
 MvPzXOWbggiTyjy0YKN48oTu13XEQLZy6oOWCxsGJfQ3CvCyK3u0EWHils1IEsYbdmsY
 JKIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkQKjn0o8g4fkgTEAMwg4rtXuyAINM+r8YNsBGqlTdwigQcBCb3X8MYXr8vusOCl6Ufq9RljIYb0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhDRbt9P4hdWrdBk6yIRnfTVDDuk8HEhIcLR+Aix69VesuBP5u
 FVn+x6MVYr76RpYm5l5xtdzyzZo1g5rkRD+n3FyIaSUMcwXKPwcEnPQtTO4Nj/Scw5K/M3vdDhm
 P7xZZsKwGwvYxaKDy6ZhhVt/9d6Bx5LIWOV1L7N52cMP19gQRKWXhy6arT8EmnogIRrffYMw=
X-Gm-Gg: AY/fxX4jLh+OZxq/j6/yqH5285LkEmrirTgBl+9y7hrUpbUs+D2NCeqEQhru6iaNVus
 eM+23HCXqLWiBVNUA1OwevhmTMh+41wfR0wSDM6He3+ZHRjD1wtuby3xLvJ4RfsCOBUnzmod/hy
 8gQjC6y9VlZ8IwHj6xLcbZuT7J6tBe8MnZUTmo3ZAlw/UI6RrjvPTV4KPU8ixJr+BUDsDdHvVQo
 srnK/Xr3HLD6y/24XYFTrVVrWDI5/mrWpInPWpzDXZS5ZcRYxFSB+8y6t7OBj44Q7zOyk8ks1ID
 BnynO9qd2u2G6QBrAv7yTDVzv3/SZ0ao5836wOtor6JId5qFrijELNnxcQmQdnlx0qrHsmVFlNf
 nuShE2KC7vXzlcCprJFsDozeUlz7ueLMItm5SnXKJULkQS/eOxZDHfjeRpvj98H6C2FjmHHoLjq
 qGuSqS7HyD27OZefCO7G8SyyQ=
X-Received: by 2002:ac8:7f92:0:b0:4ee:24e8:c9ae with SMTP id
 d75a77b69052e-4f4abd80862mr441188701cf.53.1766942506998; 
 Sun, 28 Dec 2025 09:21:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf5aTkXX2NRIiLpAzpQc0et6EQtLYn+LiKPc7DpfXcCxPaXlFr5U+z+AsfAIGACL8LJu3LrQ==
X-Received: by 2002:ac8:7f92:0:b0:4ee:24e8:c9ae with SMTP id
 d75a77b69052e-4f4abd80862mr441188411cf.53.1766942506525; 
 Sun, 28 Dec 2025 09:21:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:36 +0200
Subject: [PATCH v4 4/8] drm/mali: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-4-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2565;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gak6kPX23KHHukq6jZcbolLHfiPNT+W+DhYM18BNpYA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciDY6HHVs6gK21qEbheR3ppdMAcAcg1J1bT
 HyuUH3YU6yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1bX9B/9Zu6zJxH8C9m/gvM/KNsj5PCPWdiWrODMBmBWvdZ0kS1Zzm5usg4fc68mBA3PeOEy4kLR
 HQ0l69wS2Y+h9iwJ9BayE9FBb/wQN8pzE7kVD8Drxw4TCjEbziAG6HN21N7i0laDyN2j6G2Z9mr
 QSK92QX3QgrGr+Krx9J9wX7b7qkNzuMaQk34CAn9b2RPV0U75LTpKkfFEufPXEgF142bA6taW7g
 DWeoeEI5Wvmbn57820/bNnAz4D+cyqwsf21H4zDvc+i+vIpciJwLuNigEBCTLW5gewsSF7UUAyD
 cV2GYEwZ3Qgrzw7WdMqOvqqe10L/fRWYeNaZ9KLEL759Utp+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HibVnJNYka6Uac5_xQCPTTeJ1PTGUKVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX42VdSthsr+BY
 zj+WHu1llVS2vuYRldGcg7RhKJ6iO2bTzwRuoG+y8Ph4BkDw2CgtBx8baSZdjwI9BpTdgi2yZtg
 oDr8j/ocvKh72ma6BIPbg6BnyZB3gRQV7ZOPXdG1Q6ABPPt9fQuYh6tHnZmOW9LWA7B5cFhVSz5
 855GLogAXGvyBio/yFYj6kAtEqeGn3vaMWfLC5vr9KAE22qDzG0ue9nwpYiDaivnAyPJ5qQ5tst
 SMzfBZl0w/Ah+lSjr1Q/Zb5goiKDQxPNX7nrSRawKLwoTJ3QSBsH2al0/cRwhzSKjVoq33BJfdU
 v2Z+6kc4HYrc0aj85IzjgOZkyH2fwcRdh78nZlxv1p9yl3JS1m6X+ILP09xzO6kUNNEakcREl8H
 mg0yD3G11uUsbieNPvOn5YIJSZ7KhPneOmCESHogWMzyRWMpNA5ddxCiyN7PO+lig9x9XivPMah
 cELY10IAGyCturjwY9w==
X-Proofpoint-ORIG-GUID: HibVnJNYka6Uac5_xQCPTTeJ1PTGUKVo
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=6951672b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280158
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
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 47733c85d271..498db114ee9c 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -85,11 +85,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void malidp_mw_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static struct drm_connector_state *
 malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -115,7 +110,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = malidp_mw_connector_destroy,
 	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -212,6 +206,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
+	struct drm_encoder *encoder;
 	u32 *formats;
 	int ret, n_formats;
 
@@ -225,11 +220,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
+					   NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.47.3


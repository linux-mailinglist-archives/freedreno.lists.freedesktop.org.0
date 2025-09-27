Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD337BA5742
	for <lists+freedreno@lfdr.de>; Sat, 27 Sep 2025 03:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FCF10EB02;
	Sat, 27 Sep 2025 01:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDi2iJBm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF0210EB00
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:05:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWst8009523
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l1ReRpPqrVzS8dYBiuFlXpsNAUSjSC7vdxG38yy4lOA=; b=QDi2iJBmOAe289bu
 ESavkYGg/aib9Lmi4hEjsKBuz55srjSA/nH+EQWD/o0RpTB4LmHnG+WlT2dECr2c
 7e3Q+8YlCBiZV8X8OFeXh9WeAB8nSENYypTIHGecs/5uNAYH+wJktkJuNz0cAiZ3
 uxtn8HfWJ4d13s8O/1/qw0X2IkKnFpu5ip0PgspkD8Q4wkAjrupE2l4jmk2QeAkE
 7xz3t4E8QQ+8nPaProcefTjG37VaYQSO1Yr4yoiytjvECdW7ztDMm/SO5IrAi74X
 JJbTzGOaBYsbyG7D0YuiqahtW3ZRIkwsyPJdTlQq1p0jUSVJcvIjQeX7HZXOi1Yv
 J6zJ5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49drfwj5md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:05:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4de2c597a6eso35836691cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 18:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758935104; x=1759539904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l1ReRpPqrVzS8dYBiuFlXpsNAUSjSC7vdxG38yy4lOA=;
 b=TOsJ+7B48B7jN1BECd+YWdnGnw0iwTC/0MzunhSsp5pGggRsWz+qBfOo/OZNfhyV7M
 OTFYrX6pJTaiaI7dbUJE+N2Vh+hrfgCFAG1R8Qf8ZmBBi1AJofjXMBw8lxfb3fw90qY1
 bzQSPNnzI2kELHSsJZZnJYRjgQJsOeZMgjzKf+kYpy0cSeA38xJGTVu6U9Or2wPPiW1u
 gBl0tA+i60vSWPkFueEUU43HmTvcTODsHSyb0nJZQPn7dAJ8FyXwdgIte+UUFfRqB6MZ
 mDvDbv4Sk+Wfi0Li6s7dQV6TDsjvghtUhLuJsAZtkcowutYcoKbqXNCawzo8cisPnSR7
 5BmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfgDsyQwMWlCGQoJZ+YyYUdFgvtl8eTa+H4+nduYc8XGmVAGtGVqFBas3DABLEF3AdRkI3HDuG8Y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVY2qSV4NaeLluwkZNUH4Ebv6fpmhupjvGkUbRq/EXP4D4gpsE
 3SqTnYeqASjtLJRwkcNwt1pmmU26u7k4mB+VNxtIE8w6e5pb60u948MRHguE/ptAZvpCfAQlALR
 z8UvKqO056ADnQJkK1bn9m+yPXb/I/H5EySXUCb50VG73IJWdTvui45DUI/6msqjBQ/D/UmM=
X-Gm-Gg: ASbGncvsf3p8Aclsc2b1JQs4K2go6hYTlCnJJ0bI2HBItobyWe9hhMdWeXHJQe6mGwN
 negd9SaFZ6kTPF7vDeglQhux5OC4hO/twfWeiFEqTLDQWGjo8SkpOCBNd49a3XJyLVLNENKGDPE
 9iAHjlz4NiuVz9gerQCbPm7EUYNt4jmdydcHglVu7AEEfaWuwjHCT9IEnJjyvx4WB4OqnPKr/Zr
 B7czY34Xxid/2i2B4TRsEQa0yoZgHy4ktYL4kL6ZqQiS6QFMnxzBjcqVZAsO/+DdIMi1B90o/RB
 eo5Qesrw9QvQKuSIU8RpabPeeztIqGsyPAZP3paatYTOXHJgcCrgswdUranesAmSqGvdkdSY5xP
 Wp46XT2LNtwORaX3T4YThfjDwMhpJgJzmXMnBpc6wDejxp5M/9zoO
X-Received: by 2002:ac8:5852:0:b0:4b7:9743:6da6 with SMTP id
 d75a77b69052e-4da4d02b61bmr114903861cf.70.1758935104430; 
 Fri, 26 Sep 2025 18:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwTmhqnyjZFBwp/HsFiMEBnuWPK9YLUS4DPznVcdyQv+I6YogfCDp6AQn+3SRx+7bfeXBXfA==
X-Received: by 2002:ac8:5852:0:b0:4b7:9743:6da6 with SMTP id
 d75a77b69052e-4da4d02b61bmr114903571cf.70.1758935103968; 
 Fri, 26 Sep 2025 18:05:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 18:05:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:36 +0300
Subject: [PATCH 7/9] drm/rockchip: rk3066_hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-7-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2953;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SRdsHNR0LO/SljNP2tmHd0np6D3Jw2olFDYhbWhBuVw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgg5I6HgovfGNCnJrr9DZzOmlvr89IG2N7Im
 J1IzAHqkSqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1QseB/91TXFBZi0pEpfz77geu/ZrsROvcW7gOnMXI7ySzBuNlQ0kbfHKfrR1hUQKrPiz+7O3Jyt
 NG+3ogi0SSqQIhJWGu8FsrNLkhtixlNgVerOl1ZDM2aZ+xSH870nIvmmE1uPJey1/Za9yRjxka1
 kIELmhbciVh07+E4ejIJiDgMU/A1ybNMwnRww/7ZFXo5VNDJ4bE6RrOn9IdGr79W/444T+7Whog
 LSCWgGHlVq4g2bQ9RmPH0uGaOYeFpNQu57k5KoEvnqJv1jFMj7p/dAs8EyfS3UCh6z6w+UvR3Lc
 oq2InUo+uryQ5zZYarcxA8FBAO5BnW4QIvwhKBX0jSUfxpty
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EId_b9iGVGmvr5HfEBG-AjgBVhNIeDFO
X-Authority-Analysis: v=2.4 cv=JKA2csKb c=1 sm=1 tr=0 ts=68d7384a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: EId_b9iGVGmvr5HfEBG-AjgBVhNIeDFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4OSBTYWx0ZWRfXxOU3ABoeVmn6
 6H2KOE1oE2dZZh5Ougu0Z7/mnZf1yq5F89fAcUBI2jterkjwT6Y1xSm3ITZg8on72TLANdy5BM1
 xj3qGLkdyBmqK7gv+6WqxIDtavutBX+afoXgPI3ix+xkbvLjmgVoJuymV9Hg1driGTsiaefSVxM
 ia9gxGzyq/4JIHhYZKycmzQtra3KECsiln3CGgkZTcXvMVDfg4kTn0ulaEEcIS+jcHjrsybpwSm
 Q9VNRj93Fu5BUWEBD/ToNW2ymws44mep0i5eAULIf29t8nlziEcp0lh07uqlEIrg7j9896fQYyx
 PhNgqrDuAmbt86thlDXEq2gAEbm+ZMi78ej6N0EERCn29Ho855FPFBcv/f4T3uXfH++9SfYL4ZR
 +NSXyjlIRYUPWFCs517OF/9Qq2h1bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260089
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

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 38 +++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..cbae27e2443798d62bd83acc8b979cfc34df3544 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -162,10 +162,8 @@ static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
 
@@ -180,10 +178,8 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
 
@@ -193,6 +189,31 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int
+rk3066_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *bridge_state,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 					   struct drm_display_mode *mode)
 {
@@ -485,6 +506,7 @@ rk3066_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
+	.atomic_check = rk3066_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


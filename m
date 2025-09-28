Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D197ABA6B04
	for <lists+freedreno@lfdr.de>; Sun, 28 Sep 2025 10:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936EE10E249;
	Sun, 28 Sep 2025 08:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mp4uYkh3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C52310E1EF
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5uEH3032256
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=; b=mp4uYkh3my/rx1K6
 uqOwewezFIOGTfAWBC4LJiqXSiJqYkSyfHxq24uRT+mIf4ORRgXxNBO1vIH47rSy
 tykT0usK7356iAfJwZYeMFnpv/zxwfiN5BCYkgwenWnIQrDjUdM5DD9rwaYu+6Ch
 ZIDGImYyjvsPMV/ckGhwjS23Mfctwxrt9E/To+vfgSwYazOG6VG/JECbyWiP7v3n
 jwJIAGaAWGWZHrREK3bkxDZt2+JJWyueAGlml6EDioGbF4aiBkiFEP2jbhEKUTNU
 nQNFfiLxGlXw6ViWcpjGOMoK+m9MCrUa+ob3FPzOl4zoUkO9p3LJC285H4tXp7rQ
 Dtscqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5tcq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4dfc05dec2fso27247871cf.3
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 01:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047907; x=1759652707;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=;
 b=TXWoUbessM7iWzMbaWu1YHe8vkhVgVPF82+qWvWbGTQ7fR+Er/6+gn3uvF+n6u580V
 c2kHYqwPuVAkHYi74Kdogf2xrv3RjguWxvUPCpl0SyDCvySfxBfTFsz2fWo7igr8mmLA
 GBvj7diqiQT1ZufFGIAoegmZ1EsenCGSQeSRcwKgl086IFCt6FcYsGBoT2tWbm1tXXf9
 6+Z6c6SL95rLpdq7XEvywuhtq+RfQo8quW+lzFLQLAtgD0/ZToJrh/rvi3s6PBg3Efsk
 97CMy0bbRFmpf5z4GCXsA9F5z2t1DEMUK3XHaW9yrcfJENtrfpYrp4VqdcD9bIoriWUH
 yxoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaOa1oCEa1mKWqS3+YAd10PXUoisyQTuWxhpWSk859zELFOrjER3fNVh98EFYhy/n9zzilx9OGY1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg/bU/Rl5X3BD9U6fkFtjVoispBdU2ABnlKAvnuBV6ZgqKeo4t
 8vxSAsKTcz0+CsPPPVjuxL02/J6WdO9rb7vK/6owIFDKvjjrNBpEAVOUHLHlcDXqtOeDccY200R
 S3Pt1K6HE+FPDLwne5DyTaHgvwy9UfX4R/I6c32t2jz1nZZc9OzxbVIL0aN8tFBQSmJmx4nc=
X-Gm-Gg: ASbGncuurLJBz1PF4FUkHpFuZ+Y4q7R1JrI0VRWPAmEbQrLusSYmBX5uu02vX8kXkUH
 nr7vnRDuRFebKxAVgjmLaneNKHhyHwPARB9batJz2sYQ+SLXJdeQSEVt6+4t3lP2w2v8X/xecjO
 fKdBLbrDe1wIciz81JRiOKLP/Ield+7fbGYJ+nBlAOKdy65TUx52HQDemTMhFNYCx/RtgYhrVkN
 p5VWQNyCLtHfWJSTvzEYrUOhiBTsMcT1BHE2AHft4S7hDAi9+B1+6B55PJa7UjmvIs3/33MNvCN
 uZwp3w6JPlu+21GioH1FiGZAn+hIhZlOiqAcr+CWVnVTI7+EnSOAnWo21uiT2cjAB++UQzTewl/
 L+2+xXL/uE0sUa4hbw0OuYeCi966a0LaIlmne4yEN87TWPhDWLAGK
X-Received: by 2002:a05:622a:4113:b0:4e0:3cdb:d1df with SMTP id
 d75a77b69052e-4e03cdbd513mr20512961cf.61.1759047906714; 
 Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4tHD6skIRR3PjbcrlwIurQ9DEwp1HfbyW5F+wYqRDoVlCeVHGTwgYk18z8akZBkWd0ey2Ew==
X-Received: by 2002:a05:622a:4113:b0:4e0:3cdb:d1df with SMTP id
 d75a77b69052e-4e03cdbd513mr20512631cf.61.1759047906284; 
 Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:25:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:48 +0300
Subject: [PATCH v2 3/9] drm/bridge: ite-it6263: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
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
 Andy Yan <andy.yan@rock-chips.com>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1/mrVoFRRvpJKLVB9yIweMc38FlRgmbKvH5lbekmKJM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTbRA2Db0kLZgBdJccCkRJyGWafvFK3UwlK
 Og2krTm2XmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1XK6B/92TZdiTuBfCGlRC4tos6HVjULlKxbSlGenYR7KxEuZIHS4Dk0YnbH092fpCdLBVwu+HPU
 ujJ62abOk2Im0tkGhv2TcH17QXLGxsVHTeyqEaTyUrXZ6CY6h0NkastGwiYHf7g8QlADuFs1GxS
 lW1oQ+pI4hic2KPX/aJrg1zgAtNlypZ9RCJ68akVjorGwphcyKNLVN+zLiaMTr2sw721zRXl6Ds
 +du/mKltWJZ2dFgc9hP/NUj79ScuZN5JP25DmLz0AaFvVGCMmY3VVDSzl16zxQo/N0sdcQr0wd1
 8zhPxNihWZjFB9JMpn9yvj1d4yupQZF+el6CWN1CghvEARSl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68d8f0ea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yMgUBx0mNp5KM1AuerMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: n3__1djvXiOVKP94ciOH_ruqg4MMkKKf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXzZ+v5LLRqvbV
 pdvnLZGPRLEjtWDXBJidVSz8dCuMbZBQlNO5PQtYW+jxeap/jTlFU7NKQDZ0z2XmfJ93peEi6v/
 5Krq6kK5X94n4kC7mhYG7sP12vorrMkyZIonkUWh+2TYvIV69mPiAwoDb9x5LTU6KemQCDYNVKx
 DkeDbFkZVdF5WgnINuj+lrdrZ4LeMjLbGxaJuhlvMMCfIeZTIAZRhjDHpTV9u7+Np/A8ofzAkO3
 om5zKf5rj4KawXvO1uT0sZ26pdnQ1ngGCAhhV+VA5v1RoFcuBYgGnXaZhAL83RPTXVE9Fb8mXgg
 yXTQ5j22tea5FfEqw3vzLyIfN4Ndi9J5RriB626HfxKGv0DqwCvBbCfzZg8Vwi0UzZSGGLSCyed
 ownEQoJYp26TtZJKLXYObnpAMVoJsw==
X-Proofpoint-ORIG-GUID: n3__1djvXiOVKP94ciOH_ruqg4MMkKKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
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
 drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..cf3d76d748dde51e93b2b19cc2cbe023ca2629b8 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -26,6 +26,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 /* -----------------------------------------------------------------------------
@@ -772,7 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
 		break;
 	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -812,13 +813,35 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
 			     ENABLE_PKT | REPEAT_PKT);
 		break;
 	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
 }
 
+static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs it6263_bridge_funcs = {
+	.atomic_check = it6263_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


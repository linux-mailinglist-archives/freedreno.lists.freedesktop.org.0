Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA94BA5724
	for <lists+freedreno@lfdr.de>; Sat, 27 Sep 2025 03:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB2510E137;
	Sat, 27 Sep 2025 01:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlMqdStS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DDC10EAFE
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXIBk013116
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=; b=AlMqdStSStQQHIYJ
 UOpVCKX4Xrkd7ZUAxVWtGuAANsXFaMCmBCuEedLARqiO43lX5qBNa88asiWxc8ak
 54clqShnHMdCMZLkGgov4+miLwsejZDIYBP+eAA+PbpvuBzW6Wlud+VXxbcg9XVY
 b681QUXzeLvVOGaIQlw+JqnnfPXD3JjjGvRPup1qKo23Ro+jjkPJT9HVTDgvy5DD
 kIeQSyRUi62iBEVRj2j9/wZxXiDep39scjlPD4Izhotle2BaQ7ugyI7EcOlJI1P4
 pLM2dS/kt2H+p1nIZu8Q1LLFAokWZ8ykyLLrlx2i59XB2l8WjfVFvex+430ssR9k
 x5mgkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q4gqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4cf47c9bab2so100708881cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 18:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758935097; x=1759539897;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=;
 b=DKAoQEr8uinlYF09ort8UOIuwb5QOB6xuCb5xK0kP+LDiOsCiMAG9f1a3z3YzLs8TF
 L02S8xTHOEovpsXdhvWjQXOscMs7XEZeHX6pha5CUac8/znBleMdZe5az+pLh+jf+Wf0
 tMvRypRDWDtkLoAG7CCPkUscy7vgY1BDrVWne+F1SoRW15HFM/1T0yjDuCOWpT5z/jiU
 3BSS+Q14B1aoi1Pus31bTkQ0sqKelEA31DkgeL/ZlHElE4UKI0JGP3gBvA6uR1qdGz0n
 B/Dm1cr5ost/tm0W5KDRpXNXP4URizqo1eu4Q6AjbshR0j912r940qaYWwalV1e0wUup
 Tc6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU69OAXdglnKJPs5GpQ8/78+ss+vlI+QoqD3e7UMcbdBuV4Ij4TNVKu0z1qCDrblAocJyfO2t9B5Gg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwZ+8GmYYCCXGTJjnu9s7Il4ccY+Mko7qJres+YZlCfq1pe0IP
 eT0Lc9gzmbo30jlhgz65W0zqY0hQRCMawY11EocL/yRDUfL6PIbWtWPEaMu65MGgPQbGfy/0oB3
 uwaCWeHKwH03H2jMpM2wuLpIA/La49bnNr0+YEDUIe2J7S4MF8iLOvf7fZ9Ru3/8zISGlPKg=
X-Gm-Gg: ASbGncsYvQhpi1Q0bnkdSKDFO3b5e1nfSSWvBmSFB3RvlFDf2WF9qUAvT31WrIHx/r+
 v/aLMLwg1Dm8ugUpZxgdK44zIGXX6x2OAkYzS28YlO356qJF3PEyMVIiLNpToXjvrdKvtR4bdx+
 VADs4KmrP0+F0r9IGKvkZkk6UKPM8DH65QoZ4DnuqJ5j1fmWNGAbEezEYHFjUuzcu1j0PcW34FS
 tONlhGmBYQ/TDAKqzgzloiLrXGUmJMxnV+uzeTriFey12mPwL5Gl6di5I2d/TGL1EJmDL7YxyyU
 5XaQA+mhR/ks/4O6fPmtqdkLLqZoa0WtYzhuj3i+3tpwEiPz/gQVZA60rJongE064lXAyLB5961
 dcao2HSHXchMvYZsVMctqQcKKrP8avgBvqUvMQaoOLtrmoI5zasZF
X-Received: by 2002:ac8:5f0a:0:b0:4d8:afdb:1261 with SMTP id
 d75a77b69052e-4da4b808863mr135723371cf.44.1758935096602; 
 Fri, 26 Sep 2025 18:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6/5/R3KCR4cljnetr7e3q1AUT92B8s6CxvnRXv0hsqXuU0evXlfVfuak/45jJZf6PNML+aA==
X-Received: by 2002:ac8:5f0a:0:b0:4d8:afdb:1261 with SMTP id
 d75a77b69052e-4da4b808863mr135723001cf.44.1758935096130; 
 Fri, 26 Sep 2025 18:04:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 18:04:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:34 +0300
Subject: [PATCH 5/9] drm/bridge: synopsys/dw-hdmi-qp: handle unsupported
 InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-5-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iR5U12JmTHXUQwMeh7Ktc2ZVP6MtOB7VE/y4QxY7Pgo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggNIldS9JOxwBNJBBO53Nrz/u36O69dPF6H
 H6nvUzECrSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1dFOB/0VjmmhzCSGfqQ5k/1+FNgEfQHtI2+JI8ViQlZDdUs2D5H5dWvZyr4BGllpLHJX5AvRyc8
 3oVTrlbiHcWYARBX/z+3/LIvB49bl1V9nqbKa2iiLLm7jeEoEFUkRHY3LX6W6TG3yGCsyBDYthI
 KoZRck75s9gIhMaMIl6Q8cLtyUWEjpJK/bIDENll22GGKe2wR2d98eXe4IV5jD5I0QwGfGXdgx3
 T4wl1EDAw1ICP8YbOs0svPI0MPiwirFHCpfjHz9PfDMJHqq8jDrD6Ogu5qvue8cly4O2XqTbcMS
 qVqd5LNwIHYUyhVax1WQnC+vkvKnnHSsD8F2nZejU51/auL3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwfb9/NrpIWxj
 lStGTa7XyB8eVOowOIbYGgt2efHZw9ARmrlJlNvB3JaS0TgrL0h705MwnGr4rlhg2NHhFsznj9n
 Jn2V3609AOeSjr3ThzN5HK+M5uBYayq3VvXZ0vXPiLY2WAUJ/kbyqlfpjBKs1Gbmtz2oMlG2z+s
 /erLjUvl0OTvdHq8utFOPnymb2JE+HkygQxwpaPl6je238REMxgHTLuMy+iwnUN8wCD9uLbJwY5
 Npu8jiTM4Cvr1XFhLUN1clKyxB6K8Jn2QZ3NK6mxzFwRTg8HtAzAjq7yISG0GuWcjOdAbItJl8f
 dEY5v6Sopd530LQy1QhNAUz2ibeopfLx/ScB+a+LLzrL/6WlG36HFhYJKyK0Eb3mXRZ+2GZVKMV
 fB0iWjIsUDUz4MbJPDSiaIQO4mkJRw==
X-Proofpoint-GUID: psTv5UU6bGTei4JHNbDrffEZWVRn3KXg
X-Proofpoint-ORIG-GUID: psTv5UU6bGTei4JHNbDrffEZWVRn3KXg
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d7383a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w15x51AS-uJJn6dZ_iAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..9a77e880b7f58403691338ee8c22d24af570acbf 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -935,7 +935,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 			       PKTSCHED_PKT_EN);
 		break;
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -960,12 +960,26 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 		return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
 
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int dw_hdmi_qp_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_check = dw_hdmi_qp_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


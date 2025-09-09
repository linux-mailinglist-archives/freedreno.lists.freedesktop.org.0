Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E2B50025
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 16:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE99F10E761;
	Tue,  9 Sep 2025 14:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7JfrdUk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD07810E78A
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 14:52:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQKU020143
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 14:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Rn4+Wi525+F0z3MVcWKrKeV/0wAxSecqgj2MgM3DOG8=; b=g7JfrdUkeQXpz3WB
 OyCGDQ9wCTBCRS5rGQFEfBzOPiI+/p79Q2bFuHoCn5lQFzB6i4qKOOgDo8O0HqF9
 XoQd/I3lBgRDrZgY5Z7WHV3lxMUZfEJA8rZlr4/DpAjL6Ab205xe7xOQdPI4MQpc
 6VkHDPT8TPU+VHe5J90awHK/zwUMKMuubVcjQtxieSdinEL10JSq0V6kVJmbySt+
 7vtXwdUZtUnI6iQN1BTe7sNWRYGKCTI6n2NKdv8e632lyzitClUIou7e29TEgQEH
 QjcG6raauWUzdsWDvMb1oj+sUUWu2ow2pbXrQXCW4x56/6OhLCoiZW/D5NTVoMuu
 F+GMHg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a8g6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 14:52:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-73b7a12ee87so67498356d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757429548; x=1758034348;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rn4+Wi525+F0z3MVcWKrKeV/0wAxSecqgj2MgM3DOG8=;
 b=gf3RCMMRGsk+hjQpHgEs8Ka5CuxiK53rY71vfZB3BC0wRi89h0KzMdgduL26GSK3MZ
 f/qnrFS957dMtXpW2rLMXZGBdQuq7g3UVyQaKV5rRcssSojsdoUya40TmhFg8T7myfEz
 nc3WYuiQqVX8kC1C0+F2qvWrYV1fqkgecfTq6KUNXvjr4cQKQ4ZkbT5Mj+8YEdXP8iTM
 YnSuKuhWV1LGHSHaCbO/yHrJ/3qFalubEwATwI68Rpw+lQyoglDYbTB71P6w2bSD8lUs
 an7Aw/3Ks/M/9cUhK6b7kxtScz7aWxZ+wYT/neVpu/+9IDWz2/flm5YUZ+f7Ve5D8JHI
 fpIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd9XR3CUzc4wIneS8sJ//b7XpQAXRaPUwY/e+JrGXW2Rh2FU5lD+7+eETb9OjOSHSy22OCZ0l2Fhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMt8EOITG2LnS1kYtprvCbhgU8fHRSsTsxxdjEoKJb7rVssDqW
 vDkqXpTDQO90iZW5eJShbqF+JLEnscVU6JosX+4gnqle5Wrg8F6KWb/Z2dCbnG1r3omlJMcSzR0
 P1Y79PwJ6O8OmFcyOpHHsIEtLnlPVD7AotwkNSjNMd8XXfqulS4ne2zlk0X3gm4VtBLXZu9c=
X-Gm-Gg: ASbGncutpprkSIzSxNMI1p7E25KjROX91ZBT6+N9KK3r30eaa7fpmObePywhwF30SzK
 hD4fShQcuLOb4l3bbPja+fFVdbIzBdddrQxbK3RX71T7L8UhkUOxOsgvCVkIOApHOVEAjyc4d8Z
 eWq8YJ114k2aeQijLiBpHprtQk4lJ3Fj7Ut10Swfq6226gGE6kyy4Kci2Pn+t4mhSSpb1YfFUh8
 ZVxvexUds64nrUFvx4YTQFZ2ZEivQaQUcsRWkAITWIG3y61XSnG0murXkoxLxhWVofnuKm/Z/M7
 h4TZwet16vheCT+jbTSvE2Pw3bwIKcyqgwdfs2Q3Vd7TL3b5qX3VcHuqxCIKJewXy3tOwSuB9Sx
 ra51gVRkFXUoLRCf7aDvoZp1vVbA5JnjLpSNiP9A9Znfd6pjIHsS1
X-Received: by 2002:a05:6214:20aa:b0:732:10ae:d55d with SMTP id
 6a1803df08f44-73919c9e239mr146164756d6.4.1757429548213; 
 Tue, 09 Sep 2025 07:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkZ1SyNAZOKwaZjgWGgZYNxsRKTBuelhQ+O6Fw6gKcHDoTAWyspctjVqKaotztS7CYCn5cWA==
X-Received: by 2002:a05:6214:20aa:b0:732:10ae:d55d with SMTP id
 6a1803df08f44-73919c9e239mr146164046d6.4.1757429547463; 
 Tue, 09 Sep 2025 07:52:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:04 +0300
Subject: [PATCH v4 06/10] drm/msm: hdmi: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-6-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJZghCboJx+n0r036AP0jF7y3adcwBpcry6IF9spRKw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8b8ieAgxj637Sq4ws+QM7LjLkOdE7Yn4gby
 LcXsEN9pQGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1SNdB/4rCLhDfybuoskGcE1VGyhQHDNRop907iuQ/KfMohI82tNkUxmqn3fcViK1Dvdys80Wyfp
 VAFYFQHBID4DL59qRb5c/LSwkwDodGdGXF6y07zpgxsnTUegD7KDvUX0gzJjwgj9tZzVv/UQOm6
 hFYKV1nXm6oA8QLpbayUSXqTlXnckkVr0Ihc4Za41VQ1aLTz8F/M2jqh+pmgwN9myyOiAZfrt8x
 2+zvee2f6gaeDcRIlcvUKZ1zM/HLgIxJ91eERe2/sZ/wV6xMCw5TMRlCArGjeIHU+4Ha9MmneeG
 bl7XeBkt3LIIaXdjnUXmsUCAPLNsip2K9VKmZWaOQh8k09Hj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c03f30 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=HI3Jv4oHZFu9xgwai2MA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 2KyQy7yLodzWJP3gpJur_6XUYsZsY7Ic
X-Proofpoint-ORIG-GUID: 2KyQy7yLodzWJP3gpJur_6XUYsZsY7Ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX19+dqMt+W3VW
 C4jb2L1rLHLqItlTC16MAvlgZqPePZUPtfpprpuT/Y98bIlT5+Bi1vyxGYqbDPIVtE+I7or3Pe/
 dp4hreoQwN9YkeV8m4XSbZx4MTprO30ZRyDYOFddWasJ+eiSAqop0nQki5s494v5LfBhedBxnFD
 fmHQDaoiK0BJkzQVCmmOv1pkLSbf/p/Glg4f58byhl5LV2KFPhHgjILdkUl+d/jybPcQoSSuHhe
 XOeHoNJY3sKSc8KvAtFO8yoSFgge+TtXnxWnRqekVk3wgq4pxLZ904J3cRHHvErpZ5W15ubuSWK
 rZuL+tbo/w+F+8QcWgGdMdfT0S6wEX6/IKTr8lp91HHlcBsc+rE+gtAC76jsVMTr2VeN9/ZGhrJ
 5cWqBAZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..f6ba8032904187a2f169456052b0e4cbd60ab919 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -249,6 +249,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -274,7 +275,7 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -498,6 +499,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.3


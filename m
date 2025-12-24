Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF84CDB078
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 02:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FF010E2F2;
	Wed, 24 Dec 2025 01:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5FzLQH/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGyYq0bg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1436610E2FA
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:04:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNHrxdQ678609
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=; b=B5FzLQH/4hdXvpfe
 zRFH90K8m6qtrg/XEWhQfEiFLYj2sJlborOxSU6Ve5K1V7hKJG6ddM5f5hLHr9O4
 G5FXrg+x2+sZ9U/OXiaNp/wHJ9rRB0Js17h6g8QCgkkdYEEOM682EJmWdkRJSwhK
 kQePbxHNlL6j+a/BpNbMONLysUtobbr5nGvrJmzoA9yB0sF9cVMuIU6eE0kaGPiH
 9zYXOPs5JQjKabNmUxd4fZ+aeTJlgQvTv72a/GeIgJrwdHaN0Dd/bJzy1t13hpI4
 C6ekVf2ER33wY8q3E2wG5W5TveJk+urBH5JoBUQQ2/ZGy/5+7CIj2iJgKbR7pbjn
 GsKuwg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq11a1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:04:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a360b8096so136197816d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 17:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538239; x=1767143039;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=;
 b=GGyYq0bgpPJeMI5zViduD1jKWoNblgs0aBOSK/Dthvfhe0iwPn3QgWDbotKy7QbQcL
 Cf3n7B9iodzQ8RRKUoexcd1cH5NCitMDofBmmCj6QnJmh/gQgxFzH6VDRAJOWoDRxVdQ
 evqwpYD7yYoRCwKut/9lHNtguB4RVgrnUkXsCGgWRQKD3fYdgTynGz6Va6bOKTTsjxof
 dF9mlEtAqs2ukOzWOlh9vcAJC5/4TGH1fX+NcLrJviWz8clLPuNY2X6zpZol0vXSSOpf
 kEjJ83aNHXjeeDDxWR2Qs8XL9dpVSIXa012Lz6tbcQw49RogdxRjwc+YdhflLq17xN+Z
 cPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538239; x=1767143039;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=;
 b=Izh9IFUIdfJKbA6KGT1DWXqYMVLTKttpXdckGO8jfs87EK4zYIGTVssumt+2zulu0T
 PShApAkwXnGh7H7L5AEmWFbaN5FeUF0uz2N7KlTImGCsPoanH5LztjSsPSDS93HtrG62
 tQp2SMnmpDj0tMH6JUxmsrYco3d0+s2vzJn9Z9SQxV8Yx6AW9KxAicld0MsbsaE7CvSn
 w4YGUFkrA6iHEqrrz1ldtUu9dpIjKgpGkOYfcf0CB5RtGsY+vbJa1l8D4z7kART8eQgG
 wDmvboIJc0LjhuuGSs+e0zBXbc4+pLPvX0tN/+RzI7DA/OZvEwz+Zu5UHWV4cOkmB3Qo
 alAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeEO4jurGkkE3cziwVTRtSYqvFqqQRv2tEO9amTwd5kxHQKUbAjn0MgqqUZdJlNkFeORi6yYFCjfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRG4CvpfXQGf+AQxKFJxJAvU0wU80MY7WM+0Y9JlvrRkgRdLD1
 P+nm2MtugSvvP8r2nPILRlaK7BH0929UCIXcczcXi2dxm58zfyJJWegP3AEDqaj0TQJPndJ7Qc6
 xHZl0hNO9ijIFROCiZvIQUblG4fJtpj9g+XAybA11iFr8xMmnqvbi8DYcTytcW9S1hUTlJLA=
X-Gm-Gg: AY/fxX6utiG5JKUwTmadqCKis+GS80NJuVEfzoKtQDMsItdWz2xxKpWSUERLHwbfFqw
 P1M/2YSZ83eibxBWRb8mfe/WQBYpWWZoaHwut4AUKjzSGo7HiVwOlGNsBvPkOPQOpPEpJXYt05w
 WgHcIkxsYU9DntbYadeCj1CMNqx1UzWi9mU+HV7FYMMipfAReFb287K0gyzjR5erB0Jl8GMAhJ5
 Z7zRvur07KtesLeboOxfRNHV+SMr6u54/F82TGaBY2iE74bwKb3t5e6E7sGSxI3LZTfswMGA9Yp
 SaqHNSlZ/he0d6as7EQ26MDfnqerbizUP032+igXkbbvoJBD0+Nsoe5igt4Q2ZXNxURZTEbJ/nc
 I7zXq3WcHHj0aJrWZjFKPmIuNPnsHTtPVXN2HesxFkNPEjOJd0qfEILTen63Hlyp6ckkMCHsVDI
 7ymZqUfEfQNUO/A6tkglhePAk=
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id
 d75a77b69052e-4f4abd98192mr256225781cf.52.1766538239462; 
 Tue, 23 Dec 2025 17:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQGuGT0UI/67dXu411P/e6eStajQsFB8+nCzwFqQBAvO4esgI+rdZ+y7jVSLNcipwTefBy2w==
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id
 d75a77b69052e-4f4abd98192mr256225241cf.52.1766538238937; 
 Tue, 23 Dec 2025 17:03:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:03:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:57 +0200
Subject: [PATCH v3 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-8-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sxrbcfgP+1lHt6WjBr3iluImnNCx0aJDmiljrTHbhwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZLWWWNHwhc00YhsGGHeZN4blSTiSB4fsQ2
 dICD4LJEyWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1TXpB/9MY/IAmp3a91kMBGdYigbcoUHZMxaQmuYtcY1pIt9hLZ/xDG0HyDeKfdb4ZXPmrbxM+Lr
 sZHIZRai5kkZBYBHRbs1UvhqFPaEKWCBVQ2Okq4Z1fFonAOh7dEtqQxrre3ELHCo/ljQz4N4wif
 r83ry1FetVmArWVlTeM2HjwKHkCtccISoiLzXtBF/vjY/mM4/GPwg3Vgf2yuvlfOviragLloVE3
 bKNPzT63BmazQ/jQ/THvNVxTXxfLg7YxC6jPXiOFdD16vj7gkXrw6SeuFK7IBzesw8H/JFK5eGM
 6letmWY47KyLynSka/FTDRJs5TQaxz+pxi/8ZGoJLndSd0+D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gXHwNuwtiFNhaPvIJtwP4-vrsakWma9J
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b3c00 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dmsjDmb_ix4f0IDqKoUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: gXHwNuwtiFNhaPvIJtwP4-vrsakWma9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXzTp9unDJJmhO
 pR+/bc5pQEFILFPIdhH489jJQte/SrBqu+mO9Wia+UK9pgjiTxHk98rG/Utjbr8+bMD1La+OTJG
 DOVdry6YnT0RpApY8bKIukpReWEQ17fuXY9X7mQvkwYguv7EMa774D+At6WXmTcIsrrWZQ3TL5a
 v0ceLmbw4DE7ApRllGl0RrLD5eEP3Nx+WF/koeEmuUI7NJyYDhPJnHAbTpjZ1tj6q0PwFDgFttD
 89JjLD1UQSsTsGOss623Uaykmx7lf86jTa0dfVQhP8zr1+bryfNNzLi0Ax0Gtk6yS5sDqpb0CPL
 yxElgMMlL7eJE1tRJaHHsFHX9AMDIP59ToLmqBi+mzstHbd7sY8oozM3r58BCtZIbmSzm8t9Cq1
 ffDeGUCwXXdhnHyzvVjRq0R5K7sKm2uH0d3cJhQHTZWNh3DepHveLcUyqsZudKUBv67P75nTxWC
 gzrTTdaQn3wpFIawkJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
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

There is little point in generating InfoFrames which are not supported
by the driver. Skip generating the unsupported InfoFrames, making sure
that the kernel never tries to write the unsupported frame. As there are
no remaining usecases, change write_infoframe / clear_infoframe helpers
return an error if the corresponding callback is NULL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index e8556bf9e1da..a1d16762ac7a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -718,6 +718,9 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->spd.write_infoframe)
+		return 0;
+
 	ret = hdmi_spd_infoframe_init(frame,
 				      connector->hdmi.vendor,
 				      connector->hdmi.product);
@@ -742,6 +745,9 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->hdr_drm.write_infoframe)
+		return 0;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
@@ -902,7 +908,7 @@ static int clear_infoframe(struct drm_connector *connector,
 
 	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	ret = funcs->clear_infoframe(connector);
@@ -928,7 +934,7 @@ static int write_infoframe(struct drm_connector *connector,
 
 	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0; /* XXX: temporal until we stop generating unsupported frames */
+		return -EOPNOTSUPP;
 	}
 
 	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));

-- 
2.47.3


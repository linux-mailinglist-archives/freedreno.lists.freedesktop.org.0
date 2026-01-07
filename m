Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA14CFF5A7
	for <lists+freedreno@lfdr.de>; Wed, 07 Jan 2026 19:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B5B10E649;
	Wed,  7 Jan 2026 18:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YT98JyW5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYd6CoZE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2982510E652
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607H7Ydm3672830
 for <freedreno@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=; b=YT98JyW5oGIce4yx
 t62vyUO8gfpzGSWjao8mBdPTYJjg9dpxi69OPT+flXHjY6zvvx9HgiN5VBgBBE3z
 aP7KS2Ai0vJ/lJpU1dpDd0Wxd3AfpuO+r5VqXRzqZpaUaKyoi0LPozqGRblpfFtK
 8FFeJxxsq+wpaKuwqGiSnUZWk/S1M+hmWmUCx+hBTMfSwr6J6aj2V5QFdUUVf0kj
 CHLH4uqz3dyg/R1Bh8EhaSUJI/DxjitNH/wMuHLMhRLagS+uW1jOa4CUCDBGeaVy
 RdCTC2bWeHtpXMzHIcJEE6pFwJOYIGnHu5DTmubFL5Kv1LjS0Qoq4BlhHH+zqmpU
 l0KWkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhum507yq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c1fa4a1c18so565809185a.3
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809716; x=1768414516;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
 b=RYd6CoZE4ET0sfUHD3dd46vvygLaHvG/N/txjl6YMNwAAyCxcPrg56slDN65WywGR8
 qk23VrUiAES4T067YUfC6PzJ4QroKGnN/MO22pgCUTZN20oFq0EXUb6n7oNSwD3h/62Y
 hzHs+Llz3PzPWk6Komx4U15AT9CVKv29Im/LC49mpFcRYz06SUScVf6t6TD4ON2vy8im
 5p42x4Zw0+taN1UvSlDxc1Irm8jU+Z66mbCQhI54mnEBGc1OxS+vgT6F3lWWuEkA5w94
 0p0ubZ+2DIb7cop6RWyOt+h6A/8PNxbGzqBMo3pDt6ZxN3IqulD+cQa5DYCRAzl5tuun
 /Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809716; x=1768414516;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
 b=nM623QTyr1wHCkBZkgEYWTDlx4qcJ6dRnB22ZPu16+H+EZIccaq8bR5dYIx+xfU8Vp
 8gGm9JaGnSM6LIJnxvhDo/CssvjiquKsjkGGCMu09e+jyqNH6K9jgPH4xvPc7lQJSuuK
 DIF47YOUZlinwdi8eXwPB+zqCzir2U+DmN/wtFElLwr0F+ZoNuW2kXSaVgzaEP1C6YCD
 hM+GZzq2BU3dmOG4jQrkF3u2ljJAgegpnJgOZv14U963e4zeMBCx31OWJ91gd06g8Kre
 lESSXVGZmQ+Cq47454WgnpCDvuz85QYFN/PNcvvkAGomihuRaEyx/gVBpmvEMVKz9vGf
 jN1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHUh28z22FjfZmhodXJb4Y8/iokLBJW+lsa6W1B7fcg9dXa45p8wXNHu1TYD/4CQNWOHJukNUjYhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrfwgAlU5R48LVqhfwvBZvkAZM2EI4V/aWS3/w28N5GShjZiXn
 TYPh4p/+Xq9x2jCASeBEHYTqy2wU+7V7cTQvR6ot6htnxMfHK821IIuAvGazu3uur1iiBvqDuwk
 twfTzDWMXJp4aZ2p8aRN33ywXn3I+De1DwJSlKSKQMWo2lQwm4bEeqDI+Tn0C78AJQvqCJAU=
X-Gm-Gg: AY/fxX57ppOruIFPUSOIuYwnwBB0dl/i/GlX6By5cm2vTHWKME2bKrfMOmtX2exCRfz
 o4HfDyM9OkWSP7itL8iC46wP488gvAnrfGosBcr464foBo8JgnoKCri5r088m0nBr9IZ+Yk5A0L
 fJC0pWpH6go6CTpIv0J8v0FnZNBxkVtgf4s1TAMgJvPlxepKqfxBhgIK2hLGhiQFZvszZodoZlO
 hllBiCOUEFlOHpHX9FlrBrCmpDFBOrUMLprRbGljYx8ZbcSWicqrlvRHXd5paExG2fzi+KKNxPr
 SL1tE+FZLCSPxUtpH4x/a7gGls4CNvrXcdrJDYwldHNTG0bRUnVqBzsxngBczw29rgK2xm16fX+
 qFwNarvRltFq8oMkFmricNA8s27ziZIWMiNQIfS5oy+OyS/RnKAONBeXuvPFR55lZwXmp8UMEUz
 8F5ygWNWAhiGGT+fLnDGqPy50=
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id
 af79cd13be357-8c38940cc79mr440812585a.78.1767809716477; 
 Wed, 07 Jan 2026 10:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzR6/I/M+rb+0CfWg9B2pwtmy0BCZ0528ZAW/PtSMTyk3JvUKmiud8K1hEOQV156GKBDOZmQ==
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id
 af79cd13be357-8c38940cc79mr440807085a.78.1767809715974; 
 Wed, 07 Jan 2026 10:15:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:05 +0200
Subject: [PATCH v4 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-8-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/ZrVCxC2ORTh/25tcpqTF3QUmYMkLYWP2fYAuUO25LA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKlLQRVN1fiNfBhJSnlQQ8yf8TEYh+A8edCs
 YWTlH3Bcj+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1QOVB/oDjydk2pqigYtLHtwvNWcAKXJbbdPGQ26WTURthKMHJhz9rPZZV04J2QY5hTtypEXd//d
 nw5Vbwc0So6ysL8Tv/jIxpWqiL+ciHmVHitK6qOCEBS+i8W0MtTLVx1YAdnQ2gp8v5gmqGooPIj
 URRZkW/XopRmGOqd8hftr59SVEpUvh5HH5NGGNoX/Wx2rngOV+KmUfwE0HXApJlGUvk5kZ/fwRb
 bGSKspZn9xiu+96xWnVTNQqum/Ct/2q61VCFkl/XqCm0lDpae50DBapNsWOPBMIWt03yTjsHslN
 UvAY1W9Roxw/F/vls4Ff8wqqmvewupBjJYfykiyeu5Y2vHLK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mq4kVwf3-Hm1UDIZFCANvZZRR6PIqI69
X-Proofpoint-ORIG-GUID: mq4kVwf3-Hm1UDIZFCANvZZRR6PIqI69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX8azGma78PkAn
 QlB9C3U+koxVscxAMlrraDRytYRF1aN7QocHQb0CmuKj/1C+WQA/5lhTzGhvUkCmLw5EhpqOhtU
 ll/0IyR3mTatEryxxGMwcoYhzu/eeLlNFHM3GwY688oI91DjDJJn+UiH4vr6GY6an++gNsT5vQd
 kI7cGyts6MdAlw8JWBN7lw0tJLF2M0Lhk/Mq8Aavs94eepiIz0r/mG6Jr1CvADQo/dhRBk3Cw3E
 dWN4HFwgK5cSiHScbvObJjHqjpANJBqHJ2q4ihTQDRYNyJrxFY/krgKepEpQhjWqJ5yNYWZhYYg
 ODaQVMRtTxvTUNLQraUd9jknOPfWfRrQksj/W4nWLYmHZYbjIZILLHtZLpJs2nmfwp6PptaN8ez
 KlhQW/64we2qiOZBqo8wwd6iL7oVc2RKm4muYRSp2W+275KGKVKWYhW6kRdxSFNTKgcscp5VDg3
 6LuANkf+ufmC18GWgPQ==
X-Authority-Analysis: v=2.4 cv=KNZXzVFo c=1 sm=1 tr=0 ts=695ea2b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=58UsvUJqJn8fpqk6aeUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
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

Acked-by: Maxime Ripard <mripard@kernel.org>
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


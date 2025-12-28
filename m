Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2DCE53FC
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 18:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A4311AF4E;
	Sun, 28 Dec 2025 17:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHYPAMyU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R2mjuOxo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A235B11AF4E
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSAAQgO2760133
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 stPaTlDyP6pjIcLXxQYHh7Ugkri4ssOkoL6G6tZaLY8=; b=nHYPAMyUOg4sCsC4
 eB2ocb4P+RrJTbrr2y+1AnS4GWXykf+30iVKmKrxfhWMXN7G7naVKHSGHx/5gaH+
 Q/Qjm+FpVgVYXStDPg86nHoGVpaZe8s5N4+26SfuTnzB4XfduT9iKuavdpu2aLlX
 EAf1wOxVxh3fQv4KBwz0bVIU/hZF5h/fqhg0wOoAjk3R+ZemDHhRvM+dqeMmwiQS
 IY2ufqEuY2hAz9DkeWrRKpKwc6osNB5VY5wxro9fHx+ZcjGjkc+LG/9l9PMCQF7L
 Qu2ew0tn/y7tbJtB17mpXJZKvmoO6SXpKmndZ6KxVUDKubC01Fnp9pKxKx+5IMgP
 4dF9Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wtgbg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f1d26abbd8so250848281cf.1
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942511; x=1767547311;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=stPaTlDyP6pjIcLXxQYHh7Ugkri4ssOkoL6G6tZaLY8=;
 b=R2mjuOxomfSysPIvvPcJSvjHe459kOnNE0x9w+nPK7Zrs4ArhUYeA/4jLyQnbo5Fse
 WIFRmIjrYOltkRr+52Dkbcqkt/YhveEs7nS/4UibsBcKK5brQ46/yo5g2EMKco49xdMG
 CnE0wkI4KPVLnu57bPTOCDT64PTv+TRUvTzzst8wgslufrwpGjtkljJBk68Ztd6ta4cu
 uiT9mjv3yWkeCzTz6kpWsMVlDEWaVQg3XStv+ol7W+GLIoYnJ0Yook8r/V/ifHLt13Lk
 L2ztSd7X9drzgDsvRQMywJcaDzr92ypyTis9qNWw5fWXajB1VAtYFrZi59LTxD9heiBZ
 k10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942511; x=1767547311;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=stPaTlDyP6pjIcLXxQYHh7Ugkri4ssOkoL6G6tZaLY8=;
 b=g6IcvcS9rwCWuscan/PMkDHvnTZQJJUFd6Nzvx8sHfQGgSLPhe5/yl6eqiUP0vXxbY
 g7ydjHEghEnyn8zYC4SpJsgDePg4ngR/qn42Fd+ogmV3XVqEPFmHBKqewLJP2cngA4vd
 AIj9DEnIbVrdizLn2NgIrNQNKAS94JpyK6o6iph0s1SE2Gd31a5x0DHOU39HPXkEPfIJ
 NbSXvCOZ2CNyRZvSKYz8zuKLiOAOydKyb2VDq4tqsMTlLVYKTu9RH4d0oJpSQaiLUyDn
 j3ij+3jdvo2KSxDBqZ71opVYKMiQKOIRBNiayQdaGR0VrPaevMXDe6pVhnYLrSbrBjeQ
 dWtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQsX2holES+u7mHah6iKGwwoTrfmLxGkAS49NZL+FIrZdhBHIJd7xiBBEAIKHoEkB7jMJKkl/NpKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2KjymLqBTYyDhF3GV5uAWd8wU5TVnbmgXTbBaXdZsugCrfnel
 aQYEARfANBL6x2OlhZFduOAo0I6rcC7MWkKtUixKc/iTun0O5RYAB85VBNy4ypusTyIDVJGp4ao
 dEBm1RQXiG135El0v7PRU+2qlDKE2Ju9KXxaxcGJYOzNP3RKHvHbJeOls4doQsjwv3z0iQLw=
X-Gm-Gg: AY/fxX4JAp2XyTshQfGo4yB0grz/40lS+t2gFs9TS+MdgO1HazrEpAQ6uM3ooy//387
 JuxCYRh0Z/OxLdeBv6AU5RFKgjJkRpXbxAKGWHnShp1BGAcFJHyU1nreMNTXM+GPYb9SqyZvCvG
 RZ9Z65Q4fgZaBhLUPINAqxD7osRWJnI7exbdzRkYj0bhhyVvvtUkpIOfV0DNr34M6bimfdVSucc
 VAXaxrs4VnKPZuTNAd09xYk+nTW5K6dFC7jQ1l4IzyfrlqNx5OX8t4DvXzBscfB3bveknD4c7C8
 GzATe0BG9kZ9lenlVyz5V+iVSNCm3MzjIGLeKOVSR54rgYa+7efYiRijcxr4h2DKsFK1Wtuw5qW
 Cd8Ysx8sSlFUrPb3VaaMmpPOq6ZYOSMrBGOkZ02qp1LfMo7r/B4E/DzLYmkzm9C8I0AyeWIi9kz
 P+V/N/tUakMzsm48UOibYFtfo=
X-Received: by 2002:a05:622a:1f88:b0:4ec:ed32:c3f9 with SMTP id
 d75a77b69052e-4f4abd055b1mr480629911cf.29.1766942510576; 
 Sun, 28 Dec 2025 09:21:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE46X5ME/cJSAhXh+LJc/4rpNKJJcT6TLHe0qPrboYnIgch2/evOzlw9QUxO7vnvIRO7gsLtA==
X-Received: by 2002:a05:622a:1f88:b0:4ec:ed32:c3f9 with SMTP id
 d75a77b69052e-4f4abd055b1mr480629561cf.29.1766942510201; 
 Sun, 28 Dec 2025 09:21:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:38 +0200
Subject: [PATCH v4 6/8] drm/vc4: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-6-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xzYTa/EfA8HI5QOy/2+R2YoV5rkgAh7n+QXK0lkObWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWcimSXjC5I40z+YRP5l4N9Pd8rbhOQ57vQMn
 zZaKY2yKwOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1R9HB/4mQmUa/OGajO4xKbD2IFdVvt+++OOPGvLicDm0j7FhJTr7p//We0wf1N+GA+QqJGZ0nxy
 V4ezDgOozgp4Uvx8QVOLOfZz1xUCjntHe6O4xTR8UBlaj/LqAjoRFm0lUyAdxxLMEyEU521iP2N
 ZbOLK1AC3yfLU5himWI3isf+GJ2dM/3dxP0Q1fOlY0QNu5wf6/qTsYGOUaKHuaiiVA6Di+FJC//
 +rGCKFkjOC/N5dGVyYL6EPg/z37Z0bKg7Niw01ZUka5FxAQFyR/SupZMD46M2HW1QCY2VYCZ2nb
 QUVy5ElbO6tShYK9+5jf+O7QjLkgOhuEc9COHlpUlxMEv6fO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX83wVVxvqk8gK
 s/9OP5Ms0T5PYXyep8jQlGrBHBq347qmaPgBezIq68b9kITJLCVdSlWmJSOLMpbwqEaEQHXDITp
 hIaBS+57kf04NPuTXppalrPJDWW74/NIdPYNOb7CxsmaGVpxVhnCa8TWrv63cdj9zDD4iFJhJAj
 YTlvkmmmIURo/GVzkR3GmO61Azi9OkwA/FjCV9BEMfwrw/5MEmI+GutRXUMf8qb3JHY7KwvYHxN
 LWRo4s0qveaFF9pHNpEXG28H1sydL5MmfQZeDHxXCkd4U0eL6V7MEQxxs9wk/wwBlEPMYnl6uFG
 g5+54y9TW1HQpCTpA+ZEwmbdITYMcLc0Yu2G3RzqdI5tVwlXsGCwXXvw9rvizIsWGwfJ8rdYGyV
 I3pzF+YM5Wu1ZXjpASDuUceHwNICedLQGS/J68MP1R6qNcCKmm3YMPER40sn23y9y+UTJGDbpb6
 +GKx/yMcBZS7eIadVDw==
X-Proofpoint-ORIG-GUID: -mPsGvM77dhfZ3Lig7DEgt6GJjeK4qW1
X-Proofpoint-GUID: -mPsGvM77dhfZ3Lig7DEgt6GJjeK4qW1
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69516732 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VKUx2AQ49gFIcjACzlMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 9082902100e4..befdb094c173 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -378,7 +378,6 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -602,10 +601,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
+					    &vc4_txp_connector_funcs,
+					    encoder,
+					    drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 

-- 
2.47.3


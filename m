Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6766BB28EEC
	for <lists+freedreno@lfdr.de>; Sat, 16 Aug 2025 17:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA3F10E398;
	Sat, 16 Aug 2025 15:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5Gt1UWk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1937110E399
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3AeFj030607
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=; b=X5Gt1UWkBtIMJCFm
 C8L7MumhPmhoSG0JDTascQfKTI9hjhrhWUT6gbrN7YuPvnXR3pQr58i47YtlolQN
 M9404pODYFr7CzBpOICBjFPwepXwNswGlCBnmColodWNtAyZq4hzs+pl3ogNfW1B
 Io/VFH5qHPn8Udg6EQBqcsDBuFvhSkQ7tDwwZO4Rkx3N10j592iQjdPdOJdo4mJi
 JbwZTzPi0guL22dBHpQqI9VBC5u/2JMpBrd9evWVZ4EkZats8p970cEjfmK6BnTz
 zHr5v/oy9oNz1LO9J1K5KBBzMAnmEk8OU00Cj/P8XIbEGtcxNzGBH8cx2XShyKbj
 O1rWgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh070w56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109bc5ecaso78089621cf.2
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357589; x=1755962389;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=;
 b=gAuzEngxHWoLv6cxIO7/2M4xvbLW3dfKAtQpnwcnWSxmYSviIwlj7/Wm8LDXr7qs0B
 d1xJvnm+OmZJL5hdAw3AGULJP5AG4H4O10U0ZSnPyC+1RqbjA2tfcp0+ZP2xDiHRbGGq
 tM2abYqfPV2aRaoAGr67mzzWuVIKAZpjKvIi9giuUytU0a3MGk/MorY7+rB9rki+2NUw
 /sviFkq8acIN73Kq/19gpUC3/Hm3f1KJUQx6T8Ph+OwW61DK6jRUuBCHm07UFx6oW3jS
 aHcS44i4gYo1DauLMmNJHIhwkJzBJnpR7UTwlNzMVtk/XK7PIVBbEdLLm3dy0B4ZzB+j
 wSow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUG48horqfIMYkpHJdS6L/eA8qh223gusz6e05xjzRjZxszUGkTKATpziovaBF670HKTS4LUAJfkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPLPtfbP/zaBh8oN5Oud1Do+M8a1oRt8vgLSLkYPy2h9RSYmQX
 9jmIGYP1+CNv3fUJUvp0mDpH63vjpvISUIBRWdBaigp7m0QCzir+zsu0eqNb/UQN2swVX+V1axr
 UyvpKwpulNaMwMLtQzT7EgnW7/IE8Ymdv9pd21E8oGtPwTvOm6LgkRuEI77GYOJuW55Lvl7A=
X-Gm-Gg: ASbGncu9Lv3qKRwUJnX7AAQHecvi+stknFVl0KkT2zQ7ZP0eh7JljAUJNyLGQ2B5R76
 fIVGwTMESEmr8+8G5Eon3ICOBcFBv9gJEQTnSmmJgej86kQA3xkGJcMRu+aSxVqlky7iYpt/Mmn
 uv3wtLwLKMIgXmko5feI7Lg5+eduaNL2SZy6RBtqB8nDwxTizmSjDCICGJq/1bb5wwILfnafOky
 18QbAM1o8ZFGrYy8j3BY7ecI1rT2F71yfD+fi6tA2InJKL+Mnghau9JrG/PtCXypuAcwXaoO+q0
 7E1PzC5YbZ0fmw8fdWsadTOPKM9otnLwE+ZsX2oyzTqhMuuslIevpEWysFPzXra/VgQHrSDE/p6
 hmT8mFRcvZ0rJFDltoGWfM/3mYrJ/TDZcTFA9Egqpuk5B+FDuyzsA
X-Received: by 2002:a05:622a:1803:b0:4b0:69ff:eb71 with SMTP id
 d75a77b69052e-4b11e05f86cmr89079381cf.1.1755357589318; 
 Sat, 16 Aug 2025 08:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4j2k4YAYzpQ0pMCPbpzOT1o6CdrG9QkvoXk17IoZ7zfFypPLXZJtxqIY6aSy3p+i62FJnEA==
X-Received: by 2002:a05:622a:1803:b0:4b0:69ff:eb71 with SMTP id
 d75a77b69052e-4b11e05f86cmr89078721cf.1.1755357588831; 
 Sat, 16 Aug 2025 08:19:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:39 +0300
Subject: [PATCH v2 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-5-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
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
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/fLUas0t6+pmOh4Lpow6ATkHgTqazIs0UqCL1npG8PE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGJrX/EOza+6SHDDyhh3b0F4k58JM15op7JC
 zsrf9qs2FKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiQAKCRCLPIo+Aiko
 1RPCB/9KsE7LBH2gz3/CuiP3n3VWw21nUSaR2KEoT3QNbRnJ3kkvF8BVfxyPCfMPXyL8GP8+X+W
 1eo7ACU/9lwfSLQKW1Gnv3ZPNYawwta+UR+hdHck6Lfeu+kPxKKOyqfVp+p+zVXa0SQ93cL/NEf
 JS8K/7gj1Mb0FMolDe1qPEfHsG8P8LPEiTcY1SzvEDp94WNhqZe/hngjRryF042P4d0Bj7worm4
 akTK/ST6rN9abWTt+MI51ZZc9SW1GkAGBQM6+yP9YItM403Q2JqK6zELkFGY5AXyQ8ICXLx+5Rb
 2lSOj6fPeztw3nIfRul5Iclrps8maUSX1XJImBsAqhNG89N4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: hNBe-NXjr3Xx76jHd7asVgWrRbH0CDzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX8CIGu0k78v5C
 JTWyOhac4Fyny0Ihe81B/CDpZ5a2jcIXEs69lWTO/x8MnYITKfmez4gZ3C4TsTz5BhTcJbVkrig
 TVc/VzfuwK9yywN+4lPW5qTLbk9Xoj5Ijan+g7jaH40fUEwPJ6mRsYbHS72w1WZDC9GNYPIcekx
 qx5mVptNs1p7ZSgv22HklIBHB03raT3yed5JGo2ERHYk69Lqmji46lBFXIAqbtcT4AIKhBsyy+g
 rvpffRP81YTaYyRLHZsVEo+Ic3r9479zfRNlmT+S4gtRbBTMTdSmlgCndEA/RXOsPJZaJD05K8O
 GYVDTsQIpkhmoZgL31nPmb8SNwsDxnnY5E20mu7S+hJwKT/CZG/CsATjUVvR+DgvpqlbiBjWkSz
 0NVlxZ/F
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a0a196 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: hNBe-NXjr3Xx76jHd7asVgWrRbH0CDzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
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
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..64cea20d00b38861e22fc53375ab41ae988ceb59 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.2


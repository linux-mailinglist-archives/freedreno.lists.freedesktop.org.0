Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A346DB2CDF5
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 22:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C2610E682;
	Tue, 19 Aug 2025 20:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFhsWMUV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FCB10E67D
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH7mDF032373
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=; b=bFhsWMUVsK/mgqrG
 NSHunI1XmlSLZElpNwvyRiwZ/3mr5cI5bLIb1UdAw8uev1a4V5yaOTBLATlcDjlo
 W6T2VMXL2ko8M0yuICaEq3v0kpOrPxbN+up8MuHWL6BORh49znwHpRqIRtEx1mDc
 Q6cEZwHXvWMCRPEBCjTph0OTdUlQGHZihunQzqU6FywZhRRDCD4biEmpLD5B/rOu
 1V4uzyP2u4Aki5+U6rZL/RzVEMNqvk82YODQUSK8pF0jMFx1zxqkq7b1qgiBgMOn
 zJaJnoJhF0utusTDfKMs7NoYxNWPE7UkQQoinG1T6hTc7q4t+al2Yt7fkJCIMBba
 D7heoQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2uhxmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a9384d33aso52722896d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635592; x=1756240392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=;
 b=eo+u3NRI0ns2eYs275DicmcxAXRU9u+qu6ExtipqXfrpiQt03Yy1odILojIoRe0DEl
 RsCws0Cxgkj2ihxOSRF9Eqj071UIxJ7TGZuHO16cT9XNu0esscP0+f7rR2yO4gHffD8A
 gxOL2Akf9xGiBtEC29UysZjiqOAZp2y/yDAYY8EcbP7mUVSiDbRqS6w8vOFEWoxFZnPz
 yUshu/UDOI3GSV8hzuRTe978wUK5XjFz/L3MN6xWB1G5wsA9VLkrI9vtk/FzFy75QvNz
 MXUf77FOx44u7jal7SxsTciRtpyq4VSwi8Oe7J7rkF2sueK9KLtG5GSJC8ShyOfMD7nz
 56Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbnxOJ+Q56QqxLK78B1xHAW8yNtgNpeJ4JZoqe0UbK6+OY9tgEqjsLV/7FZuoGcgIkPIzKLcTXfk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJpUbxJIoQAq3AxEOpFqGKvfocIVcIs31yiZN2mqPgBDoIDajL
 ck3UdAr2el/1SPOexML1rr9QBCkWIzTh9cdNpI6gG6cEud0Foi8F4RU54rfYvGb3gud1tqzN7DX
 l8yveariWskhA0nq1NYZPO/GthL7TlE3/VE3jXSLFuNMJ17VWVEyPXIp+6zhgYnFbSgKj0Le80x
 3yPIY=
X-Gm-Gg: ASbGnctb8FZIX7FLsfr7I36Rl9ieiRGgDK2h/V5TkJDLHVcNsJEIkV2fiyI9T6S2XNL
 X+YHXuLVJtr5adZafP5YI5Sow2rd5TLjgPFDXbwrlk5+rohzWx/7lVM7juILkJ+PnVQvQd0Yhyh
 hH75DaOmg630Y1LDajGPePIOsH9f0WgUdYViuYwE9xo2nJgPKqh0999ORLU5hDpQM3jrjFli8oX
 Ip5nvTUG1UcQvFEzoa96SNnViKHl5M1LdcU7XiVUi0TOF/jmlLb46TnMnxcJprok2lDM7tLYi+P
 9Tw/Eh+KJpHRYWYyVqtNF++ILL58HAVrEDO6AZTWo/wH4Ue29lRr5VlL3+ATBrFyxGavGD3LUe/
 DwskbXN2C8kE/+sq7lLMPJtZS9XsQhYUC4JFmQNzA4RYdDbuKVpHt
X-Received: by 2002:a05:6214:f2c:b0:709:bc45:b9f7 with SMTP id
 6a1803df08f44-70d76f57943mr5196586d6.14.1755635592225; 
 Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDKziY91eNkFu9vLBSCg4AutRFh33SncxQFOgdnIxYVcxqqICtOLRE8iLeaVF2g0WJIIGjAA==
X-Received: by 2002:a05:6214:f2c:b0:709:bc45:b9f7 with SMTP id
 6a1803df08f44-70d76f57943mr5195916d6.14.1755635591529; 
 Tue, 19 Aug 2025 13:33:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:59 +0300
Subject: [PATCH v3 5/8] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-5-b48a6af7903b@oss.qualcomm.com>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
In-Reply-To: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98epbohhlNRN+h1NEK1xOyQcbh7iWhPdJwQ
 SZcAvaENneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1bc7B/92b1GUfl19mLZdEdSZGXv/W6zvpY2/xRH/vjYXBUUv3SeYkNDpWGIJYROMyeOMzlycp0t
 99NiJcVMQjHVA9trbZTbH2fW5xaxO9f2xrJEiQI1dGEDFh5gnRoB4crRkxVTZ4um6S/atfDU271
 6TMvCy1ix69lUxiKHMicdLVMUhrFcQZOqKEjZ6ZsuEFxw7QP2lR4k1YTbAiQvvheHYuoUqQKxhO
 2dPVz0uaYuzwXYgBK1DtPqxj7JW2d2/YLaeMirNINj3QRZpAf4MDcQojRSJ7ALdp4yatPvOIFx3
 b5mdkvmeWroQkwwNhePwPDJItO+iuBw34yibnRlo48wTJ9Xr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a4df89 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: kcGXizfCwEOWiZNH9AcLG1aur7dBeaBz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX/jijpqARv/wf
 46T9ccDr4mR5zqmeUzUb4kDZ4O6B4niZboE+qjcnr9xkudPMtM1HZrHpp+ofrEHQUTKCBgAlooE
 KWB6cAeBB9s+RZK3utJfx1Jtsve3vKl7Hlj00usUl7jTNO4EL9HPGJarFepaaU73Fh+YCLdImTe
 LwBtv1MOi09mCpEVKZspGsSk40FXtP2YKZeq4MlXkgWC9CXXT3iY8kX8KwqXfwZtUfKJaThaCUg
 cx0tjo35QCN9NaPT746cAbosuA6mpU89fr+YIWqqlmTbCg9COjXDP23Z4Go+5GDUegWpOh0duEu
 9IvB1PqHjThd8QMZuv7ttV4oteZZXS3xFHyJqicPR39odITEAy9dnJKFyns9zRcx4/k8XzXUcw+
 otvUPbLN
X-Proofpoint-GUID: kcGXizfCwEOWiZNH9AcLG1aur7dBeaBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031
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


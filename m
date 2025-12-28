Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F692CE540D
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 18:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44E11B07A;
	Sun, 28 Dec 2025 17:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCe7uPA3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQZp/HU2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5957111B06B
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSAuMwI2801368
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=; b=fCe7uPA3Xkqmh1sr
 GK1R8fNjyEDbYn9uNvNzUBt10Mwwm4f85c+JJXolwuUPIOQQ9wOm3beWQ+mWllFz
 ReuyK8p2ew7oCfzP2vXlsqxStD0d2b8tzAuyhNfhdPOPfcirIgHYP1kgFelh20G/
 0+BLd2+5syRlaBKo0mRDyjaF3XlXNF4AE0kSnAolY9bOp+sm3VTFKO3/F9MtdoZa
 lMinfMZmaAcbPKid89XdkcDNOVuFE15xoFJTK78dj35mbMfaVfBPLphbNA0Xvglg
 1lvLpsATW1yMPf7YL2Tcs/ez1RKXEM3Zlk3ZDFaQrEup02/QVVaaomfQswGkkVM9
 vjEGyg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5jf0e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a3822c06bso245860776d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942517; x=1767547317;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=;
 b=RQZp/HU29Y0Ip2qI/dqL+U6+ooHZF44qCKGKN9iczdMq6rL1U4po+LfPV0H5gcWlEw
 AnOn5TT9GnGnhGS/+2maH2m3CZI0eH0ckWj32imf9vkiwR31mEpmwAd33aLP9KV6uT8w
 RwAn6lbPB5LdWUXER2UAfsL0gEXtYc9PHBGOlvzN0zYWeX47c3WVpVaJyUbJ+2W46QLe
 dRCLjEi2wXsTqgy6+RwwrIj4u7uyWbles1XFBttHzB4h9c7qv7yiQLaHOUuMdYp5U1Jf
 59JQhZUVOwVcC4JxOLraQCRXT/ia0/sod/aXvzHgC0okjy9RoGQ86oNBcxGDAtVppFDP
 eUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942517; x=1767547317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=;
 b=hgLIr/zSoLmdzm2vZsnaLGTpVdCuY+BaDtEof4zUBkn8su+DOt5I86HxYK2+KD5WjA
 JSBPd0DrQNJ1hKTlRZRNQVLl/yoN1MEM/eRIT7E+oh53YcVQOcJkyupw1JzjeQplZ9qZ
 5HoTWJ9PWbW/bduoan1v1fC5fOsgogzb3q752tOV5r7caFCMcVkneevFIMeV1uP9HQV0
 RrDP4aWgNHqvaBPyPdmUWkxZUcowRZzQf6gA4ZVM1R+Le8bPQMQgg7WbEsGKt66aFdCb
 Cq5sp1FFwsweiqGFl0NHDjpTo7iCP/j+WZdBDdRTCSoQmejUT9HnI+MiF13M+qISB/k4
 WEfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSb64eNSGG/gvjTA+0/hEdoN/5Cdo0FqRszxC3hszjF/uMLHYqM/L5PpqTdglMB0AaMujv7lEecfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2TGZWztT0yFRcoDRfiMNjubS8nVkxoGd2z6/8QBzs1pKnMd+Q
 zhz+N68n4PiolWSvE2a2uG2x8UNw1MOll4DbZfyL85rgNyyYC8AxSqccrMMdJLmeBdap3T8YhXw
 KZiZGmEP1n1kdhymi2Q+NJ/7yGkY8I9CRrkcfHmXjlSM9c/GRD6zNQosUpUR3Ij/MSC4bWVs=
X-Gm-Gg: AY/fxX7skEaWSIvjrpbIlRTl4To+T/ih+MQgQr9RPhW0JzIzLqUJdia1F9Cy1MJgwkk
 8XNx6kOptjuK7l5i/mZ5VJVUTAc7g/mnL+JBB1PSR50Ri4f+yeYxMA7Qc2inrb4pb3KwIB88r6Y
 PB/AJMj0h9FGV2pBM8EL+UV4o5Y/+txFAQoTDnYq+EnpQIbuyzTyWMm8/P/FUWJyqXFQaNsF8mJ
 0JzZU0n6iO+JJKZa5mIPeRd778pJF8RdFIHx13wE0Yx+PFeyHAKaOPH5i0/TPYbhuZ2228tDEFg
 NddhRMlLMeO5rm3EDp2fJJzQcYSEcxRWcxmjxPUFYzIzOBnFkECa3V5KQlzRfXQQzWqYaRYp7jj
 Vwzc69QPPEpU77Man+WsIUjquYcvG7E+diREFTlkMe8qaHIpWFaouT+v9T5h9eSoIP9jZIzkZSZ
 82cLpXyAN7ZwpVptLWrzPlrOw=
X-Received: by 2002:a05:6214:62e:b0:880:4eac:8689 with SMTP id
 6a1803df08f44-8901a046480mr56329966d6.57.1766942516750; 
 Sun, 28 Dec 2025 09:21:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB8qEu1RTRfneqwLmQfLZtXdWTJwcJICHquzn4/JCVt3C/Ojms0Lzrm+TZNYbI+Vc4LxRkpw==
X-Received: by 2002:a05:6214:62e:b0:880:4eac:8689 with SMTP id
 6a1803df08f44-8901a046480mr56329426d6.57.1766942516229; 
 Sun, 28 Dec 2025 09:21:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:40 +0200
Subject: [PATCH v4 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-8-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=90ODFHe66Nfjl7yi87n5IICLXsZ4owytXCS3KVu4EDE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWcj9BzTRYnVcWpH+HOdUmVZsP41SRvbgNf65
 r1tUWUIDeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIwAKCRCLPIo+Aiko
 1aRnB/44LaHrh0nL9t+l8Vm6jhnLOGva6JBnRavBIlXxZ9z4WE23lIX3WiEyrT7KyQ8m4e+qphJ
 2shMVOTKNp4d6IxIslu0RPfEZCcVynOUm+haZoWH0fbul6FKjHsfixttxMmhSBgniCaDpLn2Brm
 uf8MWBCmTndEK8JE5W+piAGszU88bTKxCU4YYh/eOFEb+LYAvwddqnzNk+FhaK6TL7s8H2t8cFq
 Sabt4YABaMeoD9UxOrjRnVuHwPET5x8fysxDQxsl/kF3qxqjF0D/Oac/p0bhLm4UPMCacwKdezp
 mnSB6VzLqdlVyoSSju677WRGgUmJZV98vHj3hVcEValfOlVq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: xiJBCopW1irau12RCU7rF2txkChwZEyu
X-Proofpoint-ORIG-GUID: xiJBCopW1irau12RCU7rF2txkChwZEyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX8TJQAEpwWhvV
 tUsFa5O87DYcgYIX9u87gPDGsZcLLlLTqIEOUg7yg2+cRKMoGAYViNh0XGtIgApIGg4BnbRA8JE
 pOsA7OifqsemJ7GA4Q4yxGn95IjNE+IaKGkXWLtua45bq0vEkAyW0YCvv3tDQ7iNioytLROyZM+
 vOnPQ9F0ncsNjax9JP9NSxrfXlNf20yYy0ixDQ/C4JItFdv+CEkZhKhj2AwMhZYlhAkTcnheBQp
 AUBdEH/RofcdI/g2o1tItf96Dg1gVQ7BmgA0fcd9OapyI2GHsbwPGPxDHqcCC9hfWTyZEJ1W+aP
 ikQR9Ra4RUuzlvaD0OTsGF/SpeHK91PyEyNn/R1PTZuuh5FFeBHTb/UCOjpdhvZjdUlOt9WFgG6
 9NriOwVci/0xmv8GLsF7xAFEjcltIr0h1CaALd8G4sqsDNxLzKXcYXlsIsB9IoGj9zMAe5667wt
 dYYMsYWluhYYIJVLgmw==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69516735 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
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

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init().

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 14 +++++++-------
 include/drm/drm_writeback.h     | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 1a01df91b2c5..ec2575c4c21b 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -235,7 +235,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
+ * drm_writeback_connector_init - Initialize a writeback connector with
  * a custom encoder
  *
  * @dev: DRM device
@@ -263,11 +263,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-					      struct drm_writeback_connector *wb_connector,
-					      struct drm_encoder *enc,
-					      const struct drm_connector_funcs *con_funcs,
-					      const u32 *formats, int n_formats)
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats)
 {
 	struct drm_connector *connector = &wb_connector->base;
 	int ret;
@@ -284,7 +284,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 879ca103320c..958466a05e60 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-				struct drm_writeback_connector *wb_connector,
-				struct drm_encoder *enc,
-				const struct drm_connector_funcs *con_funcs, const u32 *formats,
-				int n_formats);
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_writeback_connector *wb_connector,

-- 
2.47.3


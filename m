Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43EEB2CDF3
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 22:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588CC10E67E;
	Tue, 19 Aug 2025 20:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8Uhmr/4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DEA10E67E
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGVQVr023093
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Uae42TaI8vGi2qGQ8bwNSeWnG/c2PiftWqaI8l7bbt8=; b=S8Uhmr/4O+nSPYIm
 2zKbhC/oDjV9DkZ26zlb6qdRRPz5Rnu4ww2ej5v0TmDFmkdYXv8TFVeTP/bGwxsb
 4ZxQ/2im9UB6JRhBSPPadrP6c6xKYOU/sHEkIlTyb59nZdRsVRfqUKazW2GxnS+H
 aaRQM4t55EbBdmsQ47OzwhMocAXF0XDTJo+mbWRGecA/e6GR7IKVMmJ2s4Jbj4fl
 ZK5O0LX5cytxx88P+iIVnB8iDHNFRFHTIUma/cchElwTH8ASfdFxrYbMrbaas43I
 WepbyRcoss2ENw0vXLUxZn+tJtkDSdBp0OkS0+lQaOo+uw1esXpqN1Z1fDiJrdB/
 Lbw0Yg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5kmh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f6346f8so123343356d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635591; x=1756240391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uae42TaI8vGi2qGQ8bwNSeWnG/c2PiftWqaI8l7bbt8=;
 b=i5cNEosfyG8vRPkc7q/+oExyRTseGxcRtOAbxQ+KD6IWktgyN6V2qmvw/6G4c+J9a+
 DQRu1BnfePgITdC4y4TS2UejUldDTILSfPSMwElArE3hfxVDnLiq7wExvciKjEo0imBA
 EH/wZCCnVeCDlHyxuMyTgXWCDRGexxCehghwCnvg3vUAT9pIYySviEEOXXCcyEA4g0o7
 iJKUWP114nLS/pmwGFsXZMaCmNzwIzl2Ryh2pCzHxu7rthaZdzuJibayLiDPHtKq1MLq
 II3S4ccvKmrQFxakWyVeYU8RQ04y6HtJ/ovD7Ar47Gz1YQ++JW2ymzuGj3kB59NitSqG
 llrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiNnFyaN2ozFt4/C27FHkV2hPfj6zo6y9LX/h8hlz5SxXNvzER1ucKcdgBwEihUCMBzFkji0GT39Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/DbFQWGkfcffliuq8rYN2lmg4t/ivaGUo8EPo9llmYCaqdSzO
 QOfYWLRP4eSRp7pQzsb7uLUKEMx0D4Eus00IOUdCGJixoE53whO7RCy99BP1AIGvCeRg5T7+2mP
 r0AYLtfJGpVkAeVolSPLsdkrrss1RTJhrQ3b5oyQv3PohHhBYL3HMjrtPIy+ZY/4+3nsQkeUZLA
 EoChQ=
X-Gm-Gg: ASbGncsGxDOXp+1whzW73AuRP95mtBc1mj7AGNjVR3bBwgFOZ4OJ7zRQx7yp7Ru/VW9
 wt2umjOxI5Y6krU76ETseXI8r61iEV7VnTejEnWgpg7hlYit3Y2gHgRa7vD7mQ/ryf3mNMlsh2H
 K4gAKX8D8ET4rUXl+q2N8fJFnBXGAGRjJFN5mkbBtLYlPZGDJACr18yOwmDS5XjHSYMhVnJZe/9
 pESD6iHHRy2AcldC75BR0GJ0o8dvjKttxhVR0p+t9kIx9d4cdrLNFtn3bsiLFem6WGocc41VYZQ
 MRmJrlu+4ikISnYz+h/4sNAcQB2oXAPIGM42qAg9GMsS9D/eDK6HG7sALRPf3T8LJbm7DrW5bSl
 6rbqA2Xl3HCVdhed0BTEj0GXKKaZPtEWX0LKLo2DlYvWDHHMIbPE2
X-Received: by 2002:a05:6214:40e:b0:707:4aa0:2f1 with SMTP id
 6a1803df08f44-70d76fb03e1mr4792206d6.16.1755635590916; 
 Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjMUMGSvjeQdbIF0CDnT7P91YufaBD6waHQI6sRs/n+ZhEnj+eKGwawlgjU4rExarcr2ll3Q==
X-Received: by 2002:a05:6214:40e:b0:707:4aa0:2f1 with SMTP id
 6a1803df08f44-70d76fb03e1mr4791326d6.16.1755635590143; 
 Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:58 +0300
Subject: [PATCH v3 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n7xaHZSSROB+2XdVsucGDeHL2qDsHnv9brWl2LaC/6Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98gnguR5E87tGamvaP6AjPWdsyN4w0BBcCn
 Y3DFYviK+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1cIrCACZlMfXC1ZcXwkARC5jlvs99j4JLrzEnSVtPScea3jfX6Xnp5Sy3egmpoSPlOFc5GNZuv7
 tqe8otrW1rgAZmoYKaWQPBtK/LzQYdu3u91oc3Ox3LhGbAIyK5c7Thl64ufZc5/XlENC8WsV34V
 q1Xb0pEDgNJdOAnN0d5l63dDxaacI912igs103k+ehliPAInW7DUdnmfFXdbnIQ7H45O5AoSTOM
 d7yhDfGWM68rDdlB9nvgMh/Tgra+l/algQswzhz+QQtwewmL8JTifw1PjO2q3eIAGUeon50Ldr8
 2F5d8cwAbCkKPqKEQsVJgrO+38orTXv/L+6y81c0EHhHs1E4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a4df88 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=UqIHtJT1QCIVCAY24KsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: c_sO1Ud6OV5C1LhvvYUcUrgbR4xraDO3
X-Proofpoint-GUID: c_sO1Ud6OV5C1LhvvYUcUrgbR4xraDO3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfXwEZ0yZlvdvXp
 4QDHCr8CHDhpTEaqpmKCdHXgm+MkBYHspTT00WlheyiA7BjUqrzbrEYHj5/M2y9/SA93QdarG/Q
 jMXpiaq7KX5bbwD0U6MQXyTbbUMuYqZaVLkndoWIf+fJJ0KldQ4uCTR0LXbxFKIVeNZrdtR1hdj
 nZh+ha4TjHyz6zNRWHtTvfRf83grEhW1qq8t5Njf0LVy7DvGVceblimIUcKqoCW8owMxGDZqOyj
 BJo8Gyw5gCioeWrZo/KDmGb1RDLXXBjZBWWM7IUGWSeauC9BmxT7Kl0OOrG2JfETs6hMvphdXy/
 4CMiIumE4NMJ4mDb09cRoP/yXEsFeTRsh7LoGRLP2GgY+6BTu0KbVtxzHmu35hWXxDiYjVAH+0Q
 qlTxPH0+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202
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
Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 
 	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
 
-	/* DPU initializes the encoder and sets it up completely for writeback
-	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
-	 * to initialize the writeback connector
-	 */
-	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
-			&dpu_wb_conn_funcs, format_list, num_formats);
+	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
+					   &dpu_wb_conn_funcs, enc,
+					   format_list, num_formats);
 
 	if (!rc)
 		dpu_wb_conn->wb_enc = enc;

-- 
2.47.2


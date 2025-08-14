Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2570B25FFD
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 11:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB30D10E223;
	Thu, 14 Aug 2025 09:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxJTJZ2q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55710E223
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:59 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNVRku029021
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IwbNIn2nq6yZlb6xLIzEou48MqgT0iaVMEMsW/WzzXw=; b=pxJTJZ2qCq+VpQnQ
 iquiYT8KXL0uf9XG3NeWQQdsOHwTXimb+tuVX/VfqobrD2ZSpbCdxCXULJPUu7Br
 /U9ihwNNEs5rcwtmFxseEBOFDhuY1tahvRE3VHY6fLy62PyzED5pbQY5/hVeKj/k
 Yt6qhw2zs0k3o6BP+LEEc8TqZUOzyKVQRyqmUa3i0ELOsy4fkisOfTlBCbdGl8Mh
 DGkbXh0g/bXxj6rJ2kulr1dEfhtavgrO9Lgmr8E6lKyD7YPH7CvFLB9D1cEUxLlG
 2hAgs6iGxDx73cGAPx/68yiYADVqG8VdbmdmTNBIMyzT7tCIIb74S5THN0ulVUPQ
 LooJQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9x4a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109be41a1so29810281cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 02:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755162238; x=1755767038;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwbNIn2nq6yZlb6xLIzEou48MqgT0iaVMEMsW/WzzXw=;
 b=Sht2Va5xdrLE34Q0AF8mI7fRpBdbxvyKO6AsQfH7CaJ9ReU3nYVZLJ+TCJSrVTSG1j
 QtlM8xsfX1cFLGDXlo7ULqdMjPKlb3PgAD1xpAZtU+zgI3h6JnRqtMcpahULNyXsJ5yE
 JQ2bSr/U/dEKKODYqbdhgbjZdZPg/1IsB/dulHWElHy+PfVL64SJwQjFJ7oxLrJrysMo
 TsG9MMFnxZnlhQOtBfWcLq1i30mKZhiMeNxbjU+dPvoIzhwH6t76GKF0TtBWzZuE2aW8
 f48P4z+hLSzItiIg6CJH3zKuVe8WQmfXUSmvXGGkTtH1h06PPhWsLO1IPb1nsCpS3sHq
 /SDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJu8P0iKpnIigtpyBWJClY6Y9ODoWI/rze1+/wXuUNm3qR/GIwptqQ1HorXcgGMIH9RN63RuKwYHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOS6aNdG1FR3wDfgPYWgw6Sb7Lw2ORLeL0iL07qm2Fs/5oMUtx
 lZXOcsZpht443xRDUKtg392h0dDgZ8Ms4JZxHsFAUnV9I8C6CBmYThEn02/Sh2b+q+qQymDNOjx
 a29y+iwhmCOT9N4pqwn+I5Vpk2ziQnEyOZYX0MD7G0X3EKyWvC7UHS6TLTQ0X0K/W/lPOcQA=
X-Gm-Gg: ASbGnctOxkrlVtHGWnNcDHWF7BOdxk9+afSMt8fSqUihuzv7DVbXJ+x9d7XmkdpKzhT
 oY8u6jLDWS+uaRUcSFDSPCAt5g/7ybk7aJyEr5dHUmTT/owWgRUYfK6NJrnbxnZpOWqAoy50S+3
 TQQ1WR2jbFd9Tvn8tYkcevkHqG8t8G993cl7vVUh3E7nanV/sewpaeYe2k3+J1EXhnMdGXMDNMh
 Iddbcuuytfmu9Rsr72LWjggKNRdgMtJ2ifc7mIxgMKVgdirl6RaDaRIlJGM92D/2fgWV3xymqaz
 qv4e7Ug+fn7Yw9n5GkoSuXHoB+/qCFkPBvd+nIkvnG1kasaXl2tUPgukwMe2hT/AaQbZnglQ+zD
 X3ylcfFzevV6ssd2ywKF/nbM3qHPaBP/OXT6ADcYozPJJsMKfMFPa
X-Received: by 2002:a05:622a:8e:b0:4af:f25d:e2b0 with SMTP id
 d75a77b69052e-4b10a9cc07cmr27540601cf.8.1755162237854; 
 Thu, 14 Aug 2025 02:03:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ndUZeYqkNWDQoj2EKZFvT82uY0VC8Cv2swBSR7P9JT3fLWisPRgnABIUullFaurpyb7ihg==
X-Received: by 2002:a05:622a:8e:b0:4af:f25d:e2b0 with SMTP id
 d75a77b69052e-4b10a9cc07cmr27540041cf.8.1755162237374; 
 Thu, 14 Aug 2025 02:03:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-333f8cec11asm1720061fa.23.2025.08.14.02.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:03:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 12:03:52 +0300
Subject: [PATCH 1/2] drm/msm/dpu: simplify bg_alpha selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-dpu-rework-alpha-v1-1-b4baa4ffa8fe@oss.qualcomm.com>
References: <20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com>
In-Reply-To: <20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iMJRmARhSb1qXSk4SUYiXVNL3suv0fUyow+jfxnnJDQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonaZ5C08EvEWaNICCToRqfci+V/llxHEZsK7d6
 VHKUWQyiSWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2meQAKCRCLPIo+Aiko
 1aECCACyvWUX7kkfk8qmbd/L2OFNGcQOvCZ5c/p3qwoUvB2bm1hsP8Ggmq3+xYl6tpyuNmTjgSx
 xLpBlujHfcCypZG5gRrjLcoCwaiy5ixvxUvUweo/kZ3eHHgIXQUPglVwY4oHBqgCWl4AEf1XT9L
 v/00spXJh6cfVYBhs+txtWUk5P1DIUNcccPAqcn8wskRcEYrzBpfQA6XZe5LAqN7Bhi/HeYhqfA
 /kmU5irHbeOX+C4Sq+nBdwZIxdqCD6ZRKpF42JPYXfN9tOb2wxJySN9FWeg0wHHqd/dRChrtXap
 waRolPzQ5Lxh21Hfzx7eg8hC+iSHSIxAR+xBGBwAMSWrSTjT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689da67f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ID75BBqnTVE1V_rUnp8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9D1tc63rf72yUIgb43sgmXnhYE9Vqiin
X-Proofpoint-ORIG-GUID: 9D1tc63rf72yUIgb43sgmXnhYE9Vqiin
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX28NBvGXHjzx1
 qLwjaGkZqHq9L9XYl59k+6n6C7Z5JLQiawqwNS9kwvpGQN0wHCggD15lVpMsm/Z3ln6kp07cSZc
 EPupKxDZhbX5jaeVBynu9mxITObmOkFqsVDQMMsmyMj4APx/BV2CvDz9NgRxAYYDkU2HVXd0ZEe
 DcDk3xODb5v7ltONzRqWQVcuDg6Ay5Nasj4oJ18gGNoZBuLOw66+dCyGdpwXe8xJ50uBXob+2xa
 8ntH7tdkKO4QFex087ivrg51EBhS7vKgznvwPFa53jPD27uiq4fzA5QyOhwUFN2pcdhmRZ3s5B3
 l2/NGqGJ0UBXNcDqCv0CQA3stkxn95+l1d4EyMAF7qfHJaSFsFMUJEVAiYn1DKK6bd60FDQzWM2
 jcnFms3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
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

In order to be more obvious in fg_alpha / bg_alpha handling during the
blending programming drop the default setting for background alpha value
and set it explicitly in all cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4b545448d74657aafc96e9042c7756654b4f0e7..651159e8731194d75b52c05158bfd1c9bad8b10c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -335,13 +335,13 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		max_alpha = 0x3ff;
 		fg_alpha = pstate->base.alpha >> 6;
 	}
-	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
 	    !format->alpha_enable) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
+		bg_alpha = max_alpha - fg_alpha;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
@@ -350,6 +350,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	} else {
@@ -363,6 +364,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 				    DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	}

-- 
2.47.2


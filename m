Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64BCDCB72
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 16:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC64C10FE68;
	Wed, 24 Dec 2025 15:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qfl/h3JJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWrxS/2K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B33810FE66
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO6AI3F1018504
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fPAB3lyJE+/otMlNhYYLlA2GvBK65FIoSyAVZliZqgU=; b=Qfl/h3JJ70TLkeCp
 qQFe9PUtZtTGcE7hRkyAvxnHNBT/mtAdMb9pEuWhn3Gj1Hc1ILQEc3cA+HC10fqZ
 3A/4QUVfiUxdx4HDGhWcJCZ92MBiL9Hi4c9S4oTt2mOt0HW6ELDwt9+MkV4I+COb
 R/8MoIIHhx8KsO0438RVTLgNOsKrHMMPRL7QQ6UNeSMyMTtM7zLu1aahpO76xBBB
 +xmMKKvwLISCktPlH+17A0Q6456JitR3L6VU1l7ehcFsva3ZUiBgXTKq3kPkB5QI
 Hy5ajt22mA9csYkv6yaFgJ206pECOdzwFh85RMqIgKhpLfMpDl/clqkz35kyQxtH
 +uVJkg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsb82s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee0c1c57bcso205420091cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 07:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590434; x=1767195234;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fPAB3lyJE+/otMlNhYYLlA2GvBK65FIoSyAVZliZqgU=;
 b=BWrxS/2KCHYzSvUWLKp15Hj5EuQyMjpHloGZnoWBw+gY4l55dOgliYEICNWiGxX7pe
 XLbE0f8RMfYUkq2D/Mz6HYseAtB2JtcIP4kC5yf5G4jyGX+ve5Qt8CnLQhdL0t9xNU8P
 SM8jQkALQptRmnUmisRIGzTSUCJ+TGPJZZ3zbynYKlnslWc3jXqTBNpQA1Rxn4rqOU0R
 ODRgBdaIu4Mjhc/lkTbz8avp0RR9KlMRwfHXE8kDaOuzpUpLzvwkAew3Adrc/lc5duh3
 K9Kozobi3skdnF/KwriYfoqObqjHhlvi/iPG0sjYGtXVVT6ZFsR1mcxoasW68wGwo7de
 I28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590434; x=1767195234;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fPAB3lyJE+/otMlNhYYLlA2GvBK65FIoSyAVZliZqgU=;
 b=tCx2I5TwGrW+oSky2SXX7DeOGlr1npa5teLeH0OztIFArrbF6akEehROS+mKhO9s1j
 b9CyyFoA+J9o5Ddt0lb6LRTj2YePU4qVVS1u/0J6677RIWinOxNkt6p2B5oAjUGquS3k
 xPMTHp5zoCNiBMekv/iIXsZyNDPUuEfo0IwKryyrHNAQ+i2kGY2mMjnyNDRqJm4bmqoO
 QGmup79QiHfQmCroVJsGA+KMWH0tS9Mt81mhAdtej+bNzP0jCQEtZnBHZ0LT7KQ5kzbX
 ZIUli0yf1kqF6DIm/+rh5Mh4jBtgNIZVAUyPIuVwRgeAJojHn/vC3FMst9veFcPhU0gN
 NfXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9UZhmC083C+81f3K8WmOnhW/ZzrVkLnTE5FbDp1fgbO+hgIfrK3t88L4UX/2M5/kmpcYaeehpTPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrB/IIR4aX3NFDaCeG35zm2ZfiaglUq60m3pPQvB93LoJQ2zGz
 t2beEg+uC88JhG9NWV9KwseJzXYjwLqKiEWJ0WLarGmFPmbTfRv7iNVgIp8hXSYtyycOdCa6CJ2
 b3jZGkTpktHydeJTz4HK+nFO6P7hc8MhzGRXAGmdZR467jpKZvzTgKei79FegiehZDmcZyW4=
X-Gm-Gg: AY/fxX6ePeP0gDGu/Kx7H/ezh2MFNFtGWocY2suL/5vusWbQCHPu6Qeyszfp8Nxcxuo
 XsNqtadYlJRaIncdwicE4GO/ePj2eE/loPwsoSBTyC7iw776i5D3YMzjmz/inJQYjfQv22bPZrc
 unFiHOJH8DWjWWTJQUhnw/DYYTRWV89OzVGOMH7WTrShtm8V8Cz8rVKfqOrJTaLxW8fEGpHd/+u
 Bd3jf+QYwQBCZ1NQp/NAJ0JKYr3JyxTxxOkc7ceU9ttdB6kW9usA59z0ZKLCdC9Joyri13M8w3g
 MGQedmt5r+q/HckwtQhLR+DSM7HURynk3m8i6hHeEOOFyjxSbSztYxdfVOMJpo+oAARHN6KZZj4
 iPVZ+f7Cql8P6HanCC300SPXHwY/NmMeqU55VA9c9mwxyFgqcMWagJL8u7ceYc7ATyVtnlvQNjm
 Ns0SMQ0x+iltC7wMMbbq6jF3E=
X-Received: by 2002:a05:622a:4d3:b0:4ed:42a2:1281 with SMTP id
 d75a77b69052e-4f4abcb8d02mr251613911cf.8.1766590433663; 
 Wed, 24 Dec 2025 07:33:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy8qUi0xeWx0iGCNSIgAQhPtuppf9D8vhc4sFFnom9zYvqxkc1Z4gZQfkGBsYXhLd9phBdQQ==
X-Received: by 2002:a05:622a:4d3:b0:4ed:42a2:1281 with SMTP id
 d75a77b69052e-4f4abcb8d02mr251613291cf.8.1766590432979; 
 Wed, 24 Dec 2025 07:33:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18618cf9sm5115105e87.57.2025.12.24.07.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:33:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:33:49 +0200
Subject: [PATCH v4 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-intf-fix-wd-v4-1-07a0926fafd2@oss.qualcomm.com>
References: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
In-Reply-To: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cYm0vhLoKqA2PBsfl+wS9rx0q7aHEWOFtDsgpCz+I9Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAferAB2TUEQ1WhDBlHehg6VFbE6pjSp/CfWP
 7fjPuiPKdaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwH3gAKCRCLPIo+Aiko
 1TKIB/9gCUDK2YB7407yFykOcDkHJk8KsO426K6fmECYOOTiCiVMsnp7zAT3st9H4z8ckEoiFtX
 PEz868HYa/toZJo0B3hKpw3FeSRV+qtvbzfQ3POlOG3cwtaBtOu2y5uVfHbnqzRL9xWNJQJYstK
 i1Dqhjv9u5H4nGBkad2tyeJ0X4HLvg8AnSYEAkDx7eBhvEDb7FmNvVZbZvEjvYIE8pfZxT5hKbe
 aOXla86xAepBu4NTqQHzorXof82UpmN/pVnDS4Fl3Yzv9zxEKobXAMkmKwd/MPwo8WvzXQLNHXB
 67FFtXGPzrY0jlK4v3klbH4IJsdKL+nsUvSubIgqGu/YoLSx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfXxpMLW2VcRS7S
 6k1wjP3iuejeydDire+zkjoTH/YDZtcOG89pkTqAYIkGev9WtsX8wKImmB+2Fm/clnbkApl+caO
 2SbHsc9HVsLYruq5TW+AeDIVa87rh51aNy72B1Ihr/O1Wh9p8QekZ2dKT4m/39IqTNoIS5URn/0
 AXsJ+WAjTaJRIhxHn2fyciGUT/AJWO1Fmo7rkM/HbT84pFvk2H1DaB8LdgAgJP82oNPKZnXxMv3
 MTcrqvkURe3GyKhP39mRrkT6PAHo3qxTa5WKUIwEL/cwLGCPZCjkdoyYmfE67MjFj7NBTPh/wjv
 pVvUUWRVtyP12hpYAvYn46cMs19QD7d4ueevf7k1vtTWD0Ing010rl0kzlnUTEZtBAfrydplTjU
 JxJrUQZQTyD2EgrRVRWGPNwZt9mXlZS4jIL4Q5rvB7ZhyUcIdlbweeY2DcLCt643UqzWCDfBbhC
 8eoDUVtOl3ARYaB/Hsw==
X-Proofpoint-ORIG-GUID: cIE88SQ2Wv6Vj4urYfcphUREIRIXTwPg
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694c07e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3fIW1a8P77-jr8MUMFIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: cIE88SQ2Wv6Vj4urYfcphUREIRIXTwPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240137
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

From: Teguh Sobirin <teguh@sobir.in>

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks.  Currently all code to setup vsync_source is only exectued
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
[DB: restored top->ops.setup_vsync_source call]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..0482b2bb5a9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -774,6 +774,9 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
+	/* Set vsync source irrespective of mdp top support */
+	vsync_cfg.vsync_source = disp_info->vsync_source;
+
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
@@ -781,17 +784,15 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
 		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
-		vsync_cfg.vsync_source = disp_info->vsync_source;
-
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
+	}
 
-		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-			phys_enc = dpu_enc->phys_encs[i];
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		phys_enc = dpu_enc->phys_encs[i];
 
-			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
-				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-						vsync_cfg.vsync_source);
-		}
+		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
+			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
+							 vsync_cfg.vsync_source);
 	}
 }
 

-- 
2.47.3


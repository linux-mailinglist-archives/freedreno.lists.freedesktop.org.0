Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65639A99A03
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79EC10E2BB;
	Wed, 23 Apr 2025 21:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HToZoNro";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6BC10E2A4
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAThdH022375
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AE4lzFJnqWE5e+eBkiWINHStPJHmgBESpSkQsX62/xk=; b=HToZoNroAKEI2Jpt
 N7niKb53rvBwcuc6uuzlwHsZw3XKPmwAW1tLLIImoJ5z52am2ResNGXzB/O6Ovzn
 m7jVlAqFkf6Vh8Hp953WrSPLeljcbLf1GpFI6plc/TrZQ0JUpjgmFMw/Ba9vw/Cw
 kRWLiEnzH9lYLkY1ApIL9ioiUfE6ojNqybKc9z1QOs/6VSv3EsuYDtKrXtAilvFN
 UeZV20xht+6NzALRD9cWRqsbKUOyrD+CNAFpDqhSYzlvUyEXJe2azd93eYaFhJIu
 topAX2HBj8nj1Re7bdZDpMHs+OU+CCrWsM9rlfE0i7IdV4x73gEldVJ+4wc0tza/
 Y4hWLA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh13cfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eeffdba0e2so6340606d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442623; x=1746047423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AE4lzFJnqWE5e+eBkiWINHStPJHmgBESpSkQsX62/xk=;
 b=CrSuYK4L5lShY8fLlA82wvD3bIMsjhoMC8xW5d++/A1VvVdkLysbXI6KBJAGepT95L
 ncjSIvHUy+3W5Xehe0nYG1OH5C+df29Lz/h4lh7q6w8BKk5Wp/f6EGN23x9pwh+bNrgd
 0iZeM0UrIa63JX13Xqq/4DRr5euOhnLbm2xQIlP8YGNN06Vu3n3MdlUJflAS3yMf1JmI
 K9vRqfB/KkNjyfsRdBmK5UD85lJ9fHzWUpEnQbMFgUFA6Dm0crvk2Kq4oLmDGRF7eenG
 x6GmdA3jdh+ZEstFP4V/207hq/Sg9tCKLG9hHT32DZpXAIOfxQjWdLbl+jE0T2GWEmNn
 OaSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXryuxT7BmZBGN8iC/dOWBmB7qwnm3cez5xrIOK3MxTAKsPkH8XSk8z/HmCk5lp67wRKIySSiCcUkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yynh0We+cH6Vun6ndYl4suwbINynXwAukOTs2U39RjEVQap/02A
 GLhEfi6xS8KGkd5ogq0zjeyTzNXZ/WzZNUjWxcYZpG7vqUSw5/TpxYhqPIGipivn7ZNZBp03Yj2
 rjAALaoRE7ko4bFqzjhDE2rSgS+B3BF0hDwzDwiUf9zd4lSfLJNpGwLqilkoIxWpKZt4=
X-Gm-Gg: ASbGncumM+0lIiyiBd/yL0XtQwzDuD2coGPKb6iqn0LbAzJz1AhyFL/7XOp/9ko5VD2
 tRsh+USKNvelbgAztvb8vrfPhDbJYJd761RJlC7k451Vlk6F3rBU6vIJEjMmhXD/LOkq0P0qWEw
 nET0Uo3Qw4Sat4GQZvuuRrvmEWQZTJ+C8qGJY4gRWpnwl5I5YbW8BK6Vhw5ayRMzSw4peP/unRv
 wjT8DyJIxm08mWo76DU8C8JfSXZkmolilomS30Q93YI2AT0fhDZtXZRdPM7YRc/b/L9964RXctx
 S4Vgv4D2gFW5obC0zlhaR4m6zbXIlYKManCZna/i+uet1xBmdAMvCvRZOG59wdGZW0Kcr6Lpfgm
 4/11RaF8e1bvLlcEDPQNsRqEZ
X-Received: by 2002:a05:6214:4012:b0:6f0:e2d4:5936 with SMTP id
 6a1803df08f44-6f4bfc1a25dmr4264236d6.22.1745442622750; 
 Wed, 23 Apr 2025 14:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOQ15h1AP0JAje3cYQCQWZ3mel914n0yFh//+go6tWwThRbRFFMxzg8Pu/UU1Bbz0rKcWT0A==
X-Received: by 2002:a05:6214:4012:b0:6f0:e2d4:5936 with SMTP id
 6a1803df08f44-6f4bfc1a25dmr4263986d6.22.1745442622412; 
 Wed, 23 Apr 2025 14:10:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:02 +0300
Subject: [PATCH v2 06/33] drm/msm/dpu: inline _setup_mixer_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-6-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7p9Y0N9fe5J+FNtNErF+g9/bY2UcR9C9Ev4Hmj1Hodk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcqxEjOTPcOCtC1Ywlim/Lp5IZnIZC5/K2Bc
 K7hte49N6OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKgAKCRCLPIo+Aiko
 1dRgCACwnKb26HlQN7DsIQ7Im1BVHZQbjtHP45Mk/ElrkI4xXujeRO6BKcEr6jWjGHsGuy2PwdE
 G5fx+vQHPQzN7hCzR+qjhsOMk9HVrL1aaqNTFrk5YNDuT/PmV813I1+xzmchZ35z6YJ3IZOPNIj
 zz2XlK//mp7l7CylJzLNesxbpsolSikrCcpefTIR6XSJceQMCpcoAZNFVNv9QeHLjyDtcGKfJfn
 jdqmCJXbySt+CK2a448bZJp5GTg6TpX1T5w4HXPlLQiZP4tn1qWLe2NOhJZotR8sT0c+iVxqF2e
 MEyc2EEEM0WEPsH0ipUK7m4mWiH9ZP6iLKWdtdgm4wFBMK66
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: VswD5Txsxcy8S9pT8QlVVRIQVmDvhWzj
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6809573f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9
 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VswD5Txsxcy8S9pT8QlVVRIQVmDvhWzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfXzSyZwWjjUMU4
 WcN2dxxsw4UEXi/DXQQL1jEu5Dica05uoIWIq5qr+erBQ/4UeZim8pdqnme4ajdvLXxLockqeWp
 PyfpOmfc6dNKHh4wzknHT4hGQxFcZeTP6b2MBkUPmu1aD4dWb8KyenFAe7fGUtpdltZjMq+qQXH
 McLyjyHYmZBNMcp7/kA4wCe94c2BT7qjtrh3uFswyAL6k/KDBEXfZVbZw1AbiS6KZoxLsCnYpcz
 NNmoj8RKy4Fj2Pr5j6r73LPL0ho3b1kKrABr+M3WlN6nv96K6uc3nN6b2GC07Oo5myZG27OCl6F
 A2dfBYiJkXFVDzhmSI3Jm6J0NxEbE25oOfhSmuieBrnR1A4fFxTQJIBh9Ptth3zafUOxr8maGGP
 jS+BHOTIKZPVTi3uwkhgGoABKeZe/TUhSZX8UK3WQyECsD7dbks+/779vQ1Td59JB1sMkpR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143
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

From: Dmitry Baryshkov <lumag@kernel.org>

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5


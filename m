Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9886FD1076E
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 04:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7152F10E206;
	Mon, 12 Jan 2026 03:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwg672vS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHSBt1Mf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7190F10E1A1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BN01PE3496134
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G+cnGkDkA8WzUyjFVNfSWrAEgKHPi+4A7R90Xdwa2IE=; b=lwg672vSfuiYiMRu
 gr2kq5uFAF5RopeOXYItZdoSz4shghVmetHZll12uPQsZj5AhT9wBMDq6J80vSaK
 2Xtztv2OoqurgKHlQmi/tU71IkGg6DWwjG6Jloj8tAtHOO4WbTA39gK6m4PMwcgY
 30e0aFi8TSyuI6liEZ5m0pvOFX0pMU3HXogbb+fEeGTUYqLLaB2iJ1MWaqrgsADx
 3AoKZImh2hSsVU6FWXclsG7tLgMQRx0utCtoehnA61vMeQdnXxRQ/UqwOShlVuvM
 CPeK1nyg/BSZO0p0lKol3XS0I1XhQdpHBelpqD33FNBcoQ0Ictcdw5IWZSAmzu3V
 UUYZ5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e3d30-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b6a9c80038so636723485a.2
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 19:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768188220; x=1768793020;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G+cnGkDkA8WzUyjFVNfSWrAEgKHPi+4A7R90Xdwa2IE=;
 b=CHSBt1MfdB+fBPqgU+chC3hoCQ2zKnmYrQmWPlpHSajubItfGbCiRluapPY/WW4F10
 eLdeYNd30cAJXkKKkthgvQLLDAOj+riSFwtJFd7Sj9Yxc0aCN58Zd4K0KyGWBGTfP97g
 2FD2rLSdggvaNUKUzCPRGNA/aDwteHbO6ZTk6SXk6liuZHmPq8f8v1yNfYUKCK9KI93/
 l24mbDMwdJDRbVsSiJ1i+SCPu9MRnjXUyIpL9Cx/8kUr0pMmVg6NCJ+g0vDajN6Mti0o
 ZHV0gjNjpQHFMSUAlV1ggyaboxfSBey/wfQ8P2KcTk3nL+bI1xz+oTtxWgxAwpCXyBPA
 KMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768188220; x=1768793020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G+cnGkDkA8WzUyjFVNfSWrAEgKHPi+4A7R90Xdwa2IE=;
 b=Vdj70yKPVifxlpXBk0R1lc4dyM36jJuxU8twbOtRtm6RS18zSVtb1PXZHgdabawLrM
 VG8/1Prt/m1UzXWjbdgbQCm8swYIj3qyj1o6x37jNzT4QPHylSEMMbDAZVFE5eXEzBlR
 SiM1fA0Q169k3JyCD/hl2P67yrGZz7SK68UViCUNpQ2h3YXR6zparG8q73i0he5lDWnt
 qNvoJu5gYbHLGWVAkuqhuEvr6XFIZQLEhH9sqP04c0G72DN1m1tG09tjRR8CSlqFJ9es
 OqKp2mlLQmn94bvVKb5pJpIUIm0tQLEcndB6a/AqUWAXecWPmjnNMPj/Ji+NvqyMi7Yf
 wlYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2qBcSwMIc8NESEjFPP88osxux01bR6RS94mukiNUXKY2raNNJH/GPyv39AZuiuonBI6PzCe2mDfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx18O4zLsYAeo96Y8EK0pHSaV3fZe7RofiLB600LPJug+FoAqKJ
 62nu85sq8oW5Nwd7dhg4PwH0Scd1wYvwgGiTOPrPyiQjeoBFC+qbPbob2EbGrNPACHao1VSqY69
 xcEb7BAp9JGcJTrlMbeiMeNoqBRfx+1IQBuxD4xRLlySWSGon5tqWmAVyGjA42q6yXE/ZWuo=
X-Gm-Gg: AY/fxX4OJZgxOvBuM8ajbo1fpgAGTpnlGDkRBH5iOXG+/sZMJWa4uiTbf1anBTuqbfi
 So2sOHi+8IUvMwz0Qj2+rC2M1rElihG844N30SytTnZo2Hl3c4foFgI4CuMAUOJqIrzjs/6TCC0
 5IVTMTbC0uddHooVlVKcwpcsluS1IKSbHthqg83R0QiBw4CJXXii7Ph/uH7odKaLTTNAR8EoQ94
 QyOjZ65HHc1uCbR8rWRyU/l2+yZVsxY73HSrk1X1bnnSIvvh2vUabWFzo9b8wSoI9UD/h1mLIOa
 Tn5+rQd/tV9rcxtSJHwYL6ww4wo1s0LrthnfWXjqlUjyp8/33mvs5BQo1NEybBhoy1OBT21Sa9J
 /jIxEkkQmm2WNa2vH9KptEQINXRepNIkQAagFk2ezy7B9ruv99548k1D3TyAb0DX9WBHQF1ecIh
 DxWNN8eJdlP6XskKUNTZ29X3Y=
X-Received: by 2002:a05:620a:2589:b0:8b5:9f70:d4e0 with SMTP id
 af79cd13be357-8c38940c03bmr2295579185a.88.1768188219716; 
 Sun, 11 Jan 2026 19:23:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhRYqINNGiilfJktGY1a3QidR9dZtC/TGNBRD3m0CpeK0zV5Tl0mD40AXvWvDl2toWpsPckw==
X-Received: by 2002:a05:620a:2589:b0:8b5:9f70:d4e0 with SMTP id
 af79cd13be357-8c38940c03bmr2295577285a.88.1768188219218; 
 Sun, 11 Jan 2026 19:23:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b7c2dd9e2sm2373045e87.5.2026.01.11.19.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 19:23:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:23:30 +0200
Subject: [PATCH v2 1/2] drm/msm/dpu: simplify bg_alpha selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-rework-alpha-v2-1-d168785911d5@oss.qualcomm.com>
References: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
In-Reply-To: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QdHxLyA4MAw7riR6PM0xKlPVvxw0TXT2b0nWTc5++jY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGkzRM0sbLWl/Sv3hK/B492DWbzsS2z/RVzMV
 Pt3sacXROCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRpMwAKCRCLPIo+Aiko
 1VqbCACqZm08A4ACCAUYVTnkoETDGW8vofWybnMFbT+1GE0TZiAs9TkKY1QOmm/hepBjr1PoAI3
 UlRiO1onsgw1QiP2IpZ53+A3Dw5JJB3giv6YQP0BtvqqgfUx01cNJuoGETeLm3BTpN/Xqj6+WGx
 bY4UMQb60xX5r+YB9x+CzeX+hhQmhSdA+okoGJKZiu5vLBkJ8dHQ6OHLPeycOyYrKHhIq/jtcXM
 hQCXEEqGGhjdBTh5bor2BfnliWZUlM/VlnfEXW5RqsvG8squDUJMplD2rp0FwHU5m31iCm2yGIv
 pR+KtN86n2MfAg1lXacJGKqff2JiynRnBdITNp9QypuuIn/R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0A23p2zosBjWon6u6LlCRQSaAmXqPsbM
X-Proofpoint-ORIG-GUID: 0A23p2zosBjWon6u6LlCRQSaAmXqPsbM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNiBTYWx0ZWRfX71ctd4iyLas1
 SuJQ0kVpx+jUeFjsiU+lomIsWFyQMGySugBm6Ur1uDU42zUPgAIz8mTnecrqIqVU6n2sqX1FqtW
 nTIwIQiVWObCl+HKJR6TnyLODv3JmN1KSHRb6FDelquG69X4AJHiDLLOjV1l5IWK//qDkg72M20
 P4JAh/DWvp4Lgj9kXB20L6hcLx018TlIbpWP6aRW0sY+5nwZjjT91IUk2VK3ZdIJtV9vLh3fyEx
 /QNsx+O4h925AudLpkFHkYat8mSO1LOye9whB+XRNooW1jRRTaLD6Lm10G+9DfHzZhnmAeGXxde
 dXH8q5A6iDPdBzc0YlBXYCMHFHyf0JDhxGwcvgzv8wUvgHlGUZ0DE96Q2+rC0/bp2IsUzh+h9wE
 Ncj3mrcV2GFFPCj9ev49jXn3AJNyLW4b26NCvATT4qU7fZjDmo2Osq4hyH8oBzb14f2pxrNwnpQ
 2iUDtENic3prGxBaOug==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964693c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ID75BBqnTVE1V_rUnp8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120026
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2d06c950e814..f6827ed71f4e 100644
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
2.47.3


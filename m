Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CED3B34303
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1626310E4B8;
	Mon, 25 Aug 2025 14:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dezX248K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D2110E4B8
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Kxao024639
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SE0gyMoB8H1CugyDSf0yuuJz5+xdbT3mnKETqrVtLJE=; b=dezX248KTCA8HBnZ
 k+1XoucYM9nNMkL0mTZDlkj234rYZWJdiHbQvaqqzxtKLhfyUWPpLm/0VKeEiNCl
 0bZf7vNVCMKE/obYAHL6JWAfg171ON2tJlFYPSIKIktLE15qGlSxulVUxFf+c7MA
 TiJhppipFBflXehXYu2B1ghesa1F5H3cWNpLP6AFoZE+9FNoPOXk7tI2SsUh3rcQ
 8dSnhQQom2xsSod+1p1n44+hxPXnD/vOtJq0HWHxz9vXMp1voV1Q9SncY+1c2P8C
 V8fhEEvaCnVhSxiPFhGLpI8lynUJcmZW25yeZOealxDGJsSKmA+RIia73j99Qen6
 y7h/7A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615d91v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7704769dbb0so1713822b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131454; x=1756736254;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SE0gyMoB8H1CugyDSf0yuuJz5+xdbT3mnKETqrVtLJE=;
 b=VXAStYn84SZF1w9y2R6mwzatH3lEGzk+UjJECeUwjxrRerwFWay8MTiG9WlC4bgyT9
 hS1yli1u2D7/wV9CngrZJFOrjf6kibrjXjksEGmtrN+fNWnLVMtPUcnSN5W+pytVHh7c
 azlncDghGC6b7k6rS17Tp704BuVrvQZbvmwobg1C4wJJWiVfVtVBsuyPNcOHYeH5OuQp
 yDnZGGTBVwPh65mafy04Bi0oTJ7dxVbRciA7ZN9kWPv2pCf4JbgVSxdBeDYurlTFXGx0
 ZgPlnrf5WqVcXQyzF1Nhjz9Dz1mK+0D2V/ARNxfwPsU2GzTnptK1BWLLVTXXlWYB3FT5
 J9eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYFpn78it0W3QSSWo3L2eGMBxdnbBHex0YMsZXWjCjBAhB0qPuYgbr+a2Przu2EX353c0kihQ5JU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPnSLc4+MjMQZlVCQJEIRxtzjqn+iwGO1vDHawgm97m6U+yqYd
 m9+mSoGbmEkCnWhwuXwBvX+Vlx/e5w1s5BKPLrYgm8metNCrf0ocWgsybniH3LtzdZhm7lfIbQn
 I+6ycgGXM2TNRABqdxJwsm1EPyU8crHblq05moivVzZIPrVqmqcDWVnqSX1jqReXxd/Mpiz4=
X-Gm-Gg: ASbGncs9sKHxmcUIfIjXQ1RYviNzDMRQzLkWz697adg0G6Ez1e3aZyMKRm7gAjt/qQw
 b0tJy0jpadimqAzwJV3U02MqVlpR7vpQjB+gW2u1/XigQJEMnR8pMut2O1jzp/qJeNQeStHYjyQ
 A5LbWCaN6ssBS31yDUkTDgsWrhxtbd5DkX0lGEcGJLs7p9QLCymdhnUoK09E5QfFY0l/L6sCnov
 jYqCJTFLbWgRoN7KJmlXu+nNaaJI7TpdYnY6YS28kfrGjHKf1ifyLTClJGcNoSQshrrLC2dVsLs
 GQsHsURBmPUsGG51VWRYyGKq1EcKMms7TQY+ATHNDpWLZHanoNTfaLbObYel0Yq25YyNKhE=
X-Received: by 2002:a05:6a00:1148:b0:770:343b:5457 with SMTP id
 d2e1a72fcca58-770343b5776mr12538550b3a.16.1756131453931; 
 Mon, 25 Aug 2025 07:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMy2R23VqH7KKGD0dAfeWxD+PQOsTGsim/ksuVooGj2cwAdBV6kfz9RNS/shNC+Cw70XbkDw==
X-Received: by 2002:a05:6a00:1148:b0:770:343b:5457 with SMTP id
 d2e1a72fcca58-770343b5776mr12538514b3a.16.1756131453406; 
 Mon, 25 Aug 2025 07:17:33 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:33 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:52 +0800
Subject: [PATCH v3 06/38] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-6-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=2040;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=c96ZWM2YbGkHRur6wRdiO/jYHW4Vd3JzeA7uCSEtT40=;
 b=7A1066X0KZACbntHPM+Jt/eD3ZsGYrvKe6zzDb5Z8KcJMssPlZjEANxf0jIuv1DUHGdJUBX6L
 K70v2S0HEELDa+s60FWY1wBPrH07gJDdKqrPryvvoisMjvel6HNe6/z
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXz2b+lbY9PjpH
 G9TZ9JNTdcUCNdwckdtIHiyte/1Z7TKZ7AkYoJWE2sCjTImzY/ueLqjHOlqV0VWlEoKgy7hqE7D
 Av+nxJmyZrgCVNkuG58eNeO7xnpvYC7xQlRnE+gjOcgd1+H/xm3/pafWb8jvoOaiuDfIEi6+vSM
 4OZ2VQj8wdWV6XDmDofj4ypR0UR+77ZqIwnr89TyBwIQVOFE8pOIChyNDVkBWzaF+pfDwD84bfZ
 c25sJdl22PlIiKGbNUk+Vb/Cp24iZN5CzhmvwXSpvggTc/29xq9SrLQBMImW+0kFV5zw9Fh6In4
 XCsAspipouhO/VtG6RrPUC8udVQiDLXVH2MdYMOxcp57wHaBXH0/dsOqvNIT4Rg6nqTOnZLGGwU
 vHAKkWex
X-Proofpoint-GUID: IkQqR06ulr3tnSo8OLK6S_e2FPEs8mWf
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac707f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=aoENilsEcffTQy9B1RkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: IkQqR06ulr3tnSo8OLK6S_e2FPEs8mWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

The MISC1_MISC0 register contains stream-specific configuration bits.
To improve code clarity and modularity, this patch refactors the related
code into a new helper function: msm_dp_ctrl_config_misc1_misc0().

This separation also prepares the codebase for future MST stream
programming support.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 45d6c9a7f7ddaa049443253cbf4c6fc5feda3177..6bfb639c1ebd33f1103c5b68dfb40701738fa267 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -447,13 +447,13 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 			ln_mapping);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
+					   struct msm_dp_panel *msm_dp_panel)
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
-
-	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
+	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
+		msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
@@ -467,6 +467,13 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+}
+
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+{
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+
+	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
 
 	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }

-- 
2.34.1


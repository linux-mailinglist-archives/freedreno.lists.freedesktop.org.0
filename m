Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45526D01B10
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 09:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1547210E6B7;
	Thu,  8 Jan 2026 08:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwFID3MK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBHuQqV/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B6D10E6B5
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 08:58:08 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6088pGJ44049328
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=D7O7zbR7bk0
 RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=; b=cwFID3MKDYKuRkIpd5VIj7CQX80
 IIeZdQuPcSNfydPzPOdmuw9iQumQlXD7JTLsuLfBEAW7845tR9e6liYyieNchtEr
 4fnDAWK4abSlCZLdbiJFQUjt/DtwZdqv//UD+enyPhLOpRx4bg1QAJKl1M9XD/md
 Xvgmst4sdC4nt+aSG59pJ+03r8f+NGc/yfJemkQmAohN2iL1L7IvjvA0q3Y28ELr
 fVN/nCVeqcStpmRPKeAHtP4FyZXFUt0Yv58KULElYh89VeVOsojNdgSVfTsO+AB4
 dJeSVybIHzJRgihto5ew5EiXAg5ySQpytw2AuaQ7ZCBSPNK8vCUjMr++1Nw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8hakc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a25a341ebso68322566d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862687; x=1768467487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7O7zbR7bk0RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=;
 b=dBHuQqV/k1FWn/X2TGk+OiH9iPP2cgWJv3YJrPefsNWwEWPUcsdMI2XRR1csIjB3l9
 eZnwFquH9U3osGLuQSScBt4LNX+B9+4iHvT86dwy60LTU4PSuOPNRj7YSPBlEhdnad50
 gcWRM31WfvZi3csynueexJrs/cSJrq8BQqedAcdojCp+QWL06doSM3oNGqDS5FV0/Lzm
 glpGbcJyVIEoeo/ybYPMOhI/T0WcNI9HyXHwsyIUPQFDKsZzSI0W6C/h/DejfEU/xUA6
 XQ4LaozzStK4XoAIYuQqCs5xCQNsZvuEgqEfNDqTirrrZK4hsZ72sb//gTJllXYpdzkF
 H8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862687; x=1768467487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D7O7zbR7bk0RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=;
 b=bzDyvWR7aGz7IoAKsYK+juuuNPAhggA7hZAZluUTBHaKMWaQYtrIBBn1Bu6itpior5
 8Dxj56hcYpSIcpFYuULx6cG46KOGKv6VPeIazi7LhhKkyRY/JKvkRs0zqtf4+YYxvonq
 kTdVlhhVWsvZmfxoEdZZT0e78jKeRlslgkCCXXZHr2OQvtRlTOKBMGsYKYLRA9OCtxxF
 jJheY1tzeII8xeGbPeppeHkS4Wszwh4xgLAM6t3GWRsQbdZurIkyorwb+9aRqTMeZ8vu
 8Pf5cu2y0iD+qGTGGKZc4JAU++tIctBzgnyzN6SKBIwgLTccBNEU27npCtskw9WsEmrG
 zwVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8yCoqEStgnGmTu9LIOejribHBwLlzZIGqpiPBJVBVOywGkzYsMTrYeE7yOtXDGOtY7L0+fqAGVVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyart0jwXtKBbUMfX5gtZ/rnpCKyPOfYPlC5J1r9MWPRaU9XLlQ
 Bw44+Qth1o1Wt4PtM/fWNmFx+sFctQUxwDu09cDem5gYh2gyld49z0qTs8+29Zfhc3f0sTwjJHA
 6r69u47ueblYZeyTCwoXQT3tTDbOEhD7xLam/4UY5Nj9r7xNjvmGv5wHMQMPTzfoePLOh7dQ=
X-Gm-Gg: AY/fxX6nouRhpgvnX74tuaRtv0kU9yy+1xavcd+orVT3rgBlt/vQ/PYjkRwGVpIhi0v
 r3lTrE/Zf6k41qCke9jv+Wu388g7w7MMrg2EK0lwYVe0jMusfgjUVzJzEhXtanCnTPnUbs2emcf
 3VC+Yct7GdJ1zCm2sAf1VBO9qJZ7s0lZYGDJhcFa1Cx8hCVIPCfOignVbkv8IVf2TjUEhCv8pf/
 REt+NIQ+v6th8dxlbcAS5YvMMTGroeysiaqPhBEeUvyvm36hv4RVqlZTDxKK1Lea/xn4uOoW+yO
 ykEX6XeAwBMIFniEiZiMl4xOUZFc7CfL6jf2546ji8l9HXltV/4Yu3DIgHbX281BiT3HdiSMiZo
 DaavHYmSfRAs9GY6RWSvBGFC8EQeHDUZ+CMJd9qDDRSN0WBW/kfN9DuxjPurI0ljDrjg=
X-Received: by 2002:a05:6214:c46:b0:882:4be6:9ab9 with SMTP id
 6a1803df08f44-890842d158emr79772736d6.54.1767862687097; 
 Thu, 08 Jan 2026 00:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZ6o0SmHvML2LmrOe7eTL0nOVLedXj8klhr7BqpyaZ9HLVsEOuMtIS4GiO6aIiM/fwMf952g==
X-Received: by 2002:a05:6214:c46:b0:882:4be6:9ab9 with SMTP id
 6a1803df08f44-890842d158emr79772466d6.54.1767862686705; 
 Thu, 08 Jan 2026 00:58:06 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:06 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 05/12] drm/msm/mdss: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:52 +0800
Message-Id: <20260108085659.790-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f71a0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hYg4dbXq4j5tZlskCswA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: ZagvtWiGn1G-t4Ye_-hYaclHY3iCoNj4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX8iADzAQjGm/o
 F9r3E92NKlEa9LtNe5ZrmQdPZdCAaxYfeo9fSL56WlFZT6C3M6IU+8bRZ5jgC4otETkVS0/X4kq
 snyHmTq0OsGgIlkWhEDx6nLoF1NZ1QWQJkziPsGKOP/doEej2kusKLZCnCg1VaDoPsjJMofkvMd
 Kwr59J5hKx1Pyt+dvcotq79WNej5zokjEvlFHsXhWZ3xTTSPH7/LxrWnqcRzm+LhHGfxeGwtoB4
 Rn4GflbOR2kpCykjcUQzc3gGLQsjSYLef7Lw5IaUn4zMf/qH1deZ6Ux1AyoW1/w2uSJaxiwC31C
 oPRjxS/1fBMKFUsbK3wRevV79tBfkmdfeWABq4E6E9rGg0uQ6odxQEImHk0BlrSxOg6371f+y0q
 InZ4igOfAWnumpp7gRM3UcAaHZGQAl/ORpsJW6JwQ0CdF7MlwUX3UDuPjNq7wmeXv1KgM/BfR6P
 rhdaYJvTeSTkplHqANw==
X-Proofpoint-GUID: ZagvtWiGn1G-t4Ye_-hYaclHY3iCoNj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add mdss support for the Qualcomm Kaanapali platform.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..7d78d16f8802 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_dec_version == UBWC_6_0)
+		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	else
+		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
@@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_5_0:
 		msm_mdss_setup_ubwc_dec_50(msm_mdss);
 		break;
+	case UBWC_6_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -554,6 +561,7 @@ static const struct msm_mdss_data data_153k6 = {
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
-- 
2.34.1


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB44CD58EA
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 11:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7064B10E5B0;
	Mon, 22 Dec 2025 10:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjWUDFfQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAgKYZJM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5B310E5F8
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM8ViFH3865657
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=r5yEEbJ1h77
 cc5KTEZHgojGWBkSJ/q25QiaB6fdvsdE=; b=SjWUDFfQc+mpaVxxFqvCDxq3/qu
 FEXsBPNKY/k3yowBwXnpEW/FCvS79IR+SXEjRW9YgouJvC9UZWMbjiCZlgfQDziz
 kRQIsYgVbdAX6L9zM8c39VM7GHxp2zZcDGDn7kUBuWb0cSd2a8bLd4gzkg+0WqqU
 MAAHgysJkaOxwpy+6tFIPpbwNsJ0k5Y0isRQaJr3DNlj7Wck+VUtuyk03AkFj6mV
 8M/wlBF+nhVMLwAKFubEJU1GIKnbRR76hH3MA1V8P584cBrldNFpV/DOZ4t5gnfa
 ufuHMainpBfED6/Q1asUznXH55sWEf4h/SmGlKhpI9oBGvPNo6rFozDH98g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtcnwc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a316ddbacso93140596d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399097; x=1767003897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5yEEbJ1h77cc5KTEZHgojGWBkSJ/q25QiaB6fdvsdE=;
 b=VAgKYZJMo2kALg8whgFcKHr8UUK+DPDG9rWfTQxS6EsPc0d5ssenX30LYUfJIa9H6V
 r3Pm+cH0A61JV7STJvSfY7vzhDEtNsY38mEi3Fqbf+n0420qxnuxeEXt7aZN+oBvJRLm
 7SkiOYdJ35gvrXaffE7KMjVeoUG085/qvtrJ54X0v1spVVM5aKF1n4OiOoJFg5oEtQw9
 PkBFH6D+Av+N5GCluP4+y5o5YSQcR9lneRcf0U0o60UHfQ1bDv8PAYkDynLQw3oPmTEX
 cjWbwhw5ugxaPC+W/h9OhJXFe+9epND6aJU4+Yzs/qNimE7WzJYkkQXNfO/MmRJ0qfa6
 af0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399097; x=1767003897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r5yEEbJ1h77cc5KTEZHgojGWBkSJ/q25QiaB6fdvsdE=;
 b=wCZo0aWvmzoF6yLVAhJ6D6/kGFf1NuSdlx2dPnWybF9npc+aEd2xv3kynufLiduZyj
 wflJNam4sAEWKJ3A9Y/LadNvZvwxCusLTsYUR0ID5RI8DwEhkrfAjKIQ3pr8XcFYfHDt
 pPQ0ZQg7ZKdCpCqxLnon/B+ibSGV+GTVUshGm4pbWDpqKFn5jQUAqtJwHXoPp4ZGr7tI
 cvf0WuYEWC10SmJH/OnQhmy59lOln+rQyXqFfRVzujPSHBkRFilMv5Pqx3X8/JYGEsxk
 HxueII4M5xQ4aPbNoyGHToOcWCZvhfccKEkoBS0OgjVLJU12FHNDPU6PxQGfOQzxxlMB
 6j6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhoqkrCIk0xPHndgaoOs5ILnVvcg1dl5fitMgLb2c2EUNs+EKBoIimC44QgFCJXa6wXBZE71+xh/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQGSMiUKkPUbokKJ//hqfTb+DSISuueJHzz5cxCW+fe0Dtl9ot
 Ayg1HZl/bqLaIaox5gzdqVGtAITQmz+ceUe/8w3HGP/IWwPzP+gIELWirddq1gla9ENyexzl5/h
 zvJzfKG+jAErgfuqyJsdMis9JxtBJ3MnwEhKF2HULR1Dz4Bl3I+9C+wJmBX9IjOzZObu4BZ4=
X-Gm-Gg: AY/fxX42UqA0k3spa7Man8Ks/ss5gjiG1yxOPOsncwpKCZSRnudi2dcdpumrosloc5H
 ME3p/sUAsbBOURXtQfaOsVEEWoNiVRHUtUol7hqvl2/PO5UBpRjjPU+KCFxPYsYnRphxhsCiq3u
 RolNdw3+1ddhYJO9rxhL3ubQRRImIPtvvVq25ZH+pN2MCEHn4lZ4so6dvDTPgAxR8P+6jcC9Hsq
 Z3rXJ2uN0E5wMDH44SHZ/LAtgw693FYQoq1xTW3MiNYKYMZiX48gXWWnPjt2bET65SoeiWB6Fv+
 O2QXEja21bYZYPiKu5Y8aNJ01r1Ey3X68jYkkGa1StBbS/n9UySxrtV9ehIg4zoIcmHrtEJbZEJ
 ybx4XciBfoi5bcI6ZdWaXkRwetZ+puxBXxVjTkidpmwXvRbjyIvQaNqpmJI4jFbBewlk=
X-Received: by 2002:ad4:5def:0:b0:880:5001:17d1 with SMTP id
 6a1803df08f44-88d86290b9cmr184689796d6.37.1766399096793; 
 Mon, 22 Dec 2025 02:24:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1CYIqkjr3zp/RkKgn4YLOMNIlAJHmGvQ9whNuk0P5xefXhTdEEm9trZuQpyBGny8zBVJ6wQ==
X-Received: by 2002:ad4:5def:0:b0:880:5001:17d1 with SMTP id
 6a1803df08f44-88d86290b9cmr184689416d6.37.1766399096353; 
 Mon, 22 Dec 2025 02:24:56 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:56 -0800 (PST)
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
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:54 +0800
Message-Id: <20251222102400.1109-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ATyptfXFYdLZ6DT5J4k1QZWWvObi-uC7
X-Proofpoint-GUID: ATyptfXFYdLZ6DT5J4k1QZWWvObi-uC7
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=69491c79 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hYg4dbXq4j5tZlskCswA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX8WUlUqFV5l6P
 eG5gXd+PGWt9N/E+GDLeYjBquAv4LstccAYuLt+xZnHhYe+GFSjXgNOfjwEiAgxJt/NWQ1SBrgi
 UckrOSbkCIfGhQn+0BW3TwYkcuBl7FW6+iO8+EVvNgKQ05BGkqLUczTYeKWSkxqs0tfXnxCofpW
 6fZMuuQdi0/We6VAHyl2J1CuIqfxS31FsHB2wwnYtU4dz9AEU4FmC/RRJI5B2LBmaBprZqX8jn1
 tcuVeZ+xXovpPcjxRSyZTjJjyoPPUP0R7KRNRuiDSWpC50TArC2zFKkGESIbPLmahdiZ+k5ghAO
 v3fI5D05vRKYJgj7xDyh4DSFQoFAMIeWNvMtJqasT9lq67NvXe3zlPbFLG7LxlplMr+8b0f2BXF
 cKKVmdkD8vORUwF2erIGvI4asa/KY04BGeGhQ4eVIDDfVbrMpr0jluUYheRviV7DDR0mNjveVNC
 lpeAYNxXYsLB9M9hIbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094
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


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E870FC838A5
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 07:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2CC10E34F;
	Tue, 25 Nov 2025 06:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+kxnB4B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XygS1bhs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002AC10E34F
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2geeg2216811
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sl70Xakrk/Q
 WuTVO9HzpUuERYvoGu0ruQzvOAyWXJVA=; b=F+kxnB4BHt1771E/s27KGl4vZuO
 ji8uIBVxgAtc5jlyJX+jZc33agIimP1nJw3p9GmWMjweTmrdjTerZkWj9GMCaBjE
 /kBZptiUZC7pVh3IMBfbzsAFANG6SrX9lbxdutCuPsqzCbYj6TOjSmcpgFJF0bVm
 QZDfisUxkFu1VEoPx5tULR93GhSCqeNCU6bj59YkdOeX8KdBGOBpwatP/TZJK2ac
 9177VB3b8TygmF9bi1UimgwhtEKdcWTBtRKJRz12VlRJSpL1YHK/pQmef86RcWtc
 38tUF3X7YNflRC3lgBkfu40F1SJyFCeiw/SCXnX3hmBf9CxptNApl0AAezQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amsk6ade3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee0c1c57bcso206073381cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053351; x=1764658151;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sl70Xakrk/QWuTVO9HzpUuERYvoGu0ruQzvOAyWXJVA=;
 b=XygS1bhslPq4vk4GEjlRKna3xIcH8bnsJ+beu4npKoOcg9SS2rX964esQZrfH/X7Y6
 7OVwLZXZ9sboHMYXBYeDWIzV+Cp7eCxZVhiaLaiXfSxOhxMHigqeW+e6Clinu2k2tKUf
 KUzp8JQXYWbEar7eqX5O9M0C6VCZZIqjq4Pbgbt7NHwgQ43fDPBGNd882rCWTTCB6Pfm
 tQtMs8LFcg98F6d/rJqIjnVXB82WPEbNbJCk8SJeiAgrAAUmvS9qnooe+3w7RbHHM2i5
 z2gNsAKbJQjWD8hNDkQKtefBJ4+pY0WUkvs+dg25gxOzvMcrIvqrLckAVpIYnZ/htWZR
 Ggxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053351; x=1764658151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sl70Xakrk/QWuTVO9HzpUuERYvoGu0ruQzvOAyWXJVA=;
 b=gWihHI2E8GonHwCo1zwtg3mH2IEnlUezT4vSlRQAI1p2ie3MhGoWfT2AbqzXYiBZ37
 koRXPViW9lxnGLHKuCtUTXSCaoAv5MMY5/7KoSo2irEqV8dhCIQzIZrmB3A9QiFqVQzR
 jk0YEjIBAy4j4dWL/IVtFCgJWBYUyb/fUIoZzEc+AO4Qcv7Uo41hoQxuwokVIs2G64Jr
 BKBH2tQx757oQWt3MFzo3rps40TFXXRPpk/gTcwnyIZGlA3HpfkInch2/ZhCBc5ozF0Q
 N80f1iqhx9f8TfOB7ICV5snZxEjkJs0SvmPJ9t4cMO8riL6b4Ad6dvLBTvL9rMqmqSgX
 N5zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhOUWZMflraYHft77rVloPsMLfOg+DrRDg78iW9I9MYzwLQXHaCrsKMpfEXdAjsmVAO3SmCwHR6cM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCB905q8SqwrCipe2hP67JqBjMO0Wzt8XZ0ZSV1Y08yFvp5WVz
 i87TqgZebvg84ipnK1L0ojYx6V/rATXssUutA8JH5p1HBj91rorA5tw58ZYra9rgWcDC3q1xIVT
 CiTFzRpbleY+70U21GkFTugKRtfWgqK/gVisWN5fA22Mywagq2Nkn4/2EPPX0cuqtOQCMpIE=
X-Gm-Gg: ASbGncs8ig0i2kpJiMrAVZxxonktUP+N9LMS08jVNRjx8wBuvvZQcV3lavkk4g2Poy9
 IIfJK5ADDJ554z/v/8jexrzj9R5iXniLIcdTHAVyu8Z9ybkDN2Dbgx8/g6LL7y9U2+lXFrXiR6v
 z9bOh10T1f/bhdl4RKFdPNe6G1h+qMJGjZAdvODhqs5krF41p08K5VWd/YPway75RDNlXDIfy3R
 x0X/1SuAiK0HZB/Iys87mewgG73GsAicCEIgbFMUPKsVMCy8VTF0EAfBB20mR+PFt25tTYTbpO2
 QBqMmWV5U+Fhn+gTtZv0Pyq2YrtKPCreUFSZADESq5d+1srGKSoh1pa2hHymMJ7s4Ab5D9GlhrC
 769DQ8Cg07e4c7HOWRLHU+6BQN4TcygC9g824vet2lfxaMpEznaUeEbXwQ8wbOkHx1iBseic=
X-Received: by 2002:a05:622a:98d:b0:4ed:bad6:9fac with SMTP id
 d75a77b69052e-4ee58a446e5mr170268621cf.1.1764053351614; 
 Mon, 24 Nov 2025 22:49:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiZgA3RMR7QzcGUxzPh5hdymLOsFNIYBB5TZ/d/l1DFbwPQDvEADrbvlT5d/ZAyusRDJhjzg==
X-Received: by 2002:a05:622a:98d:b0:4ed:bad6:9fac with SMTP id
 d75a77b69052e-4ee58a446e5mr170268461cf.1.1764053351283; 
 Mon, 24 Nov 2025 22:49:11 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:49:10 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:53 +0800
Message-Id: <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pU-l2Kgi2qdVOn0a-SsN2C9UX_qEe1u2
X-Proofpoint-ORIG-GUID: pU-l2Kgi2qdVOn0a-SsN2C9UX_qEe1u2
X-Authority-Analysis: v=2.4 cv=WL5yn3sR c=1 sm=1 tr=0 ts=69255168 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=74ENWJKDy3Vb_L2bHi4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX4m6fZrHit9M+
 vXohoaJaFwrOqwM4vbr8RqHIj5tBTMlrW05mO0eFZ+vaenRUHwgdZHNtLYWd1JUKFnV954+xGmV
 tZurOb5H3/yehDZtI20U4laVfL4GbM35s2CaRktWp1hMcvvKDfVknc7YaV1zSfLbhyBFBxUSRi5
 s+z5sSAd0KSTOi5PTNrBk100/DmRB9KXgdj3KNUV92sBPYqOrvMVIWMB0hOdzFeq6hxkpeyvcDu
 Wtnu+2A2Byewi0dJ1LJ0gw0+/a5H0mSQHR3jj/nNudD628PBV9l6LnAimEdIK+0N+ckYEm4wrjV
 0vFJKO52VHo7XdaZMu44ED4GlWux7nHVEXYS4hjdjb5hH6x49hteEO+fE3R2cZleqOHg2iQWXdF
 2HgwSISJAB8GVXO/xKZZsXLHztxlEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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
 drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..797ef134e081 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
+static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
+{
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
@@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_5_0:
 		msm_mdss_setup_ubwc_dec_50(msm_mdss);
 		break;
+	case UBWC_6_0:
+		msm_mdss_setup_ubwc_dec_60(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
 };
 
 static const struct of_device_id mdss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
-- 
2.34.1


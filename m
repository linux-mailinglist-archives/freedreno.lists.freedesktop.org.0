Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31482D23873
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A6D10E72B;
	Thu, 15 Jan 2026 09:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fngj9iO2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZ2nhaUf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945C310E72C
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g4jp1745272
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ROM7fWPFWUz
 cmTgkmDPvcUNBg1ta7vfdGwJEX44Q0B4=; b=Fngj9iO2ztJCKq0RZTyVTe+d7HU
 3m8wcb9vIxsO4XFUBQRggRwPSIx3lJ5yaFO3vgT48pD+fVJqBnBxqi8uXFBMzc1q
 aSTSpIe+WBTg2ehIWrxprqvJsA0qHnIiX8gbDtifMow8mcGm+67E5NNajjF3nDjE
 3KJYO49INrlbWdicwP712CabM7h3uqfnYSsFGcP0oYRcpCPDSrrGcFtfyN99mJ9j
 FMWDi0phLFY3lEm+HFDhryI54Nv/Bz76bSfMorgznch6LLGSIrp/99peZwqss0Im
 u21pLMGdd/FQnZWynlj3QV/VtTeXIGvwHOKFh01e5v7cYx41C/TR/VMFwtQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2gj8x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a316ede50so16565166d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469376; x=1769074176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROM7fWPFWUzcmTgkmDPvcUNBg1ta7vfdGwJEX44Q0B4=;
 b=iZ2nhaUfRFaR/zB8ITHxoxswLxRXgYDtBuIxNj59LUSWuwwwA9peBJcVHkvLX9+iyW
 mCemNuqBi4FXrzstnwvqxp2SFymK8TQgsILd94cNZOmKOnRLZTKJPYZYbaNkFpyKuoSp
 6pvVdPBMdy4sB+XTPQwXoO7g6QpgZaIigLzz1xwWcT2Kv9gu2cgcEamF/HI/4qQD5f+6
 rYPBrsheIGHfFxphNXLSgA52fDm4clIYSpZb5/LaH0NeKyZBiqq9WKNxmihEslnW4iyW
 fIKB/OToWLiqYlMzikRPlz4D0bAgenU2O/5SmMA2cVBbgRYGu3IgykhrUWJaRROoQSCe
 bQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469376; x=1769074176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ROM7fWPFWUzcmTgkmDPvcUNBg1ta7vfdGwJEX44Q0B4=;
 b=GZnrrk0XTxLhkvp9TvvluW3fYZTAii6tXHhpR9pTfg9/amGKPdnejMznti/jt8IYW3
 U2MnFzvnNnVi4g/ahpOD0PRRnIRbleEUBUpSSRk8EyDLw+PW+2aK1bKA1btqoMOvz1xl
 q6JPD9sZPTZdlJDC2V56PzfoJvD+6EH+ap8lB/E15B74IXPYAJaCH0A3sp2mM46WHtrE
 IfJ2JFPxmqubFgCR3r4puvI+J+vuBcFY2FblTuku+fxT1zxBqvYp+i/kS7MIde7oPXa+
 o/jxiM97sK8DLQ1stQnf2ae/Enfxi15faefsn/a4Aff6GQEMmug8bKsOA/g7Zl7ftMp9
 ZHDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgG6uI5PF0+CoAx4Z5TvtbDrZGb7DatXiKPAuxijo/KabKvPH1a9WGeqD/xs5/wExXA/SXbib3z5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpjVWz9SR7DCZux061+UX5fkc4eE78H5ZW3VuUiYehjySdrVo8
 2uCm0RDMnrmO9XUje3xuD0mfvxNzE9XgKmol4/cTOPeCgA1xmsNgCENjpmEdsypjANrBEG1zyZ8
 aDtsuSDBSsfW1lW25v1C3C9mpgZYCreG20niC+EvcJV2ecEPFdli2UndwKZAQKXKgDMEUEds=
X-Gm-Gg: AY/fxX4hs4+ifU27JLGkfl9TpDbgMeD/iZnOjwR480iZFGfLB6TZ9TRrIibv8h++L6+
 B1FvYF8sZCn5KlEn40HsF8JQjg9Fvn4wUzpr74eo/BspQkWmee9Kfzdd/WOCcwv24OFLDoGtleo
 fA5246T1FCAVxwEHB+8nyxClVOVFKDCmGscsU03PFKh5HXKrjH5FJ2cbHM5m+7LbqoeNvjGFiAa
 1dRqPi7Eus+p193l6gaq6WDFE13XDfd+0+3lPPfFNAQ9rhkTqt9W6cYvhwDFF8zupxHyMobVl7d
 0yLr5CRuTuGL7qL7R9odX17ITEnjEbDQI42vs4utnV0DhrSjNBKpXiRWAAfwmeatLVFAbKyeGum
 g6IZNcxshuOsmxDF5y7GBzcKRri5Tu2Y1hRvp4BZIrcO2kmyJqOMDuzUdLT1Y1XuV6Rc=
X-Received: by 2002:ad4:5e87:0:b0:88a:2444:36e9 with SMTP id
 6a1803df08f44-89275c87512mr75285376d6.67.1768469375910; 
 Thu, 15 Jan 2026 01:29:35 -0800 (PST)
X-Received: by 2002:ad4:5e87:0:b0:88a:2444:36e9 with SMTP id
 6a1803df08f44-89275c87512mr75285086d6.67.1768469375520; 
 Thu, 15 Jan 2026 01:29:35 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:29:35 -0800 (PST)
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
Subject: [PATCH v6 11/12] drm/msm/dpu: Add Kaanapali WB support
Date: Thu, 15 Jan 2026 17:27:48 +0800
Message-Id: <20260115092749.533-12-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX/SlqLKZuKMW3
 cPK6495X3oJpOFVwG5L/NCDv1fm3Ji3nL3VIzLXu1S11BRFNdIIcjxdT/2gWqWc91/tmb3uICne
 XtmXyLxhLbbEDTbyfLKtIvkcPjss9yT4+eiVskfWKba6UakLRMZ0jGXkA7wJDRMdKaC1vEN/c8P
 CQEJHFtDYb8ojDOS+K3nnZILc7PEnAp8j2s0BL3249EyNa/ZOlum63eLpkHTGKPh3Vlx+R6NoEM
 2zZSZFndsNm5Gd6XU2sLqiD/DHfj20Lz3w+7BQ8opYdhyGj63kRuJ81taIJTKtHbMHl8yO5hPV7
 tT6QV1w5b4BFjN3yYapmmRFoh+vApIVbt44MZ2g+hRrLx1LgiHrXLEtPmHr2smwq6sffWxfWUW2
 8GzIxP6/rspsuGT8eKaZuWlLo9OPyT+mB/F3UZ9MoZJlmvntfNqlOcTYOW1wdoRs4DrDFblCa8p
 dgPQwXpEeRScm4NKBuQ==
X-Proofpoint-ORIG-GUID: U-nPPSrAt2oD3vgYMYsi6H77cXRYq6Xa
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6968b380 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: U-nPPSrAt2oD3vgYMYsi6H77cXRYq6Xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150065
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

Add support for Kaanapali WB, which introduce register
relocations, use the updated registeri definition to ensure
compatibility.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 478a091aeccf..4da4bd6a997c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
 			      cfg);
 }
 
+static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
+					struct dpu_hw_qos_cfg *cfg)
+{
+	if (!ctx || !cfg)
+		return;
+
+	dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
+}
+
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
 				const struct msm_format *fmt,
 				bool enable)
@@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
 		ops->setup_roi = dpu_hw_wb_roi;
 
-	if (test_bit(DPU_WB_QOS, &features))
-		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	if (test_bit(DPU_WB_QOS, &features)) {
+		if (mdss_rev->core_major_ver >= 13)
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
+		else
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	}
 
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
-- 
2.34.1


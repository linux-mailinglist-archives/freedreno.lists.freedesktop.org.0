Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85BDD237FE
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B765510E71F;
	Thu, 15 Jan 2026 09:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNuYOHq9";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXXOndGx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB7110E720
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6foaH3419541
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
 iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=gNuYOHq9bGpDJAz+gDlrdBqizrr
 RjFNsg9vKfLdoNGUvmB7/bZWY8sihQcSIKiW3J1GMA1lBHRRLiiZXcbpURN7U0Pl
 VcC7nhD9PkNAjk1W7ApzMxeF7BCqdBA43ay2lGaJD5hmeSHkY6630KsHoKj9das9
 lxqJaqhovS6RxKzNvWypOGyENgW04kbnWmr0u90UhfAsMh14oVABl+jhIPOHbjsx
 M4hnQarsGvWr8VTG4HwGpobvnGk0wPApqo/+N7q9eiITysFcOFYq1me5p/juNDpL
 ieTlvS3ZC1W8DSnh5x6lGd2DGWk8R7AfrQvD6Xa51R2FqLzbiqZt+JtZ+Uw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj89x6p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8888447ffebso19893976d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469298; x=1769074098;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=XXXOndGxwKBviiJYsm4rFbxbFcRCd6n1lA97qnEhflC0V5YBo5AadRnjxtLmXr1chC
 MhB/dJYxxV/tNTPN7DC8ZHtuLznhfLf4WHy3evuS3KzcaAI3Mo27o1e17wltPc+dMX81
 XDzxdNpcodMb/yITnLq/nXZQFuctIT200fwuz+4x3IsH/BiwfO7D+v9enXqyjmZyF5wk
 FS17XJbuwBoSdwUosNLi26k23Z79hu5BYIDWqcocBrkm46O3EKxD7MHuWQeSTAH5zGGs
 oznYAktvuRtd713rFjYT6mlaUC2x/vmsFK5SmQhjk/KnM/QB3keATvPTBGVyWfZFrROE
 AkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469298; x=1769074098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=k/9cx246NsKBZ3SdLv1K2ck6uSQvLY0mJhk+BVk7HB4PWPPaGJCqWzaAxZOyKoR3kh
 5p+GvJS+2F3D7wMVra55xkarK1QnrHO++nlBJExdwI5pFcrBwKnTRGX38+tcarnGNSAm
 si6D46C0+2MmYXM3ypM33zb12b9maGfmW+ipJjBMOf1qs9WxgJreUxEqY1YSV8CD94OA
 3aisShcuBFe2RbsjR5/Wsw608pQQhnmZx8uaSe2NjC+pcE60K21FDqSPXKT7mLLioIxV
 qbv77W40cK7fy4f3jCaBxLdnzoyTiY4pCo7OcCVI+K8mnBx2sdr30sEFCNuwYWcmIxL+
 4cKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/W2zEjM+G45Jgyu49mpozPg6nKjnE6A8QY09E9whodWcaFY4B/V/3ZVMmkg4tCthSXJcc2E2Ba/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4HZuUpn37SUOayqX2hNhNvNuUQP3hrNQSNOCtCAl9daHnMDBf
 xpSyhMwgK0pSoaMt8/q27h4NiFSsAMNJnZEE8dDi/vjV8PH/o1uSikxPqh4A0RbcaqYeJ68wXxP
 m4B756YJLnKgCPmd85sZu48D4Jqxehy2tNkzwn7bfc78qqQE8iM7K2KHSdqOqxOYvmxMaoe4=
X-Gm-Gg: AY/fxX630voG5/SBBkhxIm/9x4xnO+HjCfnFvw1Rk0wAJkxtv7NMVTZJeQtJzes/x0T
 Hdcs7qSJPYgP2WzHqTZM3cnMqLpKkGS0KIgx8WxLU4plZPk3p8PBGx67Xi99vzU4Gwg6kJIH8xm
 q8XafsGNWkKrbT+77yu9/SuG3GE4eU+n4KCH9qI4Fhq5TRylTvd7IwwHuXGoyhz7TQmI0xvsjhQ
 Mg0kKisNHxfPy2yLKiNaDqaw9oGPuN62eXEZ9My23wgB+Ghnnof4rjkGhsyYOpvKxqx1FjocpYw
 b3zO1kURuK66WIC8/PgNUlA0kqjODZXulilytVxRCLkjn8h89pJGoYS3xJGJ+Be0PuXh1+17k3Y
 U6NttatOmVmmxYkIO8P5tj3oUJnTJxIkEThjgflSSiCohGev9LrH8GlXjySLRMgiwfro=
X-Received: by 2002:ad4:5961:0:b0:88a:3113:3ac3 with SMTP id
 6a1803df08f44-89275ae069fmr74177446d6.10.1768469298128; 
 Thu, 15 Jan 2026 01:28:18 -0800 (PST)
X-Received: by 2002:ad4:5961:0:b0:88a:3113:3ac3 with SMTP id
 6a1803df08f44-89275ae069fmr74177046d6.10.1768469297587; 
 Thu, 15 Jan 2026 01:28:17 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:28:17 -0800 (PST)
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
Subject: [PATCH v6 01/12] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Thu, 15 Jan 2026 17:27:38 +0800
Message-Id: <20260115092749.533-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LgBMjRHuhoqib1aiAGEvvzRsH3djod1v
X-Proofpoint-ORIG-GUID: LgBMjRHuhoqib1aiAGEvvzRsH3djod1v
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=6968b333 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX49K8lfhfyqUu
 Y/K5N3OevU/7a5AdxkArowZ0Ct9mbsGvLBlWekbPXsf9Gn23JBF3Kt6pPGKkQQdquf+r9lzZ17x
 PUQMdx5LpDkcvAiDQsM2jZRAK0S6cJjMJIIXd75jEP+rOa/o56rq29bB2ocax+NrwbuE8u3k7OH
 fAn8Z5nyd06eeFFWQ2HzxjQZItXzHH2y7jSR1IYJBU4c4AtMDxZn+awHmefXlc8YqE5HmVRF/vt
 gKSmNVLgklD4zvWlm9RPmWwa1EVN8xW3+o8IrovHqaLV49dOtuqP86W9qQszTJDHLriRmuwx6Xq
 I0eJyyEHQ91YM434OuexNTMAm67e1rjYra+/9oDR08lq37WRa4HqT3X5H3A6AYrvJfgjR86Kln5
 6YgcVabTklcFWiN0ajca7lPevAQenoTo24QcgUkhWjdpJ9fXOK052uB+Qw6UfqWrrT5WOOdPtBU
 YX9XvNf03a9CgnNlvUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065
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

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1


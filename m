Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF50C481B3
	for <lists+freedreno@lfdr.de>; Mon, 10 Nov 2025 17:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B022110E2DB;
	Mon, 10 Nov 2025 16:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgXgnG+V";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZJC7bu1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B578010E2DB
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:51:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAG56R82868015
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=; b=FgXgnG+VzrNfD9Uu
 xxzWXTo+ysFP0KjKvm6Xc6apvKNGStrOzzMefelUuFcVtLxfr9PvT2dWIMPgxqaQ
 U4WcLBlhpmt68iEvng1m3nv7vfD4oz5HDLg9+cpyQATHFvM0ajH2IO8+pwYiBU8x
 shlQcv95904PwuvG5m441HI0euahNHLueZfwxhCgqrQF419Z4gS44D+GqEJ/kTNQ
 5ytx/8zFy3+4p+u/DseLySE5IHJuWqivxKA5QZFSEAD1WzDwBCshHpkd635YbuV1
 XW0a8phzd6Qtmims2BEq0F08BhNRXIY4f1kznhbGaHXewKtIcl32Rcm7sD6cASrW
 +qu/4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd761ckb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:51:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b12cde7f76so978164785a.0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 08:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762793493; x=1763398293;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=;
 b=GZJC7bu1GiYfmFMuJAPmfOWlw2547TadTBVxNebKY6qop8hIVisPnibrXn+t+RXAja
 Y4VCbYflPokkTKoOQRuHZh4bLfJ1BMq6x6pIaHUuTjNErTudjxUkmKD58bVKWiwIeHOp
 MsVXgAWRY5jFcSkH7qjlTMJtLDxYOWrh4xdTuXBO2QzaeV0CVEVI8i35OLvuMp3qE3qh
 MVQo6spEJ+x+PtATQNZEn0fL17+oInx6qH6+hkHCrB6TOaDGB1IZfki5R9rFqMIea8qG
 djxourFATfDos0Ya2Rlo2YuMAUbl5EchPGW4Bm5a4uPYbWv3+Coq6o6i3vz88moD8lfB
 d2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762793493; x=1763398293;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=;
 b=ImzpOAeU7oPp3ipK+KbDcRzGqi3kDCZiJ+Rx9CsYJTb5El6+ZQ+Wlm3QIsUI2lonjc
 tYp3QN51uTggqWfzxUtz96WmLRCvGB6H/2COXqRxEIEi3zUV9tpa5s75JIdqm2vta6Y4
 jdW7fAVKqyL5iHdlq3dcyAe0TszSN6o9C2gxEbraw1flKtc7nQT05fMN69kufx2fSSE8
 ApXijMzHo6rlLREijNZK8QlsYtJW4JWnOW6sQ0oIAA9KebjnGQlZm7F+8M2RlE9/cs+M
 gp05kmckEuLTvy44F00wFguA6N1hSSlF3UsxzxEM470dkb5OWhM7Ed7W2ejsxZvjdhnT
 P4yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4f0GKGxMoQAvty7hSKv4NliPU7KijE0k1KBhtRUAFJaEBdN+9z4gJ8aRNnHZrrDpk6EgsZA7A6jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqLoYiN0LOr7RjGRpyYe2pSDrO/vkh2bRORnpOgqVtdZAywo/U
 /KIIF4YiWsjQf09roo5AJaiEG4O6FWfbpDhCmjk3/TZEvC1ou99t/hzJxNU4zqOa/ohMPE+IlgC
 a7c9GvncRetlyVM87YakH9t7Hr3sjrav+OXfzIamtciWCD0tschXJ40LlZjX1tndse6gIu0U=
X-Gm-Gg: ASbGncup/8n0P8E90aBAXyWIlRcX7r94nZpyJ/Sqz8XZUw1tLHLmQDuUXiI/0n1G0Zk
 inkfWEyHVu9aEjQ3l4Wp4mKe1AW7KjABB85NxL1zpM9zItyZOWJcbm6TJPy3+CeO1tgqDTWVIHl
 Q838t4CWdixgu4qf8QSSz9/EoBLGV6x2Mk4vNFCTxaEEQ8PbrXcinZCSnpM6DWL4l1cSSgvcuTz
 JWKq6VV3BUe6Dm5HsA255/pKAKswcX4CrCbZKCQnm7uqp4+E4hexTwg5cbEg2tmljPYSzzxYP66
 MQy3zoD/ou1sXzpbKyqKWfPkSL2GlRzLmg2x3iCPMDoL8CYGsN09gwJ9Ck7SuCa2wIYV7/i+qFa
 chLgVZiZjuTzjMLxR8PfsK1A=
X-Received: by 2002:a17:90b:584f:b0:32e:23c9:6f41 with SMTP id
 98e67ed59e1d1-343bf0dd563mr21181a91.5.1762792858798; 
 Mon, 10 Nov 2025 08:40:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsAhzrL6dTTOmOA8ktM0ipxOyHiZ+nRx48w6MNOFL+Ma4SpEDRNwXEivWpIkv/T67KRQIZmQ==
X-Received: by 2002:a17:90b:584f:b0:32e:23c9:6f41 with SMTP id
 98e67ed59e1d1-343bf0dd563mr21137a91.5.1762792858269; 
 Mon, 10 Nov 2025 08:40:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:40:57 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:27 +0530
Subject: [PATCH v2 21/21] dt-bindings: arm-smmu: Add Glymur GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=866;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NgXP4H+ytjNcrx+o8ALLRhAZOLvOHraz88+cU8xEoFc=;
 b=P3JYEELDaQNqYHCNPT773ZPurLRY8irSH7D1ka8EbWy70v55a6s41XQrylNdFsIAiMGUQAHcM
 5oLMZZUY5xHBkdCRkIlYhXjOp0JiK+QgZQn+OMA4B0khnaxj4bei+c3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: riaD5ojmSA2iNLzTbNXhOKddx6EVSppi
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=69121816 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-Mh53b5kj-Vf1dIxLVYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MyBTYWx0ZWRfX1cTePm0AsVKA
 tsHH7tCW8PVS8VKZfKC/dumep9YmWQDFviWQ0pZq3gCltp3FsM7Gav0g5pQcB05wf9oGlGok+4s
 b/xgMHfSrf07cwuRgcYaBWQmNqsIi9uxNXtPHSVAAzhuxDrR0u0Ii3cyvqXQMQH9sOQAdd+rEhJ
 cel9IBvw9ybNgr7V+3w8HMO5n8n40Q5HgqPkW2n87pTmzGXU9cgoYdAD1GdG9r6t3EO8g4BtwLd
 MQqFFNOMLUSfVrZitfx04xj/mO/JE0o168iSzCkbx/XxMfvnSzNP2AYYjQjjjnVBpKfVCGj0l59
 +zzbBBtXDm2IpLBwxg3bHAGifmWOrYX2F3YJmkJeVHViekla/9oZx3hYMQJH7jdT7n61JZfCkZe
 QDIlhI+ipWiHmuAjdBVsHyZLBcJEXQ==
X-Proofpoint-GUID: riaD5ojmSA2iNLzTbNXhOKddx6EVSppi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100143
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

Update the devicetree bindings to support the gpu smmu present in
the Glymur chipset.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 14a9624e3819..cdbd23b5c08c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500

-- 
2.51.0


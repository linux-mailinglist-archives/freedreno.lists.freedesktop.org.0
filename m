Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9413EC5A990
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 00:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DD610E213;
	Thu, 13 Nov 2025 23:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fufrg+A/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCMwPps5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E17110E213
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMahIX1745227
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=; b=fufrg+A/xvLPXJTR
 4goiQlZWmQiZLlyKIyzu7A0PvvDEGbY5TrNXy5RWDaW7zCoGqbpArXEUNNDCn3U6
 QIuxR/9S3N83lS0SF4YCS0rFr7xVW4TNZjYVh0Ex9CyD5c+gPEuQvrYwOoGb3PMV
 BoSm46RZq6QHmWCBlwhUJpG4XgjBlfwXf/8RKMIhrzQ3mPEd41Lko8PUMpQTbgvH
 Yrhsdng5FjRaP0AY25++McgRwtTm0n+avl5/HMgqJ/pjZgSGFnYBrSHLos779594
 OQcPnKid5h4OHFznwLit4FekPz4EwG3ow9sRY9HrgWbVqGKeeqtvyW1MCXJ0q+MX
 nN+6UA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9eg46v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b969f3f5bb1so3131482a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 15:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076721; x=1763681521;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=;
 b=fCMwPps54K+TnTzzOt71udv4jii5Co6g77tPCsmycx9duKA4kDNd895c6wMf8WG6qq
 DlH4WAh+X/3vRi2XNIqeR5zFPWrvybDSfZB1GXQDdOfk3X4bZsWO0nB0MRgxwXMBz9eR
 B7wmvt7pYWPCfP2jXl0HROiLz1DQj5i7UvglBcNIM/ucKS1nufNzGvBGweJ6mWp/hTzb
 UpPyVC3MRCc93u6WrUFfDkSS3hJBSj5ePZvS7/xu0STZfFC7N/8f8eC5XyGqpSPPqWSe
 Fmizn0ueijl5c0UVTcqq1uYeDjD2/QnmOftsySKx5KcA9/TCtnYw7fsAQeBcww6uZOgP
 1sNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076721; x=1763681521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=;
 b=GH3dfitib57eVN74uXpclFq1aJpdJ9M5uui6OdgqvjAptVxm2Muw/lO89Ci4IowLEo
 HQF6/SSOVDNTAa6MxYatL1vfMWERJ2oisJR07KjlA6PH2LKOSlUk388fK71wqFRd/7+q
 TQt8XR4y0N+vu3tApV1Fb1ouw26vfqTOn82WHU2lzjZ3GBhSz9E4SIxIoNgyrHOLV7xJ
 zEeoj4DVm5vKCecoBnjap8d8VsHy7FepSnGxYrD4q1rPkhTNosNBnaOLUTrhx8KjmsJL
 uKGOARe+sY7BBnhYk5JxBO8CnJ4qOPL7oWKWWqGn81obtKU0YbIBh37ixLNrSm/NDtOF
 oSPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSPY5RUbLM16yvFKVdrJem9FDrGifP3DvJVw3aBsz5pOq8spUduX+q+DxuHVv1bYSir0NM6jxpy0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgYpdq3K4A3I9oFTXHblH+NwT5i3D1bXDsaEgbrBbSyJ8jmIab
 9PWnDN+rvD0GU9aAmYtlI/8U9T8fzppBCmTXpKE978ScoT2wJRrUIijtM7KEUlyJlTEpnPX8UVw
 izr0JuroXJzKshbdkxsMp2JwWFB4mjp8e4uoQDX5TB+gyp2sEAht2TD1RvSHhgxe8+ClZCcU=
X-Gm-Gg: ASbGncsmMpsDuWWQhE3pY8ZyCDV86lvN/q27zsfJwZCDNqlrMwgehdBQAZZuKlnXCQu
 gXr00nGSnkF5GRt6mUHGOYUDBr2kxwBtU1wFA+7M1kebwB2f5gQ/ls4FdI3gA1FezKbObx+N6zk
 LfjzXOkQCvVEbvFAtPWAqxmsGc3rEcb8woxi2Cufr2KbU7DKDAtNvwIrSANWQFY7ytIJ7PwdmNb
 eyOovz/wVLPxHF4IxO6BKU96wjMiDb4NiwXxryl3Cw92Dn3FYInak73ai24dHcqtTDuPI9NUTiP
 t3v1cff4x//N5fmKMI0RkxuXMURRKIMwk/OeUjq2dVzxgkxzHciIJJFWgliHUUpm4SpjtsNSyGp
 9Sa9gdZRLHFfg4WzLgjLMriU=
X-Received: by 2002:a05:6a21:6da1:b0:34e:a1b2:a35f with SMTP id
 adf61e73a8af0-35ba2692da8mr1640178637.53.1763076720930; 
 Thu, 13 Nov 2025 15:32:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX/aqiHfq+KfDFbcwSzPve/zFmwha2Yv2xlolDdxZkmw42sGuTr2PqLnQdgxCC3lptWEZ10w==
X-Received: by 2002:a05:6a21:6da1:b0:34e:a1b2:a35f with SMTP id
 adf61e73a8af0-35ba2692da8mr1640150637.53.1763076720415; 
 Thu, 13 Nov 2025 15:32:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:32:00 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:15 +0530
Subject: [PATCH v3 18/20] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=920;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+yhNHPe0JhwA+eOy4wzvzgK3jwdDA7lGVXF9GN6vVCw=;
 b=EVrIxsWJTSe1QIoktPi4f9hvpt+misNrn2q21fLyuIb1hcisO++zvNfpv7RIWnOz7RLMMksXA
 uKfR/4rWGFlBNoAJWn6V4gbbQ5DHcW/ZW+YYGwoh/JaM3aQxtDxxox5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX2qtk2D7L785o
 eqBY792qpVS82lukUMjeMh9xDA5nltz6fIObFtx65FzwNxvlThPowxKPq0EEI1INWWQ8hcWzZWA
 xe4qr54SPgEAyfy+seDebqXH0fDDZjaOXriIOPdj3y6+gTFLhSkO2YEkBWgXyLyKnX0VzE1xjZb
 BuS0hNwZ3yOS8Xs6NJpTLADsp3p6UXcEiriLtEg1HE0W6ZQbdQqlW8qgHrGz8koXh0X0hCg7ut4
 UBF9OHYrqts5gX1TpALN9OHPi+IdTH49Fryk/hqau+fCHfhsSe9SeNJ7xUkO1hHBGv0gD5TcVQV
 9Ok+YuEFmmLuUOj2QY52LsGqV4BnsntLLH3BnBTEqAQ4hYScrRpNEX2wK2y1sW8lOmGbP1vvVcH
 N9XO6UJHfq642l+RwSygS2qJmieImA==
X-Proofpoint-ORIG-GUID: FFHvJjdVPACFbl59DFrWVsZVpoO26gXJ
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69166a71 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nx9Ee08JJy_q_36Bb04A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: FFHvJjdVPACFbl59DFrWVsZVpoO26gXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185
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

Update the devicetree bindings to document the GPU SMMUs present in
Kaanapali and Glymur chipsets.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 59bbd20992c9..cdbd23b5c08c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,8 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

-- 
2.51.0


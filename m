Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C79C48097
	for <lists+freedreno@lfdr.de>; Mon, 10 Nov 2025 17:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5203B10E492;
	Mon, 10 Nov 2025 16:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkyHWAyJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HGShnuvp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA9610E492
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAFYN3M1813018
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=; b=BkyHWAyJEbEj1Kf7
 5qUO9kdpU6Q/9UbvpvsTyHJ39ZOeI2MRNpXnJaQUXsm5g9sVIg75ajCTwI3RChyC
 sYOfyBwNRjbFV+GiZo1TNoEuwP0pxYtPZk71L85dTL4NOoVD3eMf2kVsTkcsuoY/
 n+eZijX6DcMj+LmlINZaeDdMPdkFn3NocFqjGldaKuVSBKh5MgUsUU/UPnGS58Cj
 aSHqLKMdDner/Iu+JnY0wkKz6Q9Abb29pE2Sr5uXN0e6f0nQn+7q/M46YxpxBpBE
 0PXXJE86u8oR9CBACBe82+DgM3FM6YdDDx+MTRkL57pui6mYaevlv3g9v9gjctG0
 yLP97g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1jm4j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34378c914b4so2289006a91.1
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 08:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792835; x=1763397635;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=;
 b=HGShnuvpH1cCbnN72IGZxkmPAS6Q4oEbcYptroAB6dwjr0nF7LwfLQBLKU+tbSrqEj
 7Syc0WlpeuKEApQWWEEefN+7oZZvLkfwQ0z4EAHlp2zDqNDGQOAJHu2Z8L2x4w085enI
 uwrcR2IKn01vqN+Cdo7jF2K6r3mo+nXs9dFVVj9tnWt2nVp7mAYMkIZGbLoDuRR+Yw1X
 RoUcEcVJq7xFhddTadkN8FaifeKSqwVL0/YiUTeepgs6EMWvh3eU+P5seIRnJV8uHa98
 CBKVOqD6sY0NVOi3dActs8oo7y30vEtsP5gq6ZWhpKuJYFuRZnnxE/pAhb8pybpMnnNC
 dc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792835; x=1763397635;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=;
 b=AgB1FXoNhHecaiMpSqUaYZpNIRdspD2uGdJ+Q4hXItupfr7+JbAbjRNJrK1f3pr7mh
 SYZ2KafRuTHmRGEUz+qWbwe7NKk3+8bjO9buiAphNlGonSaYgxqZFRgCOw/NkeuTZiUY
 1b155HoBUi49ziSyPFN4kqkxiMk070MVpK/uybQBqlTUXbmz0Fxxl1yHvTSzbshdUChQ
 4G54iWDb7FTzfaEUjXBLAlqjOFRgdlf6NNMIteEMsyatf4UaGbccna1/tM3QBMmaemcm
 HpXhn7eoWTnzeT6enYIldgMAr7k4Nb7U+uRlhuUD4s+M4I/hZ1UjwH0XLqu2v2mh9KBU
 cUMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6JjxXO540NJl52ysJ12z+6WBg5T+D6pm/SJrKuPV2c60uAYrsfYelvPTSHqIQrbl4pAndZeYDIv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNZsgCEzEhW3Xvwpag8XJsMYvpl0wm7Y23gMFMyokitRlxA72T
 ghKbastX0FE88nRs2xRY17JhZ7DzEWcu387IBZvniZfSXeBA8mu+jPWJmUnmECy5F5/085xGzMx
 7+Um91F1Rm+wG3COsPpVnhctEuA3gp5I1xT3qD92lmtJP5CDJlcFGrxxHFWho/JZrmIbA7j8=
X-Gm-Gg: ASbGncuKeDTRazy3zqTLNDtBu1GQSjg/73Lspxf2Lcuvw+x4Cx4+QOQUCUFMFGVr583
 nxOrOujqb2dsbFLPsePZe+k/RhpIRrUzz6psvbkP3sz97fGjFTQRnTeB7l4Dv5Cx54vEYhbis5B
 EJGwywZNQ5XFPZy8Y5Dk0XhtVtGFXbq/rwrdshUQHyTaBoLoagr7sJrD3YYTYK1RMKq/Nfk9U/J
 7cFXTP2UAZfvelZtERJV+nuHbaNvVtslitWK9xwuXv1js4AuI7yreB2kOtrWYp8/3HJID307bwJ
 1L6QpqjLhd4HWv4BQhYcSKw2xf5XM56wgLKVRIo2CDFbUjEHEXQTTtJbg1SL/Jr10GJFxwTdlke
 dcRFKxyFJEQDSKVxpyAVTruY=
X-Received: by 2002:a17:90a:7786:b0:343:87b1:27a with SMTP id
 98e67ed59e1d1-34387b10381mr5172087a91.10.1762792835079; 
 Mon, 10 Nov 2025 08:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWFnJwABxwEcbzLA4NNn8jcaHApPxbRaToXFtfQE+N3nOzqp3Zff9UTtgGElCKztEpfLbq5A==
X-Received: by 2002:a17:90a:7786:b0:343:87b1:27a with SMTP id
 98e67ed59e1d1-34387b10381mr5172042a91.10.1762792834452; 
 Mon, 10 Nov 2025 08:40:34 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:40:34 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:24 +0530
Subject: [PATCH v2 18/21] dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-18-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=916;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G2l2DvQ06Sbowus5yA4dZFnVkOMl0ih94brxKuiwNUI=;
 b=i58PaWIJhvP983kaIcMBq4mEfOd2Dd/WK27M8EkgEPM8e2wRt8CP0MDcNjfuquTO36mYLtIal
 +hsVHf9IYi5DvmUiLKDu5icK9arFAWOyRczHm6SeqUfsEgpnR1BfIU8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX6m9KS3NDfUvk
 16XMB7ZN8sLuOtstY0TUo/JbMc+ObwMW9in1WS3wHvckzStR7zIwxaaHl2j6UWc3hBHEysdf57R
 FcHxCJGZ/nnHi4Xsq/8UVDb4kp00zxmX815A7E8FUQpSi0kjUZy0dZQjlK8KrtrtUtfXJ2n8Gak
 WuHlOY9UXDlhS4jHUNRdwJliCzvGG2WD0RTmtbguvnKjM9r7B/AbTpb+CpIFPniADQGS10xXSy0
 UxXbDzsGvtMwnJcKSoyKzRH7fMvlqQ/9luBB2dJhYAWKaXqtVFM/RaV8lNNlsI2Hcz+YPK7CS+L
 kNalqJzwKDdrpVk4NrFg71eC5mAFbgYzYgQt9oV15ltrpxfURM+7yI4Z2Aw3g/5A6P2TP19NiGB
 tiQrrf1ElMngz58ELuwEd/Sbnaewfg==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=69121583 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mFHhPm7ftKKhVARBLukA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: L-GTWiKMAj2EqHuu_SbXS1GinyYSNiV8
X-Proofpoint-GUID: L-GTWiKMAj2EqHuu_SbXS1GinyYSNiV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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
the Kaanapali chipset.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 59bbd20992c9..14a9624e3819 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

-- 
2.51.0


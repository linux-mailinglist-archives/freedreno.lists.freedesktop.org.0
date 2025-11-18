Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F6EC6853D
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 09:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C907010E466;
	Tue, 18 Nov 2025 08:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkM0/TTx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ged1UiZT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E53010E466
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI2iUav375669
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=; b=LkM0/TTxA6iBg2bp
 caqvCVp4AjAO+m5Yu2BZAMmr8BO7QlZoBeEw+Hflflo3pG/0iBP8C5s7vXjiKk/J
 R1bCYLuvJ+V0DganVweVFB1qcAgnVXA9Pwdxx0yCBQ910NYtuU8EC/84LxjkRDqf
 Tp+xO9z2tVUlzVQnxkTCQPKpHDSOxn9VWHG51GYoEgNO9qWgcrEQ4WBccmf4G549
 78m6z0UOZQMO8T8JtxWZ3PW3bBT7NFb8bITNhHSxJZcKoqCjbauPNME+rgRUF8Hx
 ktK3Q+oRU6eDq/rReA3pk/NEMoIPjmI/Nb56Hr3LnPAy7Rx/o0jKpVmuwJjiNigZ
 QCoHig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njfyk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297dde580c8so178190465ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 00:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763456025; x=1764060825;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=;
 b=ged1UiZTX/rBVcEmJTcdfoMlK/t1cWX75fWRaMR/pZS0xfEY3SJ0AchzTvyneuPbG9
 7HFFxdKvaXcN4I9+cFtiFth5otMR9rb37HYTqXnCajjESg4OrwWnMNcxz285pMq0kQWR
 vaUlhtC+RMKNKIYZ8ti+/nOl9yR5E+NhnEuozZGYqHHqtbqiIbI9+MmSmQ6ctTorMQqh
 /FSWqmjgqpuLLRQ7J66Wh57YXcY3W4DhqJV6p/cm+geWqbKL5mhVNuzoEBZ3kZgnw6+Q
 qrT4K7uJR/PEngeLlMsDgUAWvcedpG9igsudG8s7kGheTB7e6n4wF77W5dCL8ZZ3VD5y
 BQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763456025; x=1764060825;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=;
 b=LMr8tDOFqX8iOYXFrI2xdQGZXOx0C3y0OcuaUMqTG1CWnE7cZrf87UMIAYW3BMPFR5
 iL/616vK3a+cLBNmHD9IsuMph4oGK2aWjvkOFXIzdjmmYu452I3IWw78YlRXaCPcvmER
 6Ys+mDxxAga7y64ntdPCY5KFIEPhj7NgcBJRPHD0n1kfdYkQftU7luR5U0rGvXsYfDRo
 9NKMwF3HxT13J1fVKi8I9rVvHn7E4jxbVryx/IQ/m1mlPs4QOAKKFzjuCezR9KtCLjzw
 mO5DtHuEqgZCfnNz2GGf5czuOZOHdC4BzZAGMKBsUP6ZB5/gQePqBEwPBvUfC6Q3WwrL
 VaLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcWJNhqftbqHRH3iU3wEoFLxqKUGp0yoL0yFmrqT5jXXeVg8KyhX7+AZiHr4J+OwQxpOCbBMSs8q0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZwDBrLtN2Vfw4UFt4n38uYblykpH+pSxaGDVNYyQUS4QmytEa
 gAkKxw0IKrgTRPibasDW3FqxPvTOCKY7G6iBPQuNSA4FgoML65AZ8CcKXdYZZRFoq5l7HPHbsbd
 x03FBt9JzUB/3ar6V1pBiiCDtQLd8cwrFyjduCcfqAGWNABdFxdKScg/ZfiQNDKTYTZbsY40=
X-Gm-Gg: ASbGnctijzO9nM48hKH6AcGmvNylgJWPgb74SI9xcoliQCfJeARqoidlSol6g25p60D
 AZ/ow6P6ivjIhtohhMvSeeQuBSBDxSrnf9zod9nndY3S+vf8IWSLvNSne9JRaaAdSgZEjLj+A+w
 oDenTWJtBwoBLOZVWpFFl0UMK9QxSGjAQpHD2/TGZkbPfAq9WjCE+FE8LT53/nkCWbmByVEsNMt
 BSVgAbIw22UvdUFp2hEyq/njkXpGyL/KGjodGqFgn48HKtWZbkBgwqFURWztqlrvnzoIrJ2ssOW
 ETbhShtLbZZAjaV4sC90lFISIMfFkx/FSmEwpLzVATeg07YmWojZa4nZMUoDjbHyV460ggY2FRc
 iEsQeE2g9q6ZV94Oub5OF4VI=
X-Received: by 2002:a17:902:e84c:b0:295:9e4e:4092 with SMTP id
 d9443c01a7336-2986a76b624mr185293585ad.56.1763456025379; 
 Tue, 18 Nov 2025 00:53:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJLx55VIEQR1X1kdhaTupHT64CD5j1PJ74J97Jx8OWItPIbJf1c2CruPdv9q63aQsbVJdMRA==
X-Received: by 2002:a17:902:e84c:b0:295:9e4e:4092 with SMTP id
 d9443c01a7336-2986a76b624mr185293105ad.56.1763456024830; 
 Tue, 18 Nov 2025 00:53:44 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:53:44 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:46 +0530
Subject: [PATCH v4 19/22] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-19-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=984;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=b8dhLGeLQCmbMQGCYbMJAVhuNtUDEylRDp1y1629j4w=;
 b=jOmgC3U/mxErhlMr4MADnr67IrIUEIl8TZO8WCrxFy8KxEMIAkZL3bL9elKhtgNJKsYb8oNbp
 LrlluiY4THhC/9gW3BN/csHmcffGEBaqOL6sP0AXVDDO4ygLkT1IjBr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXxgoc3cgsLp9Y
 Av6O3HWjg/wAk8gS7J65cwfFzBXclp/1WQDmbNw0pnbQnmPR9JRc24HS5ts1jjE5naMdpz1tniC
 sLyjy69bNnoU2t4l05wABbtRC2VG0ff0ZHjgg1qbYQ20mWqB4rXQQfLKmyRGfF0/BCGcsSQCDRI
 WtGFIKhRcQwYAIWTGN73EA5/DYNqj4+r0u4l1z4Hw4wEPLzwWVMMJknsDd5+6jcDoiboA0ZC8yk
 IVxazIcb863XHALbneKAFYakDCpjb5MreJ3YtRtGtVXpVoICHRnVQqO+Ct2G7f72Z7ehIb40yfN
 k89qLPTP7XEthyfmzW/9vovhuGtEJyK1jzs79HRhsK2/BkDnhl/tKruUczG8yt26k/6ZLkibmMw
 qSkPEgBS8vKufOeY/VWOmHcQ2aDzKA==
X-Proofpoint-GUID: ABUI4NifUYyGFkMJVSU-g8ssL5KQVUOp
X-Proofpoint-ORIG-GUID: ABUI4NifUYyGFkMJVSU-g8ssL5KQVUOp
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c341a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nx9Ee08JJy_q_36Bb04A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 89495f094d52..c9efdd1a6d1c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -89,6 +89,8 @@ properties:
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


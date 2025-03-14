Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FF1A61153
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 13:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063AD10E371;
	Fri, 14 Mar 2025 12:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjnzSZ01";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9771210E963
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DHJV4r021900
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2dtqbcPgqz2zJYzOOCZPN2LLL9rO3nXwWq5S6LuNoqs=; b=pjnzSZ01vk/TMjkF
 Bm2kG5fPbjGNKWfuZwPSAbfcmAHrtgXJC8vfAl+4v4E7qsrII3VA35fee6Xr/3W+
 kY6Cam63IQKDpadwnzTKWLq7gJCLFSi63fcFIDbPYHXIQkg8rIilM/l0deEQQ58G
 54LOoUQaBe086FsiQyZRFJrqeMQGhkLPFXkI+/5YswfBuRkV5AbOGw8Goynar0bq
 B3mGDi1N0+NLkKP0jJm7JEmBeleU0Ep5YnJuJcBRCccNZJ+9sVqcElktkG2mdioq
 BtMFFblM4Xn8tnCjuxliFZK0ztAmsYlUOAIPoXqU2s7mfBY6CFtXhPnjjWn2J0Fg
 IoCqbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07k6x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4767348e239so38245181cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Mar 2025 23:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932571; x=1742537371;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dtqbcPgqz2zJYzOOCZPN2LLL9rO3nXwWq5S6LuNoqs=;
 b=CCopEa+KT1/nRoPhTiGhYGHYQnT8FNbklMFEFUCXNTtY4ZwfjCAY31VUKVQwVMyDvf
 ruPSjR1cevKBOcR+1M526ofYDxOgkXO77PQt6Xxykpr3L+kYIJj+lj0Ts4G/H2Wv4sG7
 tJDhkipOyW1ObH/8v4BjDGIVl7hNqJZxP1x/j/nZKNj9BF3lXRgK/an6PrdvmUvL8UVw
 Vm2sh+Y8+u6igFEusKZ1nUjJHeyJiJV63Wo/iKLrx8cTpTVPjEs4eZR/PY+hdUfZo+Md
 +AeQrsM9uovKazJWQ8s5TwZpcejMOmq/NKyXdcxGX2H8yfidOIDXKdPRVUsIKmsR7LmM
 LwAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ5uvX3O4mpjZ/eMassWC5AFym/LiinLHDFaWDJvokLArTiY223z7AELAjqROpd3CdR8AfhBxlHIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQbgICBCmx3PuwO01kwB0+po/Y+HeRo1X24uGEwPIH7PdhAfKA
 qwsrm157FFnFP+VwHnQiGXfluct6BrHA4vzzCSvf1eDHGJCo8GONLPmoFXS1KFYq1s6xZk25/rT
 7YelwC6AQs7qI8VRiCqwL0fTcaqBMnhopWBCuORtFtG0b0sS0sSt6pIUC1Md3vk98NoI=
X-Gm-Gg: ASbGncu9bLziiwvCUowX8U3nOuEac5+qJG2aylSv2TNNACmIy/iQ4vbmEKRhT0zx24Z
 IZAW8Q/YDvzmbOEwlVMp6qKGMysxujCJKb5RTlCjMq4ECcOGQU0vjpg7eOihLlYYVcLF+RFV0/6
 fOUgC7UB04ftLy3nTcsh4Q418yDcJ2fm5U37hIGOuvu0VG1E96bmKvOWBnzPUHIB9wPS2trBcCp
 lwIzYcREi9SO9FGNNimOHB0XIVTYD3i9phjg9XSgFbWCLY1FUuuTooHL0tlUpuWfCBdNW3y39O5
 NATvyGbnJ26bTN9V1ABHrUNiwbvuBF04BTsMtFXJ91P9k27jAxJqXe/TCkkMC9wmotmMoFTbmvT
 YG1YNP1XvUx4lpyIdnYMxsyR4+5Vf
X-Received: by 2002:ac8:5954:0:b0:472:bbb:1bab with SMTP id
 d75a77b69052e-476c8145813mr17081391cf.24.1741932570854; 
 Thu, 13 Mar 2025 23:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH260pJeUc22MhT6rD0bio6WhMorUYYNuiZnT9Z2ORqDCJ/y51ul3PorQ3OfzBE81hTKSadBQ==
X-Received: by 2002:ac8:5954:0:b0:472:bbb:1bab with SMTP id
 d75a77b69052e-476c8145813mr17081101cf.24.1741932570528; 
 Thu, 13 Mar 2025 23:09:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:09:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:08 +0200
Subject: [PATCH v2 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-4-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08gGqFLhwkIP78GCaN5+I3f8E6dKF01pKeTbK
 il1RzKvccSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PIBgAKCRCLPIo+Aiko
 1aOBB/95nl6CSCnSesI/x7l9g5ItoVw6gz9ZJfbqmsmz6EcNq5HU8Ah6zuEeWEZ9FZkuXTdwPpO
 3hSVf8iWngNgvtNYrWtzPvuL0kgvBxCknVGi7UGTODVP7wQdiMkGHuprgttGOuwUtuTQdnaVEox
 c725Qy1jsZFc/vrHwENUmVlPY9jEy8FLVUL15nIf3jfJs3nPieKZZ14CS5rSRj1tNl87Z28Ptui
 OGGmqQ0dUvTPpXc+BDtYROhVwf6Cn1SXpHICVciEGCgHV4acRGq3hRiMReJ8mBVcLh9+JNxf2MZ
 K1QGuFu/x9v2lJUmKK/SyVegMWoWSraUm7U8wWAt/ZXzlcvS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: RVlntXqubIA8JDL5F-piiDV3RLejZ1y2
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d3c81b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9 a=QEXdDO2ut3YA:10
 a=eRSyEd_ZPWdY3HzJaUvg:22
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RVlntXqubIA8JDL5F-piiDV3RLejZ1y2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=928
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
X-Mailman-Approved-At: Fri, 14 Mar 2025 12:33:27 +0000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5


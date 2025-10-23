Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18084C014D7
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572AA10E908;
	Thu, 23 Oct 2025 13:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGD9BSUY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035C010E8C9
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6RP5x016169
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=8KBOd7N1OKL
 iYG+vESUSEumwgDK1Wzblv22t5BjCkZE=; b=OGD9BSUYkdsHfq3VHtFPabJsc9u
 UYlYcsPlkTqGGK2S8wI86fHNHN0RWetH1lYN2CCaDD/vghhdvjPgM47OvXWb/J7k
 7KX0Qx6WqENpeRCM9oqr+nqLOx48jjfd1lHV3lW6GYgwJmgoqaUoj1DGWwoBBzPj
 ggFWdvhWe9/41nl317bUTeciWMppkFRv/pkJ59g0lq3mcaAh5164P12yo0xkti/7
 TJKOe5jme+mSTa2fmNlXTqVXqB5FAQU+b4aluaiKD61gtj4T0aDVr5g5CsXGkrz9
 iqSJABmxx2BAj03e08XTQY70W8mAOED/8CcFXWNIEShH3ryXWRJRB911peg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsd5p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7810e5a22f3so1317018b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206859; x=1761811659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KBOd7N1OKLiYG+vESUSEumwgDK1Wzblv22t5BjCkZE=;
 b=qB64vdPsIHNNb6UY92sLGAUFG9T+9cyQkvcPAswVYH2yJV+ERhlErueLwlISKSFHWU
 pZgmfHG74QZwr3yFflZQXTYY19Rlt3LzgIHGtpdCtyyg34Le479E8ISDV+u4msqHIYt8
 4i9dOH9FCQm9NonrhLJxgEZrpbSFBbRLhyT00hWWJBa3+2oVSv896l3DkO65vUoCc6Iq
 YMly+ZLvPm6uOAUDlzZxHGZWJBDftsv9iovbbNZzf2wM9SPUofqSTMDiH4ZNCV6QwGS7
 q5tIRB34JIdSoXMJhqUvKqSa6Yehr6GNlM679MxfLz63EZF36AoSvzc3px86hFlHtaFK
 exbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsWf/7vG2gUhGU1zboiwkl/gH/obDY3/A98NYdRoFBI8AKyUXqczpPuVNqQpH8UYFEjqNb5hCfRmA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5cBbXs8w6O8fpTurfnSI12owxOmpeXVmpOAjFD+MsBs630KNI
 TwQA5PeUQfLMT9fqoeQQ0ZQOdIh9PLErFt9IE1MuFGwgsnik93Uw7HkcByQyn0btvjyaUw80SGH
 fvXpMST1N97I8G2UpADdepjDc+xIzZSLR0gUAwTH0wWI7Tzl6Zij7yj6vAPEKwjMD5WJz2YI=
X-Gm-Gg: ASbGncvPyuwsKJ0Lmue0EKy+NxohOcxOQ5NdQanl1T2m0Qqn+xbwhA4j0YUFnnxa+oR
 rOMPza82303v6H/vdrhbD3tLpPaXRaOd/VoQ1CzZOrOlvoQwCXNxI8PtZXZLwFm3v0gu7L16eel
 D21EiioRMC3ojjh3oXDmnPUJOZgQ6UO482wWgpvYQDrrZ/3JiKrnL4tlKAx+P1g1q8lW72CRJFr
 RFRp3tKv5t8S/pQJZozRgKvDSUcD9rICEeHJ0yu/DaRWdr6UAOOs1U357rMXFIkKQVSrQFbH+3o
 1qilk5Y+mg0tHJ2f5L2Y3OO/4bE3PEji61OyAQx0zNQFN/ZXGPiOavW3LHNhn7j+LXsPU2dAU6V
 96/56X3cvwWhlY9IugD5xoh6tVrXqaq013MgxcCyfBCWKncU3ew==
X-Received: by 2002:a05:6a00:2ea3:b0:7a2:7b5f:4ce0 with SMTP id
 d2e1a72fcca58-7a27b5f4ed8mr378353b3a.28.1761206858627; 
 Thu, 23 Oct 2025 01:07:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjN7fa3hxvdx44/dyiL/lnUELFXzcTVbvL2kEGiyf6x7H5jfmpkQeVPZyeTMdgcZNq0ouTxA==
X-Received: by 2002:a05:6a00:2ea3:b0:7a2:7b5f:4ce0 with SMTP id
 d2e1a72fcca58-7a27b5f4ed8mr378317b3a.28.1761206858186; 
 Thu, 23 Oct 2025 01:07:38 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:37 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSi PHY
Date: Thu, 23 Oct 2025 16:06:07 +0800
Message-Id: <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX+weTsVcwKcEN
 Pf3IdvkZXy0XK3INQB4yPIynFCtv7P5J2SoZ572oTU0OnJt6AMc3qjxmu1kQqd6E2zRQ9VaHR1M
 s0pn/8Mt0cMgAFF9Tjznq+xw5yqsPU3Ax1D0CCyBfiv/vcpaPlBXl9qGX6+moT9k4ZSlvbFXpZz
 NR/XzBISmF+s+v3UFVUJM11lcoHgZSYQb/25A1jixLmPvEITPf1fZE3AwzKMAjFAZT8W9mwTh0e
 sqZKdl60fzUgEz3l8cBiWNMOezOhbW5cE+vsV9EFF99ybaqhnqUOvT/WGTclRE/kqKFhC8fcWdA
 0lITpwafzsZpW4rRCmixwSu1csm7C4cLmsJRAmREZ/9/85snw8OP7N8l2XRKV2NUO/gwuib9U8L
 Z0h7cw2vdNMn99kDEIgZEanfJNe2eQ==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9e24b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=tNVMJPnUsVqa3Ada0T4A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: GdAG6PYA0_0JsVSoOdNkzowW0nNI6ZCT
X-Proofpoint-ORIG-GUID: GdAG6PYA0_0JsVSoOdNkzowW0nNI6ZCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

Add DSI PHY for Kaanapali.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..a6e044eed3df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,kaanapali-dsi-phy-3nm
       - qcom,sa8775p-dsi-phy-5nm
       - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1


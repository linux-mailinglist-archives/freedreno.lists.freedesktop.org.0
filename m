Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBE3B281C1
	for <lists+freedreno@lfdr.de>; Fri, 15 Aug 2025 16:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D96D10E972;
	Fri, 15 Aug 2025 14:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkuVGHKi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAED10E972
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIkKY019986
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p0Dga2ququ/iz0C7Gew/O16VrwuI8lG9clwmw5naUV8=; b=CkuVGHKijQzWfx5R
 OhtRYg8n8j7M+YBvnJkBGk/dA9m1ZY8m0wTtl3B4Y2uWCdo5QE8uhwLa4y6sZ5ZS
 B6Idoi7x0KRLt0FNqhKPsyozkAbv2qmkF1XWXUH1Eg3y8hTe7wzvJt9Uo/zpBfNd
 OmWE3tnewWd5nvxZREv1OPM9MPggCxCaG8kr+i9n2C/6ki9Y6hLa0j5297GTsVlz
 jDZSXCQPb4v9nCAtwiCT4FB9MeS7PEFFRzFKr1LMFeLnkU4uDVe52J9z2zNsuByV
 KM4vjkoMxtS/UrzPOP685W0Yf4qQOeB1gGFDn1KGnsiGvXkH/n4rDbQuRHSI2jDU
 rUQO1Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gk64u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a92827a70so43317566d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 07:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268242; x=1755873042;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0Dga2ququ/iz0C7Gew/O16VrwuI8lG9clwmw5naUV8=;
 b=TzV2Z5jET5T7N8TSdBUmMb+ouge4iO8F4lAphx7G5kHf3eV6NXNdNP/lBpIH8l3+Fm
 qa6rA5cgW58wjVipdslA/4vLInUYpH7K0m/UCqHtEMw0ELJClCtjSCOgI26HQneWRN7k
 3vT3DmJsQzSH72/qNSIyk7fO+DivrKdDSiT5UsIHAGKBaD3eThgcU7jrizPZu5qWtV8m
 mqRICNBCIQSI/9Fg74RNJtHmie4wS6R0gxfK9Px6IbjZZ2y84hirBHDe1JDXAVoyuIbM
 D5Ov7HE9d3Q80ccwxcsmXBw3af+88Ba1Q8qlG0ehebgzG2gVnpNNYauxQ/mIGuxVGw8G
 Qs0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ1JPE2lVGhSCSjCY6q1UZb2WFEgkAbrfuZnmVvy26B19SEMzz9sFUJKfaYAZDIliAORZ/Ju265b4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPK1lU5j0yVH4Ml5Su5cd+abiUwKwmm4Xvv384unGaRkoWlwW2
 ZYbvJopCysaOvib3ANzP7GMPoS6IxlUuQpl/1fpUcyegxdrYL94v/15q7yIvXpt8oRHDFqofRY9
 j156DTuSG7kNWdNOgodpMerWMSOvxUWJHqkS/9+hIPZWy72HFXyzt/Z338TKb5qxTw8NocbU=
X-Gm-Gg: ASbGncuXv3SWplZJeGt6oRVttu39BamZDC4WLD3nHTkqVu9wsV9D2dY9xDZ6yhFJ5R4
 hMZY/CKGzZnieUA3tuO6eavsT6QIx608U44BNS/enVTS/6zGRR9ksoRHs7FoeD0O89wDtDLxmSK
 0Rrwj8UGnAmxxpNy1/JstRHAVfK6lKFYkg6LvZ/oalMtgMHPv8f7KfiVhDcV+SLgTtiX7osBVGL
 X6DR8zora1Ua2dz//DGCzMIbMnqykjxjDFWf8MRX6RYXbR4oRYfqR/MAvf60Pt0PWEAkLxDv6eI
 Hk/E2fYQB96N3SXu8E1BYNDWrE62JuNV4eIKAeUW/RauFHlOJFGoglxbTLZ2E60w3x8qxqJBfM2
 BW1irQshgsdf7rwdMv7GehjebatYFiSBBFkFBtIIymw1gcwSb7BxH
X-Received: by 2002:ad4:596b:0:b0:70b:9a85:2cad with SMTP id
 6a1803df08f44-70ba7c18289mr25048776d6.24.1755268241385; 
 Fri, 15 Aug 2025 07:30:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbsP3wUZjJKRwWIURXbOZAQ20XVRCrWirWqOKB0kfzOToUE9mXBEuKx41mGrXm/2dIDmhmNQ==
X-Received: by 2002:ad4:596b:0:b0:70b:9a85:2cad with SMTP id
 6a1803df08f44-70ba7c18289mr25047686d6.24.1755268240622; 
 Fri, 15 Aug 2025 07:30:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:30 +0300
Subject: [PATCH v6 3/6] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-3-e715bbbb5386@oss.qualcomm.com>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
In-Reply-To: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kzfz4h3GQy4csg0TV4VQd6f6s6q0jIGQMAOr/+KricQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SHNIR9djh0MjZ1tAnVRLTcBlTqr7v2pS+fV
 i55+ZtmNFiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1Yz2B/90KDCp05bcxoSE/R5Ptv0P1HM2cMyhnRTNSqf61aZa+Zg0T41QAwIA/s2ruhs1y/91atp
 SSJdoRo4oKpt0xbspUUvsUhu/Bi5d9Y2GtFcY01iOda3UGCVagrzaTyrl9qgw+KMqQYmAX6/QyY
 FWzB2oEllczxtuqa7SF96SqhD7MRUZ4IHXgZpMJsHql5d67w4idjtto0Q/x74OFAu/SaF+EZhiN
 1D/Pma4X/LHFqFde2Aubk7T00ovQH4hbOlwyNa1XQA2SQ/aFlUWtax6F6Wa4R9X1gO5kFOaWuU/
 e4Hm496V3GKBtyX6Ha6kelAiIIfycSCxXblTDJ/gVwLixQGZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689f4495 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LXTjkAqqvG_e-hvHT3MA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX+O6vLZmCQbmI
 2/qQurbv5RxQHyfYrWGvfExGio/NsHlO7VSCbSUNqiWRb8vK2JpMjH8gY+RVFH8OkRY6iJ1yBl0
 cqT7vIHjEPw9zacGSA24VNG4uSZfFcqvNeSqOvVxymapHRyDG1Gcg0zHdQzFXNUlB/9pyr1HlVL
 o30ALYh2CBSR0uFra11c624cZB+cJfyhUZW+6W//O3d9Xq+6XybblJCUQWIDj6gOI4DqvVKZcy4
 yoTH3rsaia+7M8bdRRN56pHwAuOEPn4ZrnnO2+rg8EsQ/sN60Yo5Pxz8ZA0oONxFN6Y0xVMu9ux
 4x4eJE0Bhu7F5ClJfzg54XdZdeA/BnGedjvXeYwVEQwjedp+YW19al7PPdquqcUa3GTdJU3QEf7
 AtX++EQa
X-Proofpoint-GUID: nc5YSHRZhma9-m1jTqRRc2m-oM5cd5ad
X-Proofpoint-ORIG-GUID: nc5YSHRZhma9-m1jTqRRc2m-oM5cd5ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..55e37ec74591af0a1329598f6059475926fdd64e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
@@ -180,6 +182,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.47.2


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E1B3ADB6
	for <lists+freedreno@lfdr.de>; Fri, 29 Aug 2025 00:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9611B10EAFA;
	Thu, 28 Aug 2025 22:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="le3Qqzw6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C48D10EAFB
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWblD013485
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=; b=le3Qqzw6Iyxa5OJ7
 5zzXr+FUuD+2gpmpPmYeU57Jyx/emIulnMXElkDcFILTX48wtzjEEAVggMoacYui
 4ZczuQ1A7uNRL/V3ztS5p4Z83BsIXznjHB3PXBqyDuyeR0VW468bvJffl7Bkqy1a
 sYJiG3HvdV/RjoxAHUKcSvXuIMLWje8cQFTtDZlWAS9t8X2rhKTj2k7HgTbMKUDX
 QFuGGdG9JSkNE+Mu8Of+tbkydk+L/lSQj3MJz4+4rrBrovw9kki14zdKKQZdpuxz
 eapPCCua+GAuUhX2bZ5fhLfmnmQ7DS0ISZb2zyQJhg2n4Mu463j4ZaQRzShN0Qim
 wHhSUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5ssr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109ab2cbaso30328441cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421309; x=1757026109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=;
 b=o8/JHyZXnghNn+HwKVurms8H6EJOaoCCbyBO/iM+YzCEqUtVS3GucueF6n9FWaXHsY
 VtywE9gaywkSJzqbMAGdnnTKB4+eqDBK/fnGKIZPh+ajFvYnGcb/VoFmsD7ooewRLQEL
 eyXWI3ZvV+UTrr45atZnN6vMoqSww8CnoS6i//L3ZQQwszVJAELnHivrVjXux/vwfnci
 g432gxsyJwZgisEjUKBtFZUYBlpW6YvmUvjro4w9jhMjlWY61ceYnJkhM40NNRRs+7km
 X3j8+4fUTVTMSdBw3aB7T2iABKDdp1PDi44QHeWCJmK0oI+lMZ9SXK23DFj3uV/R9Bhp
 WVnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGaxphv2NUL2rXro33xj5BELRislVnSDyTQmNzYeDbbP44IDIS8mx1vHBdHcp2YS24XdzASpYRkng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHqEQYOf4XLaIl34saREEQk664uB53yMPcxIcYASqXHogCNADN
 ZoOAh9e+kp4lliQq1kGoa3LEA/C4apI9xp+sCX9N4fgEzck7Uf1wvjW25RfTch7bxiEqykAO5Mq
 9iPQofGCsSgJoqXuBZks5tiDWhrULb5g9ukRKhLHMRaf3LtF6K6Qto3r0ibR3j41xFb76m1XLFt
 nPiEE=
X-Gm-Gg: ASbGncvYrXSB+PWEFl139JuofzFqselXVoQpe5jtvAosIlPcYaHocUKl/yz4qgvAgGP
 y6k4A27umiaCe3RWRGQ3Wgf6vFzNaPZ1mMAlqIcKtIT/cm6p7kt2jzYZB/Q7ZMMwdPaTvsnZTT/
 DUHoGiUfJeoUsNRY1pbrQ03X7fRyMiMawllrq5uwqt/VUWHxg5A3dP12nUfv6+CBLu1ZiimxK6y
 Hkv4gE4elZtznEhwmAeRzPRsQofeyhJh1hSf3HU4uJYaV5Ul4lqyAdm2igH2hhDLBdOS7ehH1Yq
 hhKJpvNAellwUet4TIW6SVqhC2a5dgeLSbwXbc5OFfRnjaXrQ9ysccW2cvZrzO1mS8gyQmnUfBc
 TPbDHVc4tnSdHLt/UqHA87yCRbMgOkRKHYmgH2BacoXxl+LoBfOnf
X-Received: by 2002:ac8:5d0b:0:b0:4b3:c70:6b91 with SMTP id
 d75a77b69052e-4b30c707d9emr9878561cf.1.1756421309418; 
 Thu, 28 Aug 2025 15:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVn7LUU1wLuo48uIzVLIpSmBydS8V9QqNajZ72cj6g6Z/G/PcNUWq2BIQBuVAWtOfCSAhapQ==
X-Received: by 2002:ac8:5d0b:0:b0:4b3:c70:6b91 with SMTP id
 d75a77b69052e-4b30c707d9emr9878291cf.1.1756421308958; 
 Thu, 28 Aug 2025 15:48:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:18 +0300
Subject: [PATCH v7 5/9] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-5-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UnKbj8oV/I2z2dmxNHPVYZHaNtQSEhlpqnpLKeNGplU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8aGOxsmRflPs+cW9GrS5XbfvoS5da7xw0KR6e0h/jsST
 njGJ8ztZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBFotj/V7yVaur4HN4oPv34
 9P1rrt9L/15X6CkQc35Oetpqvmeln7kYAsz4D187wRr+17/Z+93eLy4np+y4/v3wfPMDZTdivaa
 wHrT2VjJ63Lp5guKUI1UPiq9n96eHfH8snVm065n+Xp5NC5oyzs88qpPLx1EVVxHNX63Dsfjbau
 Gl6rMv5Ya17zhSqSp7/LF1hxwzC+ORoHa5u1vOnY91dnfQfCCyyiPv4P6oJS3Pkxy5X6z+Lv3XL
 /FMea9mXX6N/ZnQ9TqqU/a96JE6pPH617s/1dEGk1f/XHlwgQtzerdRooKGjYzyrKrHp/tP+CTG
 3V7dbHDa0VXmsPrSFu+fz2L2uZ3Yv3hWUQv/stZmN85vAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX45PRNvAETQSj
 2A/djEFCe1pwA9yz6HHkAWMT4/RY5a/vRub8ydvp4t5qhFbXUYL02VtTT1Xb7ZpR8p/TbODb6je
 Tda9OJl+dsG3fmRVzu9nczYf+AdvpqgehPdZXIuRIWJatoBdbwQHddbI+YBXtLiSbt1dPImlB98
 Lk/0FxeX742zuGI9k4RyBYsz77+Qj0BWBynMiRpuXPFAy4m8cUCAex0fR9JD/M3sijE6FbZrzZv
 V8DZPGMIBwe1D/bQ2EVKkOMSevysCKE7PkDZEUjUj4/jIgoQWjGwvmaLPV1Tw1vWUfVMGRsj8qe
 a6TuzSDy3tU0pmhXPHzwkTp2PrzzMrd9iVoVLVo7W5QArrRavJyYgeBO3jmTOiGcyf9yBpZ0h+F
 jaJrFWzE
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b0dcbe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LXTjkAqqvG_e-hvHT3MA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cBMq33ZgyvPx-pYHJbauWS3L-vpWkj1R
X-Proofpoint-ORIG-GUID: cBMq33ZgyvPx-pYHJbauWS3L-vpWkj1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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
index a18183f7ec21ac0d09fecb86e8e77e3e4fffec12..6316c929fd66588b83d3abaf01d83a6b49b35e80 100644
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
               - qcom,sm6350-dp
@@ -193,6 +195,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.47.2


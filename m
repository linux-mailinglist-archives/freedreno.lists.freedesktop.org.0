Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15D5A3F5D
	for <lists+freedreno@lfdr.de>; Sun, 28 Aug 2022 21:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A163510EFCE;
	Sun, 28 Aug 2022 19:22:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119B710EFB6;
 Sun, 28 Aug 2022 19:22:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27SJMD6e012368;
 Sun, 28 Aug 2022 19:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=+xU4ouutBgX7M78c0VVxXYsLj4bc2daOUOo9W+IhlQc=;
 b=dvRFMjPsMVMFDqMBAU8Mi/v51xtSViYcNsn1tePmbOT9fhYpWvZpYSXn1/q0SCBYiP9A
 wDtn6PnptAdAtiMtKv6J+Du2fQVL/+234w4zu5F4RjfxlX14jZKrypWl66U5q4wcymfX
 AlLdVPY8A5gnulV5gop+XTI54YdIlVcLDa2f1rQDOBHNTOibcLjfI7XidlIMX2D2RQmh
 DHZBqBBLg6RYCBb19XWC7K2XFR04Z6X+u9bx1VWq1dQ58r0lbsVKDA1xtkzu5mbmSm5h
 07JcxQzIjXYQdv9ElfQjh/V2fd0L3d+KYHnRJhyo/RQl/hdPQPg5aC9WqVpLDqLOjIr4 hQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j7cjf2m8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Aug 2022 19:22:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27SJMCsC022899
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Aug 2022 19:22:12 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sun, 28 Aug 2022 12:22:07 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Aug 2022 00:51:18 +0530
Message-ID: <20220829005035.v5.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0J6swn9VY3Z0R_E8rGJQC7IFGHooFG1M
X-Proofpoint-ORIG-GUID: 0J6swn9VY3Z0R_E8rGJQC7IFGHooFG1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-28_12,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208280080
Subject: [Freedreno] [PATCH v5 5/6] dt-bindings: drm/msm/gpu: Add optional
 resets
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, David
 Airlie <airlied@linux.ie>, krzysztof.kozlowski@linaro.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Sean
 Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add an optional reference to GPUCC reset which can be used to ensure cx
gdsc collapse during gpu recovery.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v5:
- Nit: Remove a duplicate blank line (Krzysztof)

Changes in v4:
- New patch in v4

 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3397bc3..408ed97 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -109,6 +109,12 @@ properties:
       For GMU attached devices a phandle to the GMU device that will
       control the power for the GPU.
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: cx_collapse
 
 required:
   - compatible
-- 
2.7.4


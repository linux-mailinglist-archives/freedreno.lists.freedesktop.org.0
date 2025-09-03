Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D347B41DEB
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 13:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC5D10E7AC;
	Wed,  3 Sep 2025 11:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLSwWccP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7064110E7B6
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:30 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF1Bf002994
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=; b=lLSwWccP/S8X0gGs
 /cG78VTf5BfHVkCrsLKglvpXJYWGlJVm6hGZ+2P6SL5LUHvGPYTeT+4n0jvqyYCf
 bCVetzjPN1mOQBbteGN4fTSfpY791tuEEV63CpEO3Bbxm9yuYmLw3LCYy4a/8qi/
 Daq6/J88J64Z279Ta8hLhVsbtFmXmhmyIlb4XxT9eC3T3L19bUTgtVt2ZYhU9sI+
 r0N1nIykjxUn90aBK5jZkmb8EnLKvGTQVN1BHrf+kZHpKqJ/qH8wQpZyWApHFRlk
 lo9gOF95G53aMS74mvc9POfiosXmkc3wr0Fm9deoUfNgPFszqxiZ4BVJ/mluI87G
 pkvsyw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03k1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70faf8b375cso79540576d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900709; x=1757505509;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=;
 b=bN08FLLW8nIeaNU1NCj9GTJ1LVz4WnSRhqhLeQMLczWWU5YXCx5KqIP3Q67aupVKVK
 Owz3vN3tSmY9s6FeIiyAOGH1ricoUuKgLWEBA8OmLI31vI68ePz7TUdr2+NRkJBxFaj1
 E79BKEIijYTSEQYfBzfLD7/+s+9jFH/wVOUrrjCJURYDLMXMJw0DO8vBi5m1EthuGDl7
 rRlCaH3Lq0BEucKZYufjuYzbSaPgSlcoTQZt5MMpl72rCl4SUDQ6/qatOT7zsG7SVArZ
 zlXSVwhMJv+1dtItuT1SkqWH5OPSGbcyBnauf/K6/vHk0hcdGdewIReA+o9RzqZoOPN9
 +CTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjAtsbMcrGb1DuC7rQAFFirFcbSf3C2aYKccd6Y8kqh53btIxK9Q4QyApFFNrt7ZAyazyWG9MBkUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXHZuRcNvGiDE6ytiLAwwWRC3wK21nYnZRroAazvuIWY3/jozW
 xD7uhq6erBtRs4tE4qh8KR6+I3woq4Zen3wdb3OGkDIaFBfRv4UC04dfsG3H/Guu7jb0qdebvhu
 /zVwLjFSIT/TiGd1fTL5YQNpNKePhNeURzQw5Gj26tEXI/rWRMcq8dkQHsX/2cywYfcsEmm4=
X-Gm-Gg: ASbGncv6fS1HCmpZO35pXE9H6MUOAxagP70c1bklZ6ICX4959RQ38voOJ4uirpgu/s5
 SkJQ+auDhQwbAM+1YYSgXEgWmLsKuKFp4ESPd3V5QhTcMBmZsUSjbnMX1AvCUIx/iQe8yV6plSi
 pFvsXJyVQcTlRF1gQoL6B38T92H6ok3rhK3XATgH6y/cgEkNbROjrJbKJd3vNRiIrFeazWVJUiJ
 fc824qShovs288PWMYRcOGGH7QDi4RkAP9kxutw2ZQEkix/JfH+EJqxof3t35racGKBTAA7UoY+
 CdkTVJ1APtyjEB/vNzR8UsW4/BR2L70YtmHPnZccPwIBuyk8HB9bFf2vXaA58eSYWKofb7uq+jA
 kBRvNkGmujkkv+RZcrR6oVMAPjSTBcULh5d7v9pWMao00360oDYQc
X-Received: by 2002:ad4:5d4a:0:b0:721:f7e3:b339 with SMTP id
 6a1803df08f44-721f7f2f87bmr56508976d6.59.1756900708659; 
 Wed, 03 Sep 2025 04:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOxz+WdI3lYa/0i/KAsvn3bz2F3oaUn75lIwMhkLzpHl6K7aeiGWJnGPQJrpg5cLSzZ7bzBA==
X-Received: by 2002:ad4:5d4a:0:b0:721:f7e3:b339 with SMTP id
 6a1803df08f44-721f7f2f87bmr56508616d6.59.1756900708191; 
 Wed, 03 Sep 2025 04:58:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:15 +0300
Subject: [PATCH v8 4/9] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-4-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jGBROFXef1Ek+8wHh+Y3Ci+prYLBgIDZTxGb8ga6KTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Xu+km2KutgPERGGGo2kmA5xB9BSqQJXCB3
 M/GRKa1pVOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVwAKCRCLPIo+Aiko
 1UVLB/9YvA2KNMlz3x3H5+BzWFNN7BkMCqdYEVllZZdSqpy+8dpZskxN/+586UCbKEPZGR0bPZn
 4rdUTsDG39PBRf3R9cGWP9e7Do/37ULaPUA+o4+nFcT/twphNVdMqEnAo2gkQqa5hTaxiVmICN1
 TFmroiajto+0rDQ4o6RG2zC5CK4hHc7naZKZLLmmo/nRz+qgbXbPRIAJdJw37Gxy56us3l9wHQK
 arLxfpFM/chb466xs9VErsOjWEL6he67ag4MM6Nn9dZpv5JacZHqPxwqbKIydIXovMXjAtc/gwy
 qfeQbAL43bMZLtSmzet3FrhNh6lpd/0IQS+XaeiS7V+FY8QT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: PESBFLsGlhhErKgKlPCIeiRz0NrFp5le
X-Proofpoint-ORIG-GUID: PESBFLsGlhhErKgKlPCIeiRz0NrFp5le
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXxWMTV0zyriRK
 dSc2cgMmmKUe8S9qUNeB0KhgcRh/R1kvDiyKgBjjorKmYrrp3bm67wt/HZP8Ct+z1QuBrxlofJC
 YCPSs6BdSPw1T+8K3PhdxWUls+OruYdCF7mw06MHhT/S1YFMElNLBbwi306JNLmsKWTEwD1/+0q
 1wFZcomIdgfDYg/eT/1O25O7OFj3NhE/kzndrtQ65bOXEDiy/wM9ZoMvwr47yZI4HdfqLh+/yTM
 p50QN5UYBbq1oQtUaifWyCgod9veBSKBXt24i7TBbq9VgjTV0GiYtf/GtSO0gqY1qVe6c0HJ1dd
 NEjSVggyqmDqND/euz5zGEnv+lEep98aAKgmQ8tCuuLFBc3Px3fttWqf+K76I3uJ039sBSwWo+0
 oa74HPin
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b82d65 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

Fix c&p error and correct example to use 32-bit addressing (as the rest
of the example DT does) instead of 64-bit (as the platform does).  It
got unnoticed before since DP controller node wasn't validated against
DT schema because of the missing compatible.

Fixes: 81de267367d4 ("dt-bindings: display/msm: Document MDSS on X1E80100")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e473332c331be36f7983fb8012652a8412..e35230a864379c195600ff67820d6a39b6f73ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;

-- 
2.47.2


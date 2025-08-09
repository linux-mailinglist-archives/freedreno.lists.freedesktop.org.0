Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42876B1F34B
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 10:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDD810E2A1;
	Sat,  9 Aug 2025 08:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AD3yxyqu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8C110E29E
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 08:34:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794tTut021356
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 08:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=; b=AD3yxyquwP1uFabh
 TGxA2LNS+njOoqMl35MUrGXiZ2pCWfcFTjiPji3yNVoOB8E0R5g4CdWYHgT3duWr
 KCkWnTe7dpj21WcFPS4WTK+iSs6cZNCNeSaU4xSwsdcyw3WTITeJjaY32JNQEFlX
 Z/oO3XJMsFCTR0QVwaEo83Itkfbs6UrAaQrY82OVIuivGdBXVy0I85cJh2wtRSaE
 KZDitMxICUKFAjj7Nvs6yAExrVxSy0ndi5P56+vv/VMhsg2bNxuTvs5PaU1KJ48Q
 FPDXFA7t+ziJi8gX5nd4kgwQE2UVbwI2qDR1z3eY0MzITbsjHrfLczKZFcfU7obW
 s5Uuwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgeu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 08:34:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e7ffcbce34so547881285a.1
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 01:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728442; x=1755333242;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=;
 b=p88X7s57r2LZ108Qub8483fCXOh4wtrGBMVLi1DnnrY/8b2n1b4RIs56WyEViG8KBa
 C+2s7/KsXdXbDWBoo+qCADn6hN+rs20WbDUxlO3Ti8a7diyI6RpRC42OZzbEP1Xh/1um
 OvqeJcICFw4uFE7CInFx8zjKe6Y0MJ3g/1Js5dYRFf6fT8dRygJ9ier0IRAJvpAOcWcC
 fkDU9jDqLnt2vCZaGT3CMOwtTFq0M+pVJudg/oGh132gyfVlULEcsAaRVqxIqvS02cfO
 FfjzFgod2O8X/Aj1dGq3wiIPvQMurPgxL9Ez1j8bG4dmA7sw8E5VF/tQXyJ/1Px/j7gZ
 jxBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHiXqPrGHzr+UgzPWyJ/rAIAqKuFxpC5ekHaTR5x8N3DQ+x4mIYvUCwUkai5zbojonDKvlov0ICP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz18jV9i9XDI+JwqP5hnF3Ttk8FW4M3jg7t/R2O/UxZxB2pTfy7
 /y7Bd0gvId8g8SCLejTrobTrIWtfhqZRde6gEfYIemSgSZP269Xpz36IyOTW+bC2yEQRAQWJCsv
 CIfbOjHO3ljExJxqik1AfsdLd3IaoBTLhvL8ZTR1neSxdujrJhV6MRXWC0Rofyuz08N9+lpQ=
X-Gm-Gg: ASbGnctFZhndhcROv2UXhQ3PIs9P+PiFbC0wBvLGUu6N8VCBe1aVafPCbYMwkKqUyr+
 NxRAvrI9c6RBdHb7+1V8PnzEQryE/za/6ZDu24s9u6J6hJEhwd/sYy139puPfTP8Q3jDetSQ8Rl
 PpwSESLCNl1BAA2nNKVcpTdID1zOJSfDT3/WmWqiA85juw0k3X+nOr6Yt3V+1OUIFe8Jakdi+M8
 jftx6ROd9K2RKp2JdIxrClCV8yejb3QuFr2G7IUw72/nHXPDm5YwCQszAg/M+1c4l2oMW9RDNxh
 KqRq4kdMVDw+BMpn5WPr7uiu7c+CTmAZwCIVI0rTYmeIUCMgjS+zSfv0asN0dJMLfpoL3hgNDaI
 oX7GjftEqDAwXm04bkTVMsk/RiZrVLSJiZ14c7pSVYv7RvGzjcGxe
X-Received: by 2002:a05:620a:ac06:b0:7e3:460a:a90 with SMTP id
 af79cd13be357-7e82c6a7bd0mr923016685a.28.1754728442126; 
 Sat, 09 Aug 2025 01:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/n9eSGH3YW6fEMmHip0Qcvr9RZrfIXk0CDWrNNpteBC2vjmKnlIyVvB4nA9KO5IfYmcr80w==
X-Received: by 2002:a05:620a:ac06:b0:7e3:460a:a90 with SMTP id
 af79cd13be357-7e82c6a7bd0mr923012385a.28.1754728441654; 
 Sat, 09 Aug 2025 01:34:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:53 +0300
Subject: [PATCH v4 2/6] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-2-bb316e638284@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
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
 bh=NXtQ3bomvI5JzHf8G2204y7/eJt5cmkeL6NKDMpr9gg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0hkKuweP/CdMP6B7vrf+thq0QX9XqRhZKZ
 NkMwSEJ0uKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1TPCB/972cV7KvtYTwIYjb8O6Xz+V9IwlaAu7GBJzOX0It0UuUU5jAb3vX17nSDCrJ8xsClvk7U
 lOcaS9r5jm8C3s3LTR2oAjlxxqwE4chNHCAFsZzoNTBNWHJQZItpJSHDOWp+OYzaeNTeNBLLyZg
 4IuGu96fiAoZZTweZF/+sYIhnTgzeDDtHPYusw+eNHxB/LR9mqpFokeGbZSG9gBIJnm+Dvp7uDM
 mNRVSo2wxC3VCLmhkySaogOqgYJFBEs2Hibgp1UxQkZURLndrDB1oPVYduguZZSVB4pGXId0rT5
 ObCu6d8pjRKXmX6qfQe3pX+negO9CjCPIl5OhTuzrL17uSOv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689707fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6D3zJrGCR10xDwJ3_6CvK1jwJ0PaElTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX3sQuvCT77c8b
 gzRgxfsIz0KFh75WzDNr+IX2A+tQsZ7zT4Tn8LNFLMoJ4o+lPU9KxgLSTScpAaqPhE5j0D2ekH1
 7VgJYUPK9FeSHtnP8vW8mPDp4GidUWzBstjPSexyKG0nchCWxz4WjJGANjYkaHry7KFCxE8H20v
 srNWRzh/Apm7L9R+nyHVZr8Jq+8NGuDlc6GngCGR6TXlDzFkvqj5Gfl8+qItBmr/XaIgWjVUHS3
 9/MLEuL3c4KidOnZUc3cxJMLH3qJrOzUrsB1mLENocR5D8yNgIK55YQOdrSUEVMmxALAe6+RSuN
 yGaaHRfCwkabVJGNkzColsa/DVsAS2ZM+r8yDoKn8C5rgfuth4TGhyfTa6Tz0dsahC3jopO5HaF
 j/CiIVVy
X-Proofpoint-GUID: 6D3zJrGCR10xDwJ3_6CvK1jwJ0PaElTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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
2.39.5


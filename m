Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA09B281BE
	for <lists+freedreno@lfdr.de>; Fri, 15 Aug 2025 16:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614C110E971;
	Fri, 15 Aug 2025 14:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJYCvFgJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AD810E060
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIpdw020096
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=; b=aJYCvFgJ18llElZy
 UoYH1NEgasfGOKpq7t6sIMLByYKibTopr+PrfcUnVZMvkdEFIE3d7guk2cLIV7G4
 Vr83aRMb288cYGJOeI4s6QMLsHS/XCKHlidfE4Z0+Mm2dbNKhmwxWzks7GXJmHc7
 P3nvmCSRKo7NxjoR+Ptk0G3qOZZOaHRU/taFRyT7SJWdZmBBe1DwJfAFFo5Ql01z
 P/PB9vqnPvKnWaXsoNEIPojHwrafEddrHgC9S0wFOE2oyJeeEk4pyYq2rJ1ayJ9n
 wW/90L3ACJvvk7P26rUvHejAfT0u4lR0L2yZfOI0o369nB/YgdYKxalZ4DEsRJLT
 88bd0g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gk64g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70a88dd0193so43063726d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 07:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268240; x=1755873040;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=;
 b=fG4R/M4ilP1Nef6P1xctR1/HtvAN/GiKTO9Ybns5ISuqdzwCeixDXiIxHDbQ0dTAGd
 gKxysLopjkzQ9fcEjfrVl27ftpqg5Rb/dZXUnqM8EzPyTr7nCybJ4u9ifQb+SFayfSpV
 dpzoP83tdorgBBRS+qUv/QaonOzHeGlwZy1VIUdYOm5px1HPvKin02oqRJTIC30/QcPS
 yhO+JqvwWnPAW78eD1B0L6OZqGj47READkwtd3wTu8rb0+ZqZ1wNSQU3s4mREZBDEdcn
 cAnls6I+pnIgsUoxol5O1xr94jRA///e2JlstJui82O0HpLuvuUb/ZVINSxPQVStCu/7
 lSbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI+g04yWlxAhh2qQCaPgBixnSZPVGnbuJTJByp6toz/5HQbpGXRoGU5j4x/lBEvmyX0wdFB2kYaeU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoT004ZDrkWXZTMmKtW6wosva9VLUNcLxpO/cxKUWUn3m5FfHH
 q/RqHWaj4sqa3nIobhUgwwbyzzPDBwkJQhTHXCBaDXUw5IFdo+iDCbullz0YSLRSI/i7FUDxgez
 h6RrYa5uLXfmm8DycK/9UOT+BqivxalLVM8U681/Bs5Hhfkkn7oLmG17VLriPS/tuxARqspo=
X-Gm-Gg: ASbGncv+CIPNZVAxANriujS5QRv8eHO9IWaqiA+LQFueTiP05EdUodZE/+jxT1KtOvx
 w53nHpCbwbFP5U40oDg3OESbT9qsXhd4D/x2khTHwPCiNIXiMABTHZkbeulevNz2QOqx6WnEoLe
 OgiL9sLpxGovN9Ecn/e0PVA5F/MXxnipgz3u9RH7jmXcBhSFLIU7XiF2l/jvEoCaqGKMd1egEw8
 cs3fll3wBQCrXq0de0DOdEbZBkFwVdHQRom5ybv3SUdn7Dgbr3cHjGRQXgPXbs65m+W+Lk3psxT
 uS0QcqKfdbubgTiWSZ+Lbs/DcIrQSPEvrn7gHarOaPMj90ofM/76dcZ+PfKlz5C9P6m+zi/pd+g
 J3rHpZ7xWuOmu5PHlLp3hOIPqEAS5rqSsp8cWxYDfG86TZzwLiDSB
X-Received: by 2002:a05:6214:d84:b0:706:dee5:fd3a with SMTP id
 6a1803df08f44-70ba7c6fda1mr21010826d6.47.1755268239962; 
 Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESu9wlfWDH7KhI+726PhxhS7B3c8t9B4QgXuWap5FzKvPgEw79c+md6NHYKPbonVOwZ8hFIw==
X-Received: by 2002:a05:6214:d84:b0:706:dee5:fd3a with SMTP id
 6a1803df08f44-70ba7c6fda1mr21010126d6.47.1755268239262; 
 Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:30:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:29 +0300
Subject: [PATCH v6 2/6] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-2-e715bbbb5386@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jGBROFXef1Ek+8wHh+Y3Ci+prYLBgIDZTxGb8ga6KTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SHDouVFwSMXsubc+sifkSHyNOV0hEn37tkL
 bqSE8McafuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1TTxB/4gbz3IsGn9diGtjv2N5oYvAbdCdzHiv3yMsoTJal/i3X9QpJ3Ud66nYST/WdG22kwCghL
 y7bjJZ/Iu9LIOWhO25Qt0NsCoDROQspnDy/3/2+lXYpuuaVdi9bMyTPKR4oZ3nLsUy2B9wemtdS
 /rqpwQbDZCTcqo09i7ylwFNa2qQx66xVy8akja0B2jPMT9uzW/LfADYjGuaK/tUKPaMTZJPE5no
 djBSqP0D2JQ1iAoszmyCEeKWuMGecsRjj0qCXDr2QRkAYYt5x6kIbZM5Mr7DI/MbZgDJgKpyGnJ
 Uq6Eiy3aNNEEqIxG7h9GfNZ2DsGLF+z1g+fqKL+PWmMmV7ok
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689f4491 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX3em8KZA9L+yJ
 V9VIF3AC0cAZvbXpq3Avy+nTo3vfqz1MmIhkCeVWXKEfzm1KhCNd6awuVRnNJcztSloPP2D5NHR
 iikqRYL9B3SGX9a9LpqicKZIQqA0cUP/sDnhxZDa0nGPfooqLBeRdal+Vg2bk1LV0kFVakiMtBj
 r5asSSsMFJ5Dle7xoSWbC+//d1+TAF4jZdeWPQtwGKnq/hkUYvZhFi1dDgoFIPkVG/YkjweaBeG
 nFNUVtuSqdFtWR3epMmciaROmiQXm8cgITxeTPSl9+o263ooqCzl92jRbW4MsX8YYH2LpmVDjLN
 stgZ13aBfZ1GpSzrVWIveWx6BEpLkSlc8mAwwDUXUTb60ub9Xb9qWscBLqchmp4DjL5VwtguMg8
 FPIrceH2
X-Proofpoint-GUID: ZiCyjLixhSGqz0bL94uD-PdRGehyQkQG
X-Proofpoint-ORIG-GUID: ZiCyjLixhSGqz0bL94uD-PdRGehyQkQG
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


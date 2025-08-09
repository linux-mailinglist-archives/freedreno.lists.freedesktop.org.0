Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347E5B1F351
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 10:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D58210E29B;
	Sat,  9 Aug 2025 08:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1ujCWNL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D0510E2A8
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 08:34:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793UJOo017595
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 08:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0noH+yy2UERIjrtWf5Izm7M0t2Ukl6cXD864r/H8zL0=; b=W1ujCWNL3lsMnAur
 4iZbhjWF6Er8Td52ISK4x37YPIryNw3NBgcRn/WQnU6hNORUuaFXIWl2/2GzdILc
 VIp/1tnd1nH9nGdW9Lez+GNzzroQrnR2s/a9GBKEpOCxKEkKtPl3K3K01SqxiWTX
 yR2RPuBOufH2c5puaPOoBfun9rUs9JA70+jsEaF0kJIz30TEKbkikSrHYKQwd+Pm
 dnNIu4h2nEXtHkdhedWvuesUBF/Lw1ejMjay40yRdMvM+P6vcpK3WP20f8tcU15z
 8tmZ26BET/ISWQ2FpmaMoy0z+5DHkxYswrbpVnO524SCjbvIYmUF/drFbQ0U+Ipf
 Od0mxw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwwy0cqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 08:34:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fab979413fso55880936d6.2
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 01:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728449; x=1755333249;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0noH+yy2UERIjrtWf5Izm7M0t2Ukl6cXD864r/H8zL0=;
 b=mnAEkLSPN40+zJr0ChoNGYmzd5ZwT3Y6rZnofmzIixb/URGTSlo7aFG8eIZlVsNGr/
 o1VfHYxw9q7iJimyeGS9gOSG1v+cEzhpYzJ0/J2+5MSB7fEoW3JDt1VXbmoITW/V+sJ/
 cessX//ueq+qLptv5uExAyQ1n8sACxCDRYL/j/dyN9gi2AOvecWzIyS6tf4OE+hhWywh
 b+dArjGdHmKNA8DTK2T0GTXmtc1Vc888giW1er0fshSxaswAbSLY5oPNsV/4Id0djtjx
 kf/p9Oqj4AavZnc2fuseZQ+xJhOsHw+JDOJ89yM3BtwSDrxKg5L/UPgPsGBsX83Dy819
 sk9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwGQnDTwI9vNHR7kcsJeLhmzss7HYPpQO4CgU6CDwVuFCVwml8A9p1wzttA4FNf/GcrbaAV5zlDSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcY0XAxqwjjog/C4zMB13ys3sX8sc6zI6J2vlOlDWEvwuj0Fic
 DMarzn/WkbB8HvfVsS+8NC7IiW9qzcAPEL+iaS//e2K9K9eBhnIS+N/HPi76dvE0YlPNMOYAtmI
 fBkQhEaPmYyEXuUbUNCasiHd3maj6kayBt+TlSkOeyc8anU3KzE/s15S2UoswUZzq2lKuMWg=
X-Gm-Gg: ASbGncu/8IuI30KrI61NFsmuPXB2S7i7Hl4DlgT3BPGypa3vVmrV4ZRP6/h4lAd3p9A
 O6Zv5qTp7uhYDK0srJ2wUtyRZrzSprUyaPCrRLfSbGrOYpficyxkkkMdob10Jwg80kqvqSExbdS
 OJSUXoXhgzDvBNjNYSJmrxb5Npk6lLp4QwD6X5vpGVl/jgKM25D40JIGVQk1dzXTKQSNpI+iT5E
 9TcrRYdsORFVUX3/22EeVmOoaDbDvsR25vatFPEROqmQNy2tYNRiIAMdcTThZ6k/3HneqGkwHZf
 slOczRbyzrH/TU6pGDFBhcnneY4t3TnNRzLVXqzGBFSe2G4fb1lc/oYvx5QWSFzBcYZxAMqezKT
 Eyn2NTJ0AsFYei9hL6crvPGsduwct/fxnrLV9ux9mW/yPHgST0ON2
X-Received: by 2002:ac8:598a:0:b0:4b0:6965:dd97 with SMTP id
 d75a77b69052e-4b0aed46000mr62114961cf.44.1754728449237; 
 Sat, 09 Aug 2025 01:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7Ab4avSwq1zZ5d2YBZYLBo3nOHk9zflP4onqWeB1kJHzKmCxLZZa6pyaayGdxAMVuH3MvJQ==
X-Received: by 2002:ac8:598a:0:b0:4b0:6965:dd97 with SMTP id
 d75a77b69052e-4b0aed46000mr62114791cf.44.1754728448780; 
 Sat, 09 Aug 2025 01:34:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:34:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:55 +0300
Subject: [PATCH v4 4/6] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-4-bb316e638284@oss.qualcomm.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rRhj4oU1JzHT8f9jk9qa6uf5IjtK4GGvxWKFr60GaGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0g4u3a1NCs2Pi954EIn8pKAWuyUrvgWY4u
 8s5Au3R/ZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1eLiB/4ji4EZcId3I+Gipm7fUItEaEkdL4jBiSVpgDbR58hgGaGfh+rgg1iUC2K1H2n77wSd8Qr
 SVc9HGNGyoO+RsgWs2Q7TnCVDiYvrZUQnkVc2p9Nd9vNYCrpW87YySLDDgKLZ4bn8BDwb2nwefE
 ffzgcvATuCl1rekKNCxLWqIKz5PUxhd0rTjRXQgcaMpRDZ24nximOaUERVaE8jgKNGqy4nlXPe4
 PHmMFyHM5RlrJhBRvveyw+dPfy+4nluaTtsx3GrtM9qhNowxjd2B4f+K+Bs9fCSSwbTBJFKzuzQ
 klbUlOK1fCXVmzkHriccIeMu1IBi+WdzUkpz5G3GGtC0O0CN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyMSBTYWx0ZWRfX2CGRNffEo0Yn
 nMPPTK1X7I7zkrGTdJFQKGT39gu4HXLtikL8MF2DqDYuPyeVZRXbn44e3LCnJpaWAN+MnWj1eub
 Fne5fGIXdN1vj0XM3z5uQZJ/Hb14T90kWGKxb5Ln0LO2j8rJkaZmhxoe7W2JEyqQHuaoS1rc1M1
 FxNvKqjgtbwA4U5EI7GC7VB8JCFQGl23qcFiE44BlAu67iITE12RiP7EV/cD5wMkxr5BbVHygjE
 BsnlgLdXuCHyPGPSMc04WAwk3ja4emUqwqUrUwDVmz/CsBkXS4QjIdefw/1uaEgHdUv+CY3tbNM
 +eHSCXsvTb2n6QIE9w4MWsRm6pOl/5nqD9px7u6n7taoHrrpr4XCCn4kSO1kSa4oRfQROK8ftPU
 jgP77Bsh
X-Authority-Analysis: v=2.4 cv=CbUI5Krl c=1 sm=1 tr=0 ts=68970802 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjVaSBsDX57WhQYIrYsA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Tyr2zR4QxYdAhYO1JwpeGvjVy8dzGo-O
X-Proofpoint-ORIG-GUID: Tyr2zR4QxYdAhYO1JwpeGvjVy8dzGo-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090021
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

DP controller schema documents assigned-clocks and
assigned-clock-parents. However these assignments should not be a part
of the ABI: there are no actual requirements on the order of the
assignments, MST cases require different number of clocks to be
assigned, etc.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks from the bindings. The generic clock/clock.yaml
already covers these properties.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 55e37ec74591af0a1329598f6059475926fdd64e..352824c245224d7b5e096770684795625fc9f146 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -73,16 +73,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 

-- 
2.39.5


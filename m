Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0913DB41DE4
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 13:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CD310E20F;
	Wed,  3 Sep 2025 11:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="chd3mvzi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562210E7B3
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEurf000688
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +B6J/aB/tids3HBfaJNu1z9KCUM3gjNbHkRd/sTehYk=; b=chd3mvziinkIxnri
 4Epm3Xc98e2TrW/406+Usjs+Zmx6c4bOUZtzeqPFGZp2xrZs1u/ceKVeuWM2JGk1
 4ZKMAwLc4wBgzptRYoNMZ3/6o2TBwhWp9cYAxlDi/zYR7wCnS1Tmo5SEKa9QGwpz
 T9ZOBgr1iyY/agT8fS3JzDggHcNaaqv0boRjaCAUhDMfrMdHhnOenlWIbEF1Io/l
 o5pT51LDltjawdRmjBwmm2q38rFqimZvkGvA6w4uO3OoZ3A0K+Qrik5Eb6dXKrsj
 zlwDiC1CuiCAZKrIvYRw4PpOEwFo5Tlb+sTmFnTrkVPtdLrzQTS4TvN5jF81tG0t
 6Hjk6A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush33d4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b30cb3c705so58117721cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900705; x=1757505505;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+B6J/aB/tids3HBfaJNu1z9KCUM3gjNbHkRd/sTehYk=;
 b=oHEBStI6BvsmUIpNyg01pokWQ/gjMMaugNbe7g2GFiKe8MBVFoB6znlwjcNrz5BFJ7
 LlDpa5Rm6UlCcXmIjBqxXPdli7wS2UvrjbN1QF4dmeqARac0rDLxB36UgOpIyK6YpOwM
 MOKUFyunQpxrJRH6k6jIyh7ubtJMuoYXig8tIi2qhHUAr5ZjHQ1A5xxf94zYtmEZIckt
 dy4uPblRRNRCgkcllA8WLOZe+W84c/nDeVN7Dk/bMRbUq1/W8Sqv2wgudtVgpNilTGeU
 RurpREDxbTTsiYEoyhN/dithBb2NIWQM+psh9t7vdelmqTpdDyC+Bja74SX2CB/Fgeq6
 +lzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF0q0NCc/+y1uPx4rM89JDsfKoRlKEBRmBMLNLKFsrKJcR0qvk6O5MpaE4FqSLKDeRqBBsMvlmDIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykBEN4cVmiR87bEaxRsLHKBnDFkR7R4098XJRdCbg1RCBMFK1e
 G26f4NB79+5g41EpJe2mS3Y+o+gwX0PHDZEb6BEOxl6yBZ9IGIoKZIuzJvGF8fv6rNXcPINJwKn
 AcVemfXQrAeSZjcmYFQzycH+HPlUjnefBksSX2Dy+d9gLxukOQNsWxZPa400mko7O0zjHHnQ=
X-Gm-Gg: ASbGnctO3NQmQsmCTOTpULNb5wt5CMabY05YMmEaHHcXM6oXgTwYYKhLfZDnMAMSQsh
 8iZOSb3Q6daB7/GNc+kKD69LOjRj/7Vp7m6s6MoYC1nfsgRYQm6BdZXNXC+Hbro/6mKiBQ1JnOf
 2U8LMLWQRaDd7IngSjxfx6lDIP6avmXysTkelrM9J+Kpqglg4cJaH0NOOKqVErh67q4Qksm0ETY
 NxJWEHsnDSVaRVpWkwPOrAQpEA7hWvGDY264+UlgGybgnTMkEK0wJX3VHJ2tLTAA2G53gNSk7JG
 x4dugvS9X4YOP+FUZ+aPTP96rb0pVmVY20m9OsEw2gsW/8fm0QGPgMAYEuzk/TiXPhFaNgCRgk2
 d0+HgsT5CoRWbWACHPJXkWPoP/2is+BZbS9f5MK49rdopSlDEuWPN
X-Received: by 2002:a05:622a:1f09:b0:4b4:94e7:7305 with SMTP id
 d75a77b69052e-4b494e779admr14573901cf.66.1756900704591; 
 Wed, 03 Sep 2025 04:58:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEec6pipCsiN4bgRNHEInH7xKrhFe7yfQxq516iB19wHmpDvTtGnLGWlQH0T9+x/MPrYZLrfw==
X-Received: by 2002:a05:622a:1f09:b0:4b4:94e7:7305 with SMTP id
 d75a77b69052e-4b494e779admr14573491cf.66.1756900704030; 
 Wed, 03 Sep 2025 04:58:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:13 +0300
Subject: [PATCH v8 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-2-7526f0311eaa@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RDcsC0Xk/SeTiAYs2PrzT5y7v3tCHnCk8IS1ckk2ayU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1XhQYwJ1lOW5eV5P1HT18WaT4m7LdhmkXLt
 BA9hlGisnWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVwAKCRCLPIo+Aiko
 1VtwB/9dctctbqAzqdpymh47D1RY5EIKq+TYeq9nhWHT7IdEdFJVWIW9yFkpZcx/9Hvp2H2c1Uy
 /ms2Xrcw9raK5q3K70hPRtXSh+dmaHZBhxzYzyV/XfsA3kgNthtuyUBJxz71CF3EYvmttDalY2/
 LXl6G2ErP7DwIbQnWOcYGkofktJLZKbviC4IGwyjQiGdlosNItNsbjuzxncmKgJ7smR4MxUsJy1
 eu1OPmvBqp5CNd1PjEY0yTacTJGkDpormvV/p83MkvKRCwo6muNWM3w0ef7IT2qeTI7Cp4AMQRU
 kHCX9fF87Yw7hguGeHRMXQSxczp6mNgRqCHuahhTkOev3bln
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX2wELvseZBZhy
 Tq+b1Lo6mh+ej3o1dWflAnQoUl5CjYwxt1EHmqwcBQfMpilvJ57e+hKswIWaJnxHKGe/owB4NH2
 InqhGua5xvuBIv5M6pRYsIYoZ9sa9aw5Z5TffF+9GpQ3/dK3dUZjGI7gSuoRmA4+9hEdWn80JIQ
 Br/moR8WDl7gUqu5eYUJBL+gL+88NmaxOhS4zkdFmErg82bBOEEL7WLXtvMvOLPX8jl67gwWlw9
 hXDuHdBd/yJhMPkj2l7LnMtRcNkc+51KhuP0uvYLL+WFkCs70L+9s5Sy277gf1Foi2VcctUFl7B
 Mjm6vSvbQrPg4ihGSQmVckQM3tz1iC1HiTB2ALxAH0wczQJP3T+47PMq/T0nn3Pnl05RWK6VWpz
 YUp/QAB/
X-Proofpoint-ORIG-GUID: mwl-ciVY6DuDJM9IfUbxMpaLSIIR8Gho
X-Proofpoint-GUID: mwl-ciVY6DuDJM9IfUbxMpaLSIIR8Gho
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b82d62 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=M9OWzbDgh-7tm28R-yYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

Currently SM6350 uses qcom,sm8350-dp as a fallback compatible entry.
This works, but adding DP MST support will reveal that this SoC is
not fully compatible with SM8350 platform: the former one doesn't
provide MST support, while the latter one will get it. DT schema for
SM8350 is going to demand MST-related clocks which SM6350 doesn't
provide.

Add new entry for SM6350 with fallback to SC7180 (which belongs to the
same generation and also doesn't have MST support). SC7180 has been
supported by the Linux kernel long ago (and long before SM8350 support
was added).

Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,13 +31,25 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
-              - qcom,sar2130p-dp
               - qcom,sm6350-dp
+          - const: qcom,sc7180-dp
+
+      # deprecated entry for compatibility with old DT
+      - items:
+          - enum:
+              - qcom,sm6350-dp
+          - const: qcom,sm8350-dp
+        deprecated: true
+
+      - items:
+          - enum:
+              - qcom,sar2130p-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+
       - items:
           - enum:
               - qcom,sm8750-dp

-- 
2.47.2


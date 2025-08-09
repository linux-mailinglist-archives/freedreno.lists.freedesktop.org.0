Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295EEB1F36B
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 10:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A19B10E14B;
	Sat,  9 Aug 2025 08:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK8mAb7w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB7C10E14B
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 08:36:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5797GVYk025917
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 08:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Vbhk6QCT3EVReeZaEWJCjX
 Dtjty/QxM/QqF3JsKZ/bQ=; b=aK8mAb7wHR5CDudbNk+2qoh4ORGcuSpp7chNfB
 6++T8nTbtFwp61xD+vH4dam9eveMkdL/wdrfiu4W5YiQHRFYEpKGs4UoM+yLMSvL
 EC+Hpbiz43YJ+AqR4FJPLA5uRTECXQZsAjwPJbF0SikwJ3jXa31WqoOsZ5UztfeM
 T70FEGLOcgEOgWfh7eRTDHv/tuyq2NHiKScvNzd85nOGWNIi47eFHzUORm3qtysE
 JFyEgxqX+wXktzaKCD10gWUrzhu3CdS5MldCCYNjdak24e4JzU3/V+m/7g9vUx01
 l07HrL5srnGtmENYNAPKTJD1Vc5QHcPcboGk8jKHA17Od8qA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwwy0cvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 08:36:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b06228c36aso38590581cf.1
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 01:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728617; x=1755333417;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vbhk6QCT3EVReeZaEWJCjXDtjty/QxM/QqF3JsKZ/bQ=;
 b=bgNXvS0TRTeJfLMzC514j2GkceEQcHda4uEea82M0TmY9PALKIC7x/7n8lx8SDjC3m
 OLjX0jIzFsTmgpl/iVaUYw7b9TJU7eekiPGp91livS2XeI43rjIJVwk+Aaw7yHQEYkv6
 yBnr7MYGn62hz9MfHfee/X19UW5ponNiMZhIAH5YggeIF/Hab09On7dGXDQMx+jW++Wk
 RPmwRNPnp4BYhQjR4VZpjVC21RPJFSdlutBFtiA4HbD+oLU3BSu5S230Rojgmbh9o2lO
 WpxOsk1QXvXk0Lor9uP859bezy+7ScivqDtQUyEyzu0zRXDNwc7ThSdB4zGinF6sT6Sk
 lnUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvSdUGmBpBmDn9pVKZSeel0A8dVaks01uzlnzC8OfubUatGOWIiKqGvAqcr7PSB6nQhgKIE0niEcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZwHWTGC83dOq5KfTIU42hUMnUmwarbxqPIsmgR02QmdL/Znsy
 J1+fmC20nWayj+2ttYbPLZ+ZKzH9a166SMhIpz/PuuJVFf3Y0Ju/rv022nmUtwXHUf3ueBPzuhj
 EtTXO/ju+ZFhwE+zNuKfeykqj+cZp1Gx/u1gp4gLgpIQSqlDRn21eA6dGO+F1KKyUb9Xr69I=
X-Gm-Gg: ASbGnctGMTpVxOPGSfEIH48Ctjlt+nTKuaG80jbLha0mNmnv4aT4iM/wgRpf0kPN/lE
 jGyRCGsbEaXIJbs/5xiLTvlKM/wjZy+PMPSERECDPCxcD1Dk+ehDfz43mBNxnhJxGDKQYRCfNwN
 Dy6pZWadWc6FnMufXqt+8PP6Okw+Qaseq9d7sLrppSVWqKXOa7b02x7hq3Lh63vQoXgzX2QSCZq
 x9v58CZsHe78MsuhydtmkJLhf8tATo45qyFL3X2/bpOocDoQWDclAiRJomY9X4aMM7freCMMHTr
 IyUTb4eym1hSGhnMlEGM9rO+7jt4a5ItzaiQGCOGBS6bsr7kn99GExkvewgWB+RWtEK3LVdEp6b
 Vv6YsxgTsf3KyPiQfR5yn67xJ1QPX3Miv/p1l4yj7lJk6FQD9Ce0b
X-Received: by 2002:a05:622a:2446:b0:4b0:7ecf:beda with SMTP id
 d75a77b69052e-4b0aed0bff1mr90397691cf.9.1754728616697; 
 Sat, 09 Aug 2025 01:36:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH37kRnw8/1Yvy8Ct0TseBki1Zc9SOjiU5tdXrLe87OhkeI9dMLexzVEv+ZZeRaP96/LWT6Gw==
X-Received: by 2002:a05:622a:2446:b0:4b0:7ecf:beda with SMTP id
 d75a77b69052e-4b0aed0bff1mr90397511cf.9.1754728616224; 
 Sat, 09 Aug 2025 01:36:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88db2214sm3239974e87.177.2025.08.09.01.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:36:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:36:54 +0300
Subject: [PATCH] dt-bindings: display/msm: qcom,mdp5: drop lut clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKUIl2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwNL3dziXAtLczPdvHzdnNISXZMkU0MDg6TktCRjUyWgpoKi1LTMCrC
 B0bG1tQBoHPxKYAAAAA==
X-Change-ID: 20250809-msm8976-no-lut-4b5100bcfb35
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
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KmUlDlykqRmfS/c3OkAxh7AJ+0CRPOU7eFP0ludcvrM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z0jmVKKiy51Y/+3+p5PqP0fs3XmjAmj0vMF8rL7+qbz
 9pwz+dNJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwt7I/lc0OcDbbM3ekOis
 iwVbqiwWv17z0pxlS2uU0aXM3CsaynEnRPmeb52nF5CvlMBhGOc+92HM1YO1LOrxojddP8zyZRP
 5zHk2sFz3352j1zasC+o/syEq5We3aOYH9cKSCU+5LnV0ae26m/r1Gp/4Djul+zKnijef6Xt56U
 BCzOwJJuueexW0nir2Csl1MQuQFDc93Nt8nmch890Sh4OmlWwWQi1Mu9cw/jBfKjb7y7H57yfPU
 sqwC7/WWmZYwnjp8IHpC+c92KXH2Tox8bggZ5zCYpZnis0HXAqSLhYf+8J2KyHWfnnvXYu/b1s6
 ZO/0Gr+xMvVSfXdl4dTAhx+mz1JO/wa0sWVamsGVsr2yAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyMSBTYWx0ZWRfX0VqaNSCGZpW+
 QAIO3ejmVHX+AIHBsZwZbKnPo64OKK5SdRhX2OGT8s9tDoieDXBOD0vGaPRbK8rtRG9vic08LHt
 u+SUROJWqloP1zf8c5Rtr+4GZ8MISUARPGhkyU5wBfbOSqJqLHPKh2n9hqyn3VObR08W4On+s5H
 w1592feVYziXEI/9FASrga+FnlbhiMz0poLaRoTdrlkOJH7FYD4ke3aoEb5Y8aF4nmgZUSEsYJg
 j3qZ4ObQww5kp0ocLb2xgnyT0DeFX3oHn7EskiV4O6kBOChOx93RRoY8C6luHWNVpiLQ+R+XtzO
 r1ZKUzLZIb9XI0MIMhxjWDN4snVcn/pWH9wZlRtcSkikTJwKjN2oDn5nSGnpVej9hkm+DXo3Tcg
 dt0c8BTO
X-Authority-Analysis: v=2.4 cv=CbUI5Krl c=1 sm=1 tr=0 ts=689708a9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-Y5st2MN6ViVPFRs--AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vYlgm1Ax_FE3UYc_5MW-nnyHGymzpzjo
X-Proofpoint-ORIG-GUID: vYlgm1Ax_FE3UYc_5MW-nnyHGymzpzjo
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

None of MDP5 platforms have a LUT clock on the display-controller, it
was added by the mistake. Drop it, fixing DT warnings on MSM8976 /
MSM8956 platforms. Technically it's an ABI break, but no other platforms
are affected.

Fixes: 385c8ac763b3 ("dt-bindings: display/msm: convert MDP5 schema to YAML format")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index e153f8d26e7aaec64656570bbec700794651c10f..2735c78b0b67af8c004350f40ca9700c563b75f8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -60,7 +60,6 @@ properties:
           - const: bus
           - const: core
           - const: vsync
-          - const: lut
           - const: tbu
           - const: tbu_rt
         # MSM8996 has additional iommu clock

---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250809-msm8976-no-lut-4b5100bcfb35

Best regards,
-- 
With best wishes
Dmitry


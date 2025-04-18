Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D4DA933C8
	for <lists+freedreno@lfdr.de>; Fri, 18 Apr 2025 09:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533F810EB87;
	Fri, 18 Apr 2025 07:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDDR8yN6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE72F10E42B
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2qSgD023395
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e+7zJBm63Lgp886dxKyB6dmrzG0t1u6zSCJPTB4/5Dw=; b=WDDR8yN6Peu0rUGT
 C8gHwyauFw5GAqefI4hipAekd8SAMgvqgi2OLAgNEuHU4zfuvBJ1PVPGIfLyQ5Vk
 y05elYKL03WXvM3+z4dCkHUc/TffYeUs1TuvtS9Rq96qxkw1CFeFna0vs8e2a5Xd
 cks4zzUN+gfP8/rS+QAq5aKkb2r4T25drw89ojBqNzk887pX/kIYDfn7lQawvTc7
 AKDsKaVV0g+y5lFqPt539dKXzhDcJ9G77sVD8V/ESPD0U1Rre/lnqn1pkAbavoy5
 ugOm2C/tv6pzhvtSBTEzxaD7PFMTgacZ+pMApTAmVmJfJl6RDk3Duf+eBZGxXeSs
 Av99xA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbq148g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e905e89798so27663396d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 00:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744962606; x=1745567406;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+7zJBm63Lgp886dxKyB6dmrzG0t1u6zSCJPTB4/5Dw=;
 b=BB2yyrovkgXC53dfOIkxiNcdWztCHTrpA5jnNGrUL2HE+Jxtdo7JvSlAvxttYupLI/
 1vm4iHCuiiQU7ra+JF4Nkn/jpuEKgZkw9LlQFDu8zoxhA0qOxDIboSAEeysF6S88xDbr
 QXLGCmdGOR14TxGjGvJsbe6tVCHnpmhBBT/535DC3Tgo29SSyXQntWMBUS4wDrZ6Pcfd
 Yc6GrHAaXup3Ot9Sy0j9MJ7opsTwDaGxwLepBRwiTDBCPWkKK8cGly41eAGCpj8lpS7k
 7erutOosaZLQAEGpze5lMjE2gTOam7t7KgBtK1q2T2xycWzyA75RVrlkuHFOpWHMRB6e
 PBCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZSsH6poWLynxn3p2xpC+pmhqL7/GdofqTgDWvZ9xUEnSwYgurt9bUs4ekZiIysN4Zb2FHpiM6qUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycgAEzqjfD0XU73pax4mawiRbSQMDSfIuYweF03Nc3g9dkMCyX
 i1r/pGrQqx29nXb4Mmo2EazvOT9Y91iQUvoCiMOoB7RLM7l1uiAV51rK7mHoyGDvQef4xHSdiZ7
 /gqWIlC+iZVpxEETrv37HjnOY1VE2o4TQhpBf5BmglENPAiEudQ7YMAng6wmlDykrA8A=
X-Gm-Gg: ASbGncs4+vAFY0Auil0IHZ7AuIyoyv+qIoEXLKyBM9jleoeUdxv7YFUIvCBbg0g6Hyh
 +v9iGy65pAmv1dKVcePd/5x712QULSim2pfzHDG8FB8pn0SbmHy+SxwIZR6DSzZ6+2rqnpqb/wx
 9PPdixKWvjlTsZYZg5MxbUm3qXAYklfYKU79QSXT0BtoCX9co1IY8T/4WYYatM6/Ib0QAw4hrLy
 GnbJbVphDU4q1Dnd7ZfWWle4nzKpqx9sYaNaBr06IjkBvVV4FmUr9kwtErfSH3xEws5iBM9QuXq
 Q43BHfof+yi90dPIfao2QSPSGj98aR5y8aMNcYqwyv6uDtOwumN2SWdpgnfc9kfNx+dIxYZ7TbE
 bki7Pytk1jwF9TwTG9Wlvglgl
X-Received: by 2002:a05:6214:2349:b0:6e8:9866:7398 with SMTP id
 6a1803df08f44-6f2c456c668mr26534486d6.22.1744962605919; 
 Fri, 18 Apr 2025 00:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmdqbp1uisYZt9+CQb8AviILd0JfMaSMgZGRgsUVuNr4Q8za1X0NlrSkYGGp8cQsS875MEng==
X-Received: by 2002:a05:6214:2349:b0:6e8:9866:7398 with SMTP id
 6a1803df08f44-6f2c456c668mr26534236d6.22.1744962605598; 
 Fri, 18 Apr 2025 00:50:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 00:50:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:56 +0300
Subject: [PATCH v5 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-1-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t96ussCqWyIQAdmFD81iVPY1jwLXVD8SP3JFMa/Qjfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQonsp75XK20kcf2pu5n0LjwPVYXkdyYuxQf
 a85/76z7hiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKAAKCRCLPIo+Aiko
 1cq8B/kB+M00kXMMuhUmVSsKacPCdyAy3OMaCOCs8MJ5vQI6oROm0o7QZosSTt9M/TAPovpvLKQ
 YCocSsQ5JV4E8l8sAALjIOjHHNMpl3RvlOyPigbaKaN52tPNdrweOuFmzhDWnav3Vaxe04xIpYR
 HU8j/0sOj3j4ALvvsUXLXATE746j6PyP/7Z653sBsEr0UpmSkU/b2hHDIS1wclGa3coJqUqGh2G
 Kvk6NEnYnLOkex9SduAZJfoWdzCN5dyYrHvRLaJdiLzc4CoQFj3e9+oltrhHEOyT6LapegH4tb6
 3sGJLOoj5qOi3zj1xM1+geoLFaCWpdOq2Fp6Eb1OVPqkL712
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: wlACM8KHcsnOlG8ZV_FNjpJc6zXC_J3t
X-Proofpoint-GUID: wlACM8KHcsnOlG8ZV_FNjpJc6zXC_J3t
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=6802042f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=qy0Ph95xh7xgto4wCWoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=949 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5


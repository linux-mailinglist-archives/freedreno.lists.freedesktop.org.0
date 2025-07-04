Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A259AF9842
	for <lists+freedreno@lfdr.de>; Fri,  4 Jul 2025 18:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE83510E342;
	Fri,  4 Jul 2025 16:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M769Qswx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E71810E33E
 for <freedreno@lists.freedesktop.org>; Fri,  4 Jul 2025 16:31:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648fIGD029535
 for <freedreno@lists.freedesktop.org>; Fri, 4 Jul 2025 16:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=pomuj/cQkgzD0OUOqyvuhg
 sunp4U7azsh3q60HaOzhQ=; b=M769QswxAiVvqsD67zoEryy3gtauzpiYXdg/D6
 GFVNMgIOBWklhT+7Tsc4W0lT79Vf6+wjlpus5Ma2GIIXeVbcYK7PAkoER/PM8cKF
 iet+cxu8NC7/ZffkL5RktlueG50XgCyTBkoEdw1Dh/n8J/kQwzfVHth6mx3ctHL9
 v5+kFd7EpueQo8rIS6PKBCVhx6/JQcUnWBWqRHfA4liGedJgm3u0U0z0H7UsQpzp
 bVlyPO2sFEv71q/V3O0yFhnvMP069vZRf7ZF6bVdBPIxJ9AgsvJYd19iO0zdhRWU
 hSk4FO71voCs4rjLfUAFloMGGDEDgy0z4dwhmOztr/2XIK6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s5x02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 16:31:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so193153385a.1
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751646717; x=1752251517;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pomuj/cQkgzD0OUOqyvuhgsunp4U7azsh3q60HaOzhQ=;
 b=Du54vGBX+jIzkPab0aRVgbuiSsaMHPfRWlCPIXLs+xLm2NbUkkQI2zBlWGb9VNb5Ue
 1ErzUpHpFioN7HWr6gnh8g9OlDYNGnGDcbDKMx2/CGlyNg/jTERUUN+xD6IRdH6QjpdV
 GzAStcaerrHcTW2Bk2vDHWRIe3/6MAXxSav8uqb2gF+peB7inSR6/tQaTkjCgPG3LAnl
 x0xwjEMQRkp/eQT6Jdv96EAECeM82KHCIX+e6wabS75EtKVbARCLA7GiT7ll+2pLqS5/
 y9PCFfzVtbGUNOP27983HZEe9JmC/bKpf6nzpGugTyS0FjYppdD87CxNDNvDuaymTm8V
 bV1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5wr0a9okSxXk1JXKdycryCnmc/Qg+S+VEULvGJMk9dUnsCHCCpD0PWdP1yTa/CzguMmKTVh0sRJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHBahJeb3sdzQWozKpYC+kqur6u7S8z7bo1dJ9gW57EB5QKzh7
 gG1TPUaX7mFgMO7O61xUGmC/cSTrZCDt7H/D++gymWtdwRcYvfwb0/sHzNv+ZcyxjzlQu/xm3mS
 wRKZZN1RVDKyPoFyPzqtHOt9LqPYCxNnaO5eJ1TpGdyeX6l+W4hwsX6S0XzZaceXY/SVWJS5RIe
 y6iVXaAg==
X-Gm-Gg: ASbGncsYN2XuaQJDN1BTqgj+tMo/7bx495ZaLj3hmy+62Q4oY9W/izwwLfJjcVTDfgU
 ebfNymxYCtHIEVuclAWAu1LLaSpAkAplNIUU4mfOB2lng+d4OQpwJD19QEgWZU5VFIWxOnuD2sX
 Z+9bJTkNkWRK70EaE0LNJNoEFvEKpEdcfl0gyksv2Y8Usibx9L0gOhKAZaln9zMrbPvM0S8q3MF
 Pf0Q+3R7kqOlSya3l/pfiDRreAvqsF+LtmvwHdm8fMv02aiurOrWsF9q4tFW2CRU5aQwEUtSJ2c
 EmGxQ1oatfbm/tTsL8fYdWsqgeLMP68my6Xbq/X3Mrg1pVT5ySjo+agcgZ57wKyDeBbZJP9XaQB
 LpAxp9OrVewE8ds5+vbWo2Hu/lMi6M2pZWa0=
X-Received: by 2002:a05:620a:450a:b0:7d5:c45f:c3c8 with SMTP id
 af79cd13be357-7d5df0ccffcmr335999285a.12.1751646716966; 
 Fri, 04 Jul 2025 09:31:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU1hI88kRN5deziiAv/Vi3VKoh+SdcIIBtiyE5bqnofAdqmJ/2dvCk8nIcVO9jscTO9QwtdQ==
X-Received: by 2002:a05:620a:450a:b0:7d5:c45f:c3c8 with SMTP id
 af79cd13be357-7d5df0ccffcmr335996185a.12.1751646716499; 
 Fri, 04 Jul 2025 09:31:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:31:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] dt-bindings: display/msm: describe MDSS unit on
 SC8180X platform
Date: Fri, 04 Jul 2025 19:31:52 +0300
Message-Id: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgBaGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMT3dyU4mLd4uSM1NxE3SRTs0SzNGNzs6Q0SyWgjoKi1LTMCrBp0bG
 1tQDrvXPlXQAAAA==
X-Change-ID: 20250704-mdss-schema-b56a6f376bf9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=P/5XWsuuqMDqR+GLmerL71P40xuUdfPA8CFQpOrn3/A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0YG468fhkcSp03tV5iquzegXb7G/dPKhp+x9lUOsxWVZ
 zoxeoh1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiTpwcDCtqF3t9UcuNlPtZ
 3n9IbsmC/UcunFH58WVvukDWLTN/068LsxQta556ZTU7/P7w6+Vm5R+iNzxTXcrWT7Tp3RPReZk
 jkaW4ht+rNZBjbsCC9RpMO5IXlsbsW+91fpJHZcOv5MqU7tpUk0XOwWtb1ud7f95tqrnbsGlS3l
 zuv+sjpYVZCzT3HjBRPtv/uGBWd2JIoMS6Qn/bF91aSn3PmN6zPWNlb82VPz7BPoUz1erAgxUG9
 2LUM28IyvruYveRvG7fcqyp6v0s5irTpbMdbXLt2RccSkleKfEg6WZXvo+8++9ATYe1b7ibd0Yn
 L1AP/6Y++d3kOctWLG+PWcjRzD+1NrKi5Gvpk217Df8DAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=686801fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=MtNW3POlok7mfpsrGdgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfXzSqdcAioF/K3
 gx8pipGJ2kJnvi9oOFSJh1J63j4IXknkNUCFWzY+nh6v/jiqNxm7DOUp/ngkCApfBbHnAbhglcB
 lw7bhqJhb6PGjAWbA/OMz12v6VcxiVqJYcQR9Mo8B1iaYZxSHOOxb7XVdHkwKOUx2glbSAsbu0t
 SgOViQpTEUULUQXst7KZbPHAQlOxI+POrU1qgzbacji21jrU6HCmMgeTW77S2MymTQQZtTcpn46
 2j7ilPEmE6Xf1BqY7R0EqMHQ3ci9q6YtcY8B82HuKNFeRUuMJxsuWj1CJLsV3Rh5WXPRW4z8knc
 LDwdOYsCeVbqpvk2bAdvE/bTdLdJMUAhFQ75D5c5F1vAK86Qe4c5b+7LcN2ciRzNsd/KwajlyFI
 H3aRKqYVJA7qMRltXxTpreVXDedgIIEqJMEc0fpDVLAZlTQo1WTNKl6ZK9XRV9FrbKbTANA7
X-Proofpoint-GUID: ngBsnrH2dbqSRUjxp4js4GdbkzqEsqd5
X-Proofpoint-ORIG-GUID: ngBsnrH2dbqSRUjxp4js4GdbkzqEsqd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=893 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040125
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

SC8180X is one of the last platforms which do not have DT schema for the
display devices. Add DT schema for Mobile Display SubSystem (MDSS) and
Display Processing Unit (DPU) and add SC8180X-compatible to the DSI
controller schema.

While we are at it, also update DT file for SC8180X to follow best
current practices for MDSS devicex description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      dt-bindings: display/msm: dsi-controller-main: add SC8180X
      dt-bindings: display/msm: describe DPU on SC8180X
      dt-bindings: display/msm: describe MDSS on SC8180X
      arm64: dts: qcom: sc8180x: modernize MDSS device definition

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     | 103 ++++++
 .../bindings/display/msm/qcom,sc8180x-mdss.yaml    | 359 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  14 +-
 4 files changed, 472 insertions(+), 6 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250704-mdss-schema-b56a6f376bf9

Best regards,
-- 
With best wishes
Dmitry


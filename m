Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D433A673AA
	for <lists+freedreno@lfdr.de>; Tue, 18 Mar 2025 13:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5176B89B99;
	Tue, 18 Mar 2025 12:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQW8Mgan";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F1E10E477
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:17:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAbhma024002
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FaaCN1q/n3kjQfPqICNHxVDL
 1mCCzIPacgi5zEqisuI=; b=LQW8MganX/bSqJMTX80JL/g4gJtfrPh1JKfpjZ19
 q64aUn3bocVCCL0XROtkvcwFD2VAfY8AisoTQNcvodZh2bQOQ5RG7VQogsS45D8q
 OobdY3EFwWYqZAPv5ZD2k9IOmddEYWdsVt1EVLd2EEJHKEewEXyYNdxacuFQMH7q
 Ivq7XeWZvcAEoCxNnC5WztUEEsVrLa3lDVZ6V9FrtPdJkXKisYjTT/7F1G8PWy2v
 EXNZY6wTqohJU9Jk1UcQkRb/7aay3c30yrD3YGPlriTZwapbO+9cEvJiDevm4HoN
 IFcmG0etoCmLESBMAF475MfL2gAI1S/hBiKHdYnyEKPErg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbhpwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:17:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4766c80d57eso102789191cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 05:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300272; x=1742905072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FaaCN1q/n3kjQfPqICNHxVDL1mCCzIPacgi5zEqisuI=;
 b=kgNhsZN+I4rcRMCJ5uhwNZPAwO5pNDZTMWeINBuhxtVeZuOHl3O4Gjlj5Jw/oGh+6M
 SwsOx7RvXjHhvDJMmSVVEKseEmuedoVhqhP5AxD6QyZgACiUqgVQTTAKmNfEQ/sk9CLQ
 kgCTjQZtaoKYz1gqQ/Ix75/X+uHhM2S1kU7SFT7SRylcwAe/tnr4fh3iJz22KssBc2qx
 FxGhVubGcTqNYog0Ab55CoabiVikudlZSEAia7t6igRxtu0kvxBtQDQ8IKAMzZnj+gSh
 3wjkdv5Md5bVi+gmAI/+3jwQ6UVWHSnMC4VG7eQHawOZmtqJu636FC4OhRHVt7BiGdb0
 wFjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm5zCaPmR8pCAqDY6p0GZODZf8bLTn76BLlPy+OJblOyGq12AnwObI1+4H7Ke7NeT0zfev7KJs9Wc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvxl55QeduzB9YSFqZ9V4aaJKv3R0F1bN7EvzSQ8WLkysmQTfB
 42piMs7Q9eS6P/BWHCuzPepZaTVpUMZcTW5uzMdjyoS1YFV1aZxwGkDwwLWXqAwptbwodF+6955
 PyHt+dEjzozs+Q3M/7Jw8VzQFUMgLnXjg5vszma72sPIDAa5+AYwM9pNV1/XalrYC2BU=
X-Gm-Gg: ASbGncu1t8GMZoOO5IyY621OzYMh1FPHLh0uyQF8c0w/Nfi3vq5xW7Ln03ssst9KBoB
 ddpJExoa2oXyZKGNQo8f4+WPceGJWJlVXm0rrn+s8H9lG9lwZijXYaD3vEuoSxACpk4fGitEn0t
 1dxso3/bTCgk8/7sTlZxmDj+10A1KWOJssnxgqPmMYS/kVT9eaBqmlKV+GiZST5LpEjxZ42deae
 B4BzPCh2eov4aGb9owRzAldPbzBSAy3lKJ1T6lVVASoovHuEmfY22Kc4Y0EKwNdx0KkfEdBbbM2
 oPTDKlqXTDn07tRqOPH6dYO1TjncVK31bdIp/5iiQHo5tQ0BqEDbRBs3f2Q3mL6L9DEA2Bkk4Pb
 Xi80=
X-Received: by 2002:a05:622a:453:b0:471:cdae:ac44 with SMTP id
 d75a77b69052e-476c81dfaf8mr248672711cf.47.1742300271922; 
 Tue, 18 Mar 2025 05:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPpyCMBm/+FHacTciTYh4rtRvXfyv+VeST5ueZfSRLIXQQ10PAbp2U7DCjEI40J7DQsicDmQ==
X-Received: by 2002:a05:622a:453:b0:471:cdae:ac44 with SMTP id
 d75a77b69052e-476c81dfaf8mr248672001cf.47.1742300271483; 
 Tue, 18 Mar 2025 05:17:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba8a9525sm1640499e87.238.2025.03.18.05.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:17:49 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:17:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] dt-bindings: soc: qcom: add Smart Peripheral System
 Interrupt Controller
Message-ID: <fr2s2ndjzyd2z7m6bsztudyb74a7rdvunehb6qfu6ar3s3i7hf@x7fap3clhlbe>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
 <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67d96471 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=eq-DVYtN1lDvlgNQnWEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: oIbZ5_Qwek_fWOCIJSu_INwoFtSQrcjL
X-Proofpoint-GUID: oIbZ5_Qwek_fWOCIJSu_INwoFtSQrcjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=533
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180091
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

On Tue, Mar 18, 2025 at 08:56:46AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Mar 17, 2025 at 07:44:38PM +0200, Dmitry Baryshkov wrote:
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/qcom/qcom,sps-sic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Smart Peripheral System Interrupt Controller
> 
> Interrupt controller should have interrupt-cells. Or this is not
> interrupt controller...

Well, it is an interrupt controller, per the name of the block.

> 
> Anyway same comments as for previous patch.

Ack


-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4101B8AE9E
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 20:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C21110EA65;
	Fri, 19 Sep 2025 18:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRnz2kIR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4540F10EA67
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:29:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEVPGC021911
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nELkMuG6G4b4hNEzE5++D+4i
 ykuQu225GTPV54pVjNk=; b=RRnz2kIRHqwrjQd99LcWnGKFoqNlJppKNVg6v/zN
 74LFRnDceaW9jKBreZkDEvDKElFeX749jroH92Eb0OinTtrVOK/OLHxnPyg52eqn
 z2yiikSeEf5Qq7G40h/HbIevhMsTjnvwsSXtlHkCl8eCOJ5myA94VAxTu8S02VAw
 tI5ZRPQOFDswW0M1tCn35ZNF0j49zKygeaWbk8y6GNlLGwAf0HzEX6z1J5ivyG81
 mi/zh+GtRBC8RgVZOexYC3lNhqsncw25aPQrOc4CZkbkTJ/DmTWG/hWKgV4UTe67
 +fgKPlWYvjtGzlVqaxWbVoDt/eFGzsZ0juSSyBzxc5da5Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5kgmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:29:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7248ed9f932so35562426d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 11:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758306573; x=1758911373;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nELkMuG6G4b4hNEzE5++D+4iykuQu225GTPV54pVjNk=;
 b=bFi+yFHCiWmV3WLw49Uszw4mxcTq7wgCY7kWiYg0+A5ky+7/O1cqdTaonEaILjSAa7
 yFfwZ1xgWCjrsPpmnl62yptNO6XuRlxgEpEnqbibMYjMGinfPFxwxN2LXv6vFoEAgzT6
 4lpK7lTl2ARnEoMjyW6GTLB+Pgxx7t4Zx8h8J3YKom4GQEPADHNXCa4Ft6FmNUpPfAX8
 Ox9AjuIKAthQgDEbf0Tu8N51Jky/WTyoDP0qGt8cYxJ2ZW2npuIZJsBsUHRO4hYmhRB4
 d9ZD7/goUN/xp+7NO3luC100m7gRehvDF/uxgwEE5XnQY62uYCl59hbHyBUWnUwsbI8B
 wAXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXfAxUgdqyUNYYPgCB6ZW4quKgjn+jV/tnd76Ke+cljKWwdGxYTNGTQWvQm+0KPzpR3DLXRCOlg/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBg9+dD4VVg5vAJqsxsO8nWUAp6XqgfkwaPk2GdDnYHWFQWgW1
 G6NuAT/RMTO0lquQH3dZqFjPjO2eqQuHO9T6N1zXIbmA24N+NFfJpNiDNb6Z/AIRTmMuNqdNHdQ
 NuwBNdpiDITTFwm+mU96N5qUNiO4DC5gdwgrjpCaO1IX0od4CH3JQxO3GtWY0QvJzoEdBlko=
X-Gm-Gg: ASbGncvm/zFpbyJe2T02N8ayUL1R212jZDzAM2JDl4qazDPlxKkx2Xyk4KfxGGwRJj9
 0MCsZMCfQz4Sw7uRGbk0xJc5xCrxMTJWDli5h+MO5VKGWRVlDG2lsxE0LjpxB3Hf42CXDYPOJsf
 LhUFN+7j1Aez6im91aqu865uykijYwcHElXjHwZhlmMNzFjWhYh1vlwkfyHOjFXWIxpaIMv1kZ0
 arlo+7WCQDRoAFOvnwPH7yes6s5jl2n4Pp7BE7ivtNRwSpF8bCPUfkUoCXQVZaCDsmfvs9swxda
 qY12EvzIikxM6vEFD+YtyGPoNbOHVvBE9s7juvENssBVHrJ9SHv3/pNju6+IcCELceBQMmqo8Od
 aEECUhnC62quWr8BPyKqhV/bCvPul1M81RhvlQ0JYV0KU2vGaR+Ph
X-Received: by 2002:a05:6214:212d:b0:786:8f81:43e with SMTP id
 6a1803df08f44-7991a92b751mr45979746d6.33.1758306573172; 
 Fri, 19 Sep 2025 11:29:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1heRt8eGc/n23vl3sA3KqPDKFH72DXCf2ZbAaB5smb4GgH0KGIrCssMBhJrzkGAMEzwdWYw==
X-Received: by 2002:a05:6214:212d:b0:786:8f81:43e with SMTP id
 6a1803df08f44-7991a92b751mr45979186d6.33.1758306572586; 
 Fri, 19 Sep 2025 11:29:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-579ae3d9c88sm958682e87.140.2025.09.19.11.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:29:31 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:29:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 08/14] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
Message-ID: <j3e7f6fqeilaz4nek2hnh7obsvjwret42dkmwervcg3c74o7ai@pz244lhrwuou>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-8-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-8-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-GUID: tIb_PJmV4JDmkONQ5FKkGPXdX2XljIFn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyANqlUrfO4Nl
 S9qHaHkj0dZ6xlJJGRSO4RS0BdncT6s2K91cykJDCP9psjlmGfUqWLzCcFotR+2SaZ7k6G8bkCA
 0lUzw7x23iDB7q8uVjKeSqmqgaV+uSf3g0JPO/tO1Ai/fNCC9gRsq62eNxVaOD+i4JdxRdXXj72
 54NGSYO+YROwiVO4zS1QHyTpNmWnXj/5lkFZcXPD5MM1+TtnFdnfZT4Wupzo3O51O9sVh4AVU96
 lZBVJCbkRXjCUK0cerjNw//O85RJeXl5EoRF1yXgI2jUcX42mPPwaPB1f0jaXMUocUYAWKBYyGN
 4eN8f7UCRGT++3ASwErq6EuDaK9xe8JunAeKUDuPAmm3Ok9ewCzbWCIZ8b1QZiUONxAWr96fLBT
 adDONpBO
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cda10e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fgmTnHYI-UD6AacMZvIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: tIb_PJmV4JDmkONQ5FKkGPXdX2XljIFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Fri, Sep 19, 2025 at 10:24:25PM +0800, Xiangxu Yin wrote:
> Extend TCSR parsing to read optional dp_phy_mode_reg and add
> qmp_usbc_set_phy_mode() to switch between USB and DP modes when
> supported.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

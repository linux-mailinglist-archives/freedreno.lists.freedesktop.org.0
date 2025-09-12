Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65BAB53FDB
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 03:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B76410E08C;
	Fri, 12 Sep 2025 01:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIcq5BvA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B55110E08C
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 01:25:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIu220006978
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 01:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YsVWw194ZI1CWoyM8/QckT8m
 npp2FjAIPhrizuJH+a4=; b=kIcq5BvASDc27V0NaYPfTm2i8yEDFW+b0Y6Z2LX0
 gr9e+Mqnd/HS5R3jxQD/Ls7HOhSCQkUJ4tru+b8ktksPedSj3GLp2RQFi8fNKmcQ
 d7ilTtTwLSOUpW/ajBHQ/USOOdTXARBj+BxFUdp09XFgV4u5QAjGeqb4D9cVV05Q
 CHqSX1pZUDE3wn6OZpwAdjy90Lw7zAQLAiCdlDqTP3NCUYajvzKU0Um7aGqEifyh
 DMYPMHKSVRp1MinW8wT5YfdMa4BtgTsA7lMmyZMvXprg7JoBJ8l5o0bzTJ2nNVPL
 7DHJokCJ/LR+sTPTsovbuXEdE5MXjqFmR5ZrH1646bW+dQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2dv6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 01:25:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f75c17a3so36624481cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 18:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757640314; x=1758245114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsVWw194ZI1CWoyM8/QckT8mnpp2FjAIPhrizuJH+a4=;
 b=klN/4fH5Bm69S6HxWibnZhqxCL4vGpHIrk5t2qds05KvmfI9sIC0f4lMfTDoHXvqus
 UQkser88ivaB1UGKot1BNim143cYzYaPMGRdu5eHegZGyqglMOcfkwOGFb5EPQ8hX70p
 U+TwlxS7sXbwKPakc1MPeneppUmEzCYq1QVPGnkz04zxIPu+2f6JnE+5khhcaSfHAH1p
 Ej2jCUKYcydIYJI1v/PTdNeaBR3YE/WZo1TX7Rrwzn/+dRS6IlqO5trL+y8s+Vprmxcs
 AAFJQXsfKzzkfYd6c00GpSGyaNdMVG+Nw58ktXm5kqk+TnN7LUMQw8S7aSm8dUWSOZlU
 pssg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsBUj7LkmryqeJEMX40v5lzOovHOd+0Wgn2mxV70x/OstUVto/+g4B4R9R3HZQ4GGqXkYceSSkSdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvnCOMvg8AELtEqgxX75ki9WOdi/TbYCAdXOqLcfEXLv8luZaL
 M4reF7UZ7DJ68SbRuEiSXB0voyW8mt+EYCy8NY28mF4190YJkvkBTkc8AQbShupQhb6nKSGkW8F
 POYsZEwRazY9vZDkb3l/NzHSRikF50fN8Wybmn40R6+BBjjW3e2pAFIkDgTkBx/k+STecO2Q=
X-Gm-Gg: ASbGncvLy15qvyojCSs2H8wPTS4ETxPh9ELhofMInQYZC8DV0WRARCyhXRrrvZEvstx
 Tw8Pufn5XcAg1DOcQoOoJGbqSGg8ZbEKzbs6BJQ0cLvJwj2IitPTLt+ibVJ18/qcrYovWe0165T
 dLW+TQc6g/0s87OI+1AKzRgxeNbF7MJRd3vx1zsRL7ITw5dMsXSx2cUcCTTpwa49D9Sry0IvCTk
 Il0XiJvHYPZ+PZ3CoUznePhgSfMY2AhwQJGkDM/p1t0fusGG15yIkuP6fiP7pq8G1aoR7vP/Nhu
 fuQjdcLsTFqruaUxGEr34FMFA+rBsW4ug2+RYTAAabpzgpU9N7C8qBNiJMEpywollf23oUJzbb2
 LZ4y4xG4EeS1oJtV4otxeh5oiONphK34Ev3QZ1JOO+LNPJoK2D8vb
X-Received: by 2002:ac8:5a0d:0:b0:4b5:e7e4:ba6c with SMTP id
 d75a77b69052e-4b77d16e805mr17533621cf.67.1757640313599; 
 Thu, 11 Sep 2025 18:25:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeSzyRo5fxlQ1s5PZqzWjlXyF7vQvka83jPrQMx8jrzjabtE8ps+uhPSg0QScYf/gUsEIfSA==
X-Received: by 2002:ac8:5a0d:0:b0:4b5:e7e4:ba6c with SMTP id
 d75a77b69052e-4b77d16e805mr17533221cf.67.1757640313085; 
 Thu, 11 Sep 2025 18:25:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c692d10sm786907e87.8.2025.09.11.18.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 18:25:12 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:25:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 05/13] phy: qcom: qmp-usbc: Add regulator init_load
 support
Message-ID: <qpcdlcxvu4avnpc2yebrjaptxcckp3jtk3gdrsdssi5pg2yjap@76a2o2bw6gea>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-5-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-5-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c3767e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=mlQFcmInbWeDH1iYaCEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: o1gO9R34b_3qI0E__PW9MjuuyAypabQj
X-Proofpoint-GUID: o1gO9R34b_3qI0E__PW9MjuuyAypabQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX1W6Rb10Zeqfh
 HFBbavdxwRTfiwVirysTvCo8sSGkZu0pmkYQ9HrOxhnMPo9UcOyWhtOZAZfQDHbTt5sjG1TqSXj
 XmyvJ6x/7zareqHi+jUjmAGZWIeq4czffocdGB6hJ7N4Cizfwx9b/3S1NHagG6SLIDo+OTRhXFn
 w7Aq2CILopMkdfNIA6b8Z4C/7wtluwHDJWle0NrjGDYwiEsrD6N0Wv2X1YYLVoJiKodB0is7Qed
 u8KNhp8UnQTRH3wkfES40/xeCFZx5pk/+tEgqSYi3ngLnhZYLVXF9iTGbplHjsvHFqy9F07MAX5
 K/h3wUklSwIhlp1OAgc2ms75R9UGLwDnQhOkAMD5MZxYY52AWoA086X9ASrlatz5nPADaksHJga
 gQMHfhpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On Thu, Sep 11, 2025 at 10:55:02PM +0800, Xiangxu Yin wrote:
> QMP USBC PHY drivers previously did not set init_load_uA for regulators,
> which could result in incorrect vote levels. This patch introduces
> regulator definitions with proper init_load_uA values based on each
> chip's power grid design.
> 
> QCS615 USB3 PHY was previously reusing qcm2290_usb3phy_cfg, but its
> regulator requirements differ. A new qcs615_usb3phy_cfg is added to
> reflect the correct settings.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 70 +++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

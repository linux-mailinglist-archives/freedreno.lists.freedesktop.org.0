Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F41B53308
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 15:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1E210EB21;
	Thu, 11 Sep 2025 13:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VS3/UwzJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0CF10EB21
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B8Vsbl003795
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=020/RT6M8DeqQ4FFLCQkWPxS
 sOM8wzuUhGEMVMCrtzI=; b=VS3/UwzJ4nickQEaH5W6omM0qT27Bne6pWdxtKvY
 kva9j9VxgRpFn3uQn34RfmeypiurpoZPuM4p0SkcaDMU4DzvL7o2Drdm1nVzjeiJ
 w88hamHlP+heFznlo51J2bXy/PZllEaiU9ZAo5E6ejCQqbPxw98E3aSjyrgZxshh
 CcYCwNKOktm9ln+zF0vZluDiGFko6m7v/UjLrIKfaodCN68zRCbMZg4uLrTnFo/2
 kfs1sB1z7EERQyIQtEO5OElUl2SfXEnGAY5VH0ZW00ipKDOZS7kppLlHjd80kOHw
 qGDGPXe6Nrx5U8lj+iLF+ghDo9tYIrzCRQBupCRMvTbAng==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493tyxrsue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-544cb3e19b8so985421e0c.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 06:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595735; x=1758200535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=020/RT6M8DeqQ4FFLCQkWPxSsOM8wzuUhGEMVMCrtzI=;
 b=DZ401Zgkcsuwc/WkWgbLxv2QN8QammLFnbDHa0E/O0v4ZoJmvQJjzqY3gENYZOtq/Q
 xUfqf4SFMjAnfkV8cDCHSFyD0sHBYXIV+l6G8GXwJTCAEQKpPBGbJeUje1Bb8QIVz59f
 OC5xjGwUyfERB/sv2THLByaMUh2T3KLb4vP9E5nUnfVynjAizYzUBrIBVplsIY1QM8OI
 jUhOnXdGxQr5giWMrv+7ZPtcdTmYMIYseAQc1DEKV/aDlJEU0VTGAXhtk7wDdZ9QIu3j
 cEsE/qKOz6a3lom50Bihc/vz0Q9IX8y+8i8PnOegRdsuSQ4pQi6sGUbpZRRu7e/oXa4Z
 kJYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhQPiVtIPBkSVZ10nc1Ix1rHhJ0c1GlFCExGNAa4pvH7/H6FrRFEXr3uMxEbkZZmhvBUQx76wCM8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJB7HZ/VNv3iJKVn9iAIAr1xNYOU7wfAGUGR2FtMTkauRPVP+7
 SN1SZgO52fgrRnfzc5Mt4T3Mhg7T7Hh5GuYch8NO4njPmHW5+0+XUjXB5YwdLdTcBNxMsEFajCx
 vUuXFgUKfqEKOJvbzgIS5UJsY4qc2rSrPhxk+XumCx2dgSeORiH5B1evKfhVFTvzxtODBgA0=
X-Gm-Gg: ASbGncvpai3kxCLk4KP7qZlv2wmOJEuG/sct1DQN2Jb1fDq4xvzKAMnN9Ju8D+w+Vb4
 e+EyDb3OzJYmCo8MzmMWJX1iVjpdnpNpyJKO6lqLY0X7EukQ6LLPjVAhiOZXWpAbG+5Yb1gOt5o
 w43TD6n7SAMFCh++a59/Uh1shQ9NAAfdp5FrvkCbCalNY4VGPnobkQ2x0lfgpDYrTMD+/gQiqMT
 h7y5zp6r15Qfzgim21LV7kpJhMCGozoZAOQ31peM23LESAI0nUDTUkq/hZXARQPBnahBpbjShV8
 USaLG81cFDBwrG/VnbhFlkf+b7H4XZx3XGP3EJJD5GWF1l+cod0A3pcuudx5XXOu7Af6dwNCZJu
 UTt6+CSi0XY2M4mig+hnuHgdWLllly2Ckt/TNT/2TD/c4zUm9uANC
X-Received: by 2002:a05:6122:d02:b0:545:d9d2:a832 with SMTP id
 71dfb90a1353d-5472aeed8f7mr6420478e0c.7.1757595711857; 
 Thu, 11 Sep 2025 06:01:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfU5T4Be/8d1NB+n++SlGmSCbRAol8EPaMIXQXmGdUJfhc5omkFmwE++S+Snmx64VOIIOiNQ==
X-Received: by 2002:a05:6122:d02:b0:545:d9d2:a832 with SMTP id
 71dfb90a1353d-5472aeed8f7mr6417135e0c.7.1757595692924; 
 Thu, 11 Sep 2025 06:01:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a32f66sm398785e87.138.2025.09.11.06.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:01:31 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:01:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Message-ID: <mgbv5zoptfox664jswi3imvibrd7d2teazeuied37dw3ooiex5@lli2bsap7d3x>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
X-Proofpoint-ORIG-GUID: IFbJF8RmUmSNuLGhAs0NNtcDDgWCIgP2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA3NCBTYWx0ZWRfX3I4Wpds8rvr3
 x6usS1LMO5MUXGOnJezr/yUwN386I8F1HqSBZw/ECFK7yGrc+bsO0qt7ln/+sKthoC7D7Xrs3EH
 0l/ERejZ77HEMkDP3EiE8wT1tHBOnto0P7AV98YFKu2Gs3SvW8xc/bj+dk6j5LOiJctTC/OxeGi
 8G/nbya0c2RY+glmBWqVeEBf222iQ5ol7896CB1N/ZUE50NZU5YKyrfVzfQK55jPQ/mJPobh7qg
 NoI/rY5eH/UEFFisBY0fye6JUFwhO3rPQl4B6D38ETS+Y2zl6d9VGSv9dDhAyLaZ9Ojsf7svJvQ
 XqqzDDsPpGhmahAE1oblcR3tAPZ7YrrGFbcuJkozfKhaoFqLXjteyjOQrYh8uFxyRDZplsKltaG
 QIQGT1D9
X-Authority-Analysis: v=2.4 cv=VZn3PEp9 c=1 sm=1 tr=0 ts=68c2c857 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=yi07AWGtMeMy8SJ1qNsA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IFbJF8RmUmSNuLGhAs0NNtcDDgWCIgP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110074
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

On Thu, Sep 11, 2025 at 03:28:50PM +0300, Abel Vesa wrote:
> Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> There are 4 controllers and their base addresses and layouts differ,
> therefore being incompatible with all previous platforms.

... and it's a new core revision.

BTW: any additional clocks or regions for DP?

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

-- 
With best wishes
Dmitry

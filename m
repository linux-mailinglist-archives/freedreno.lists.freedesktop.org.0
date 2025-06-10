Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8333AD45D7
	for <lists+freedreno@lfdr.de>; Wed, 11 Jun 2025 00:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CE610E5DB;
	Tue, 10 Jun 2025 22:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TspI/1g2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195C210E5DE
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 22:23:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPw1L030952
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 22:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2hza23gY3coL4GLirsikjG3A
 jHM2RQT+qzkG3p4icuA=; b=TspI/1g2OXSBthgYyOLRrh6omOIB1ysX+Ho0IDwa
 UFE4/OLz1OkqKVRSYwuo3h70Z5kmmTaLsGtnMMY6Tmg4ObuVwIBR6+J/8Z5azzzE
 9apr4NQuprzo2pR+1uHLxl4Je9JktEK3mCY+boeehrY4XAO02drVYETlCRrEsbgj
 0joXd+igquKPoSJJH7UvrCCLtCZgIInP+dA2fvV9sn0syUuF5r3IoGs9+EiYOQeL
 1PSlcjMxkfPsEVBeTiRjVzuR6Te5OHWx4y2KdWPr6yqL7diZdGWzGbszpYlFo7kz
 mTnKpsnkjoxPI15BAEU5kQ7idKQnXKYLOKraxByxVqGwXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tdmkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 22:23:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso1117038285a.2
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 15:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749594204; x=1750199004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hza23gY3coL4GLirsikjG3AjHM2RQT+qzkG3p4icuA=;
 b=RMr325ErSr6mu7UlgYQXXZTIYzVPurpoE7VC7rn6A89OLfDtbQBgtjLSZ6Yc4DPIXB
 /6KmVV3o9dnSS9fe0yDh69+ng9IBJ149BRQZsJbpESRgv4Yx9vnOAV5/khUr0SOD9Hrx
 bz91CC9sj3xGr91s040TSXGqICs08JlWYVEG5Fx6p0jpGXc/9vskwyM3T9In/X8Tn8N7
 T7DhxJFftE0FCXqjNOe3gAHlF2Iop+HKrk0NwVL795O6MPvNBdz+bK6W3rhvisZYqtkn
 kJx8t2QjFVSRzimygHQd0X34/+hKgkrZfUDacxgmDm/O7LWKPVqyNZaRrKFgk9vwJ42x
 gzQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4ay8dqx0SS8CXMPXjPj8VdLJuJq/wxycJoeU79G06B/CN5ZEhUdiImqdliHy7LxdMT+JZkExsLYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcPk8pQaXtmmfJ+gAXEklBd2uGMAQDWzh798bxn7XNqwKX5Hwr
 lXk9Dqiqh5p3p7lll7c6M8v5sJzqr4WoxLhcISiFok7bMkx15OEazhIv0f77xbq0TilSjBBjnhJ
 QPojerpvjED04u/bjjyJaSaygvaB0JivwCX8T2xLOOWmXbennW0uFpgtKBMVY0UYOjiihWt8=
X-Gm-Gg: ASbGnctVvgIfCzs55gbiUsHKhXiAaMOrQNC9DSv5/bosXpwnlbwz7XnyAwhj4LQuU+E
 KdRyB9YEabHRBT49yTamwV3Dy6SEGvBOnqtrSrCTp74h96DpsT/O4z0sDlnoUsLwDDeQEwao+F4
 z8PMwqIwEBwUPnHclL8BXyLEAa0ID8DuiBNVR82kR9xyc/Q2ukD5FKM38NO4eeRhMVDp98/0oih
 FfDwaATTY4vtjnIwMMFwFsqJ+ZWu8bxqecGOQGDU9Nx2WCPeIGVzltKr50PKClbXCDugI47YPLH
 KHah/rwP915/o27uWeljTOCjMuK5iM2YolO7CMcFpUoVEZFzxhMMA2SH4PVM54ZEF9nWpW40J4D
 rYNFNc02MAGmMVU3FTzcYz+vVpRJaxYYLLsA=
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id
 af79cd13be357-7d3a89bb112mr168582685a.46.1749594204436; 
 Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCcqxVLVUJFrq+O0cQ9j5/TPx+SAaSrKInIQWb4KK+4mCxXHk5ZJ92VOUVg+qUAfhrlPtaxA==
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id
 af79cd13be357-7d3a89bb112mr168578585a.46.1749594204049; 
 Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55379b2c854sm1321061e87.142.2025.06.10.15.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 15:23:21 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:23:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 07/17] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <w4napqk3loelkhl36gvhke6z6xg4g4xxymxsfjn3hmntkj2urv@bshk4l63nfrn>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
X-Proofpoint-GUID: BG2_gR3wV57I0D-Jj2lrgJHsx4REkNG0
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6848b05d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3n_StpEWJ1elpYQgr94A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BG2_gR3wV57I0D-Jj2lrgJHsx4REkNG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NCBTYWx0ZWRfX2Gu6ioOxMXM0
 /lVhHUCrY2QfZGJHfasjyJtmi5zT88G8Wlx5Dh6qpuLJsnVNyo9b4vdMk3RcPW/S13rlSUk/o5J
 K0pnneI2a/QWFH4PWHzQh5uPSAxpC5T/q1uNV6e9TlJURZIhky9rDV/fsBfXHroNHp+5Zq7FqTV
 mfUCzxJ2b/18ZfTkSx/VHI/uEyZtf4CsiAx68OfmXwPXEuZYLgDsc0JoNRfx1G6g0It0+pC2PIx
 Eo9crLbcXHyD96qjWTlzFgp8/47WecVSfNPdwfZks5anKqJNoExicyfb1qD7Qq5yzhzZ0UdF+iD
 t0iBFHH3idV4a9savSvfh01HwII1vGV3ZKBL45UIdpBaBOvrxej9UO8shdQ5ju3Rc/XBrRHrrTg
 mpJsmbsAd5re7OVa+mFyIt75uE460Pxxo7bsxCzCDGwgQXRKWHKSSxagOAVZxhPQl0cROnpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=430 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100184
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

On Tue, Jun 10, 2025 at 04:05:45PM +0200, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> masks and shifts and make the code a bit more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Add new line between declarations and actual code (Dmitry)
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 16 +++++++++++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

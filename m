Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610F0B01916
	for <lists+freedreno@lfdr.de>; Fri, 11 Jul 2025 12:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B13F10EA0F;
	Fri, 11 Jul 2025 10:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgVA7m81";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E3110EA0F
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:01:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XA3O021865
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=NgVA7m81R1L9A0Ki
 QNp4kFDi3N8DvO3qx9RAcYjs1jtC9/B+avlbDc1rtVhy9F3stierm1OKhJXjyvGW
 YdJRQ9sJZI2dq1voO32H+V90S5DBNkGEzMB+xaAjR/XUQqiqXKUbmfFIb4pfvmVg
 addsweOBBLqrhC+UeeNjdbg6BndSLotgYWOKAXr9XGGsXN938CxJNVJZZLif9/67
 bTDai8X5rgEivv0G/Ddbk30UzPRe6GPhQK07mI7NvCLN/vavWRbSaFIQIrbwsqW6
 eGBhsOpspzm7+h66u4RlX5bUzXbU/874gi2Q1I2OiV3jDc5IUlMIMm7Q1MkP6jwn
 rNhUlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b195se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:01:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7de3c682919so17715685a.2
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 03:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752228062; x=1752832862;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
 b=YdeLlGgemf4d2BKUhGBpI6clTK+oP4ofd8+Q4Per7HBfx62wQiXWKGcFXETuPyBtw2
 fjnuGmsmmyzLe1eIC/N67qjXn8bOazcWD2FFwVjLZq2sVTiRVLP6Z2JfEyLcIQVZFRrS
 QZwGw3cKsLx5hNw67019prxwbyPF0eUbwNlaMgtAYsQCts+VSQ7nqAOXgaBIZsqlO7T2
 pUPKE3x2pGxYPw9jVT3aj56WnmIEqiLuefAsyAs8CvIWU0yOxA9cSVcZeX21eCIMttCe
 MRNcN9+foP9TlJ73y/aohWuTqHfw0wwgU1TY26SnngPpKKg1eqyO+nt8ySIPKjv37xhP
 x8Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSunf8vjG3aMlPiqJzVIH+5xTMkZcSIweHJwVKlnFwPfVCYbalPLuQQoFBcEUNyMG4VTDOMzJMN7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yymo/37CeMEcHMkMtWTUFJKnT6J44fsqK8ZqYffuO1xKUjCuJCi
 hUfgx04ZvLNMQBQb9wRij0OqdSI3h2HI18yo6zUnfm+UxviA1a43GGZ8NQJrQqSTN0ojz01ZY6p
 YynXJKlNn9jOInco62PNLJpWF9SI/ZRsKmoVOetByqTfx/rueUOPKNH/62yZxPhn7kwS86ew=
X-Gm-Gg: ASbGncsQdDoI762pj+A3/K8MGcNp97Ix053TDir1/wQQxv1f5cRzJ39LoVMHVoGu3Bo
 xZZljTTGIl29g4U7zxrRXYXIM9IM/lvefEUouRRazeLh2nXu6nPP9Nit8LjBWA3CpOqAoBadd47
 qpaEyPkQ4bWEqS4nXKlAQaSwWCFf83v8jDC5vwxG606SU/7q0jnIaqFHK+mURtWC+wWAhVLCekR
 iJBNz/iU+5vzGL56NXUpiXsDKyK0I/zgPGxlJiSgbyYiNE0//U9lNJGwwoUCD5cHlNIsehUK0k3
 Tn8OdVOVk5hDXmPquw01OiLtYVDqW1yT7SxRLsYCYck9latCMROuvCVpSWSTSbKKt4ZPM/bzWFh
 M2GQsuoWrBZNXFKg8oIPi
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id
 af79cd13be357-7ddec077b97mr142428285a.12.1752228058074; 
 Fri, 11 Jul 2025 03:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLY0/uyOhHuHX1X9pWT4ZRBIdqoYlueRYMn0zZIdfXxI0Ouch9sgLT86MrHZruF7j7b5jRXQ==
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id
 af79cd13be357-7ddec077b97mr142425885a.12.1752228057424; 
 Fri, 11 Jul 2025 03:00:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82645c3sm274825766b.99.2025.07.11.03.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 03:00:43 -0700 (PDT)
Message-ID: <ee4fb01e-4fc4-4082-be96-3be22e1769e3@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6870e0df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX/tRKsPMMmiLa
 jfkWSfRTsQeaJw63YKOh/H6dASJj59w6wg2PURYQRN7b1NnwxaPgfoR4VtFGfUudw0Ob+wjOcDg
 7FPNMhQhnBbEuVUb2TVsNzO3HTVAaIbmCC9s/kmosSP+8H5rcaRl8VCt41aO3FMu4StOnzY4PwI
 jqAvXKmNbao1wTup4O9AxSeiphdaaTxSd9IPi2B9zZmd4uO0Ha1iOFcdc65s9bJuJYEkkgsU+XZ
 lTkcSHlB/mA8EPVCDCaFT9XR1ZulJ3ICcYvkNdMI1/7B3WOV5KnXs43xxB+hQ/ufe8siJOCpwRl
 Nk4aqf6hM5x3f5dQwzCXco+aK6792Nkkma69skKlIbsrm0XPAydS+HSTNUoRxHEH72f7X0cH/dx
 bbhZUYek+mK7m6ag2SA+ow+ww2W8GE4hocE68VYqNL9qxY0ixm+A0UZemydEMX/QqH/Jhgck
X-Proofpoint-GUID: DNDDPflGWzT_3WQKCxmr8xx7qA--fh8g
X-Proofpoint-ORIG-GUID: DNDDPflGWzT_3WQKCxmr8xx7qA--fh8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=739 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110070
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

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BB8B0190A
	for <lists+freedreno@lfdr.de>; Fri, 11 Jul 2025 12:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3416C10E26F;
	Fri, 11 Jul 2025 10:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="axw5SR9u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D0E10EA08
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:00:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XADs008125
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=axw5SR9uMFk3cf5O
 c65Nu/hMWRZOrxPT5SbOCqJIjVKnOvBhRE8X0fQ6i0KGuZLwsJI0EMBLgz44VhIW
 WcVUXjWHyNwtSFfylk/BbF+Eaf/rUfoS1cG536ujCumN/i+ut4Zxunksp+PYpzh7
 9T05vbaYGayHfh2hWaTcUL5KISKFpUwpRwKtAn9d9LconQakq9FBerVWsIjzrkET
 twVdqZ98NXYE937d6Lqi2sragbZoGI3siTh6HPt3YfEY+J9hwAYplrs+on2CVKB8
 qWsm/cZD23v+ESTat3Gkt/SyuF/AK3Lr8QaRKSrvAKbwTUDr9l5tbRMmg66stqP7
 Qqv/kQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg85d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:00:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7dfd0470485so12237985a.1
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 03:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752228020; x=1752832820;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
 b=d6aXHgWmeVmWVusBXDJfFxLMlsNhzf3lCfgLKzYE8vxpmD4b9OjBVby2L7vvmHVT/y
 Z0Ys5PRCVqEEx/F3k9oNXHZNjpsDRZSGbtr+VcHUo9Bs7su/WErkSs6/NE7U5OHh4fIF
 j6gBmnunVCHy/2VXyXsUubtf2KGERJi4U2oFZVJ39wV9V6AGZ/yRwauFCWJlgMGMxu6U
 S/5IFqn+1mwxcZOeV6qDECpoubSrSjFyrlPsZ2EMVHG7NOrRRySlrr/7rw579HI6K04H
 B4j1wsfEHSO42EVENS4MNhxGLu2MKjml4u+ALccdF5ttA2g0zea/YoL3MeqQSnK4aVN6
 gVhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDj6hC9cFNInrhqTY0mzTVvb4VDGbTG9wTfCXht/LkpQZIolWZ1CgT4i6V5iNBOCqmZjTqPwwmaXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+1X5/RMKb80b34GiAkceDDq1Rxk30/jO66AQjLdiPbeW0AWEm
 o+/GXfL34cOz8L+miVYzZnYagFBlzCVJxiDzM6wd1NohIWdkbCSJyiTEveCxxRGmweQLGykh5qj
 9VJjeu3HKhWJvvoYjxLjxIB9uTasO0ojyo8ItdB6AinHx2RauXRl85HlAd8dobzPk1ww2LlQ=
X-Gm-Gg: ASbGncvLDYRXFvLQp4v9rL/jLtit0fFS1ClqYncI/ATo993vroasys1qbLWvbY8Zm1n
 B7Pi9jCRo306ScwZIBgK+4out/XlZfPGjYtk3U4MFu5m/tt/E0ZTJ8wvEQYReQFXEs4EV2JxsTI
 gsURJPoRGtvHVIxXTiI6viYmzmm0tMYOup+b4sCkx2nsz+/1A03vtNPGe2LV5Zj/CFQopSEdG2o
 vlIKQiuGL9vkGNFiUBr3rzSY/Ef1jCiyTift1LOMSeEKGikp1FnuhRA5h+Ms6FQ+NPzT7MJqWGN
 LYn1NHBvvmq2jhSq1qPCeB6z3yGblbtxmZGTVxpDBHKtGbs6ra8dWm7z67CaMBYiABXdC44SGAL
 Mw+6oW9iR9hL1lbDb0Vsr
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id
 af79cd13be357-7de97c2cee7mr101576585a.6.1752228019711; 
 Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlhPKclj6Yn0L7q+F2xj0Xt2MfgZll0J2UP/WxG5I7gSC0cNE/OxkTsOoKzfyHayBKXzvFZg==
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id
 af79cd13be357-7de97c2cee7mr101571885a.6.1752228019106; 
 Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e907c7sm276215566b.17.2025.07.11.03.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 03:00:15 -0700 (PDT)
Message-ID: <9b1c3318-7d89-4fcf-99ea-3b446793a758@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
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
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6870e0b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nmjgHHjvUnLRbdVQJ7VyWx_7sk7wW6ah
X-Proofpoint-GUID: nmjgHHjvUnLRbdVQJ7VyWx_7sk7wW6ah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfXyUE0L4YHwzBV
 JE/uaoGetVMQ+MD3p4KHtrdjjNfnBOfiN0jpalKb121OkLJhjwa76WbVOQFTlwyg9ciN0qipA1S
 ULtuBnMcxqV04kSsfNizP0DyGEhBL9Eizm1gPNP2Ew2X41P16RBPFYwkopWFzXv1JiL0uVpGft6
 JqiO1/dNN0UTezar6P9UHoWM/DBTYk7D9/4ElXM9XLJrlaREWqty0VNFtPYwxWAKiOZaLNgTal5
 MybtgyZfCMkriY9ADnS0fMvBwnalu9uOjgZGNH3mFt7N/FrmX7S+yP6chQ3+wNJ45OhKpzjjxg2
 qB84RxnXd6FUQl455QkHZKWbm+VnJMyNhMI/ijzjWOJSy+Q+11ZS/8XnYA4DGzbySLpI9zw9LzD
 KMoFEw4gGQNhVBJbf1KHUKVJMAQ0nwdFVdUafDQuzYektFpK8V3ha3YdZKRlPnUOWUqaPmW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=804 classifier=spam authscore=0 authtc=n/a authcc=
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

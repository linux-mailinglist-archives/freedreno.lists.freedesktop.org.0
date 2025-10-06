Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A57EBBDA1B
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 12:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BAD10E08A;
	Mon,  6 Oct 2025 10:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAtN7DHy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FCC10E3DC
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 10:10:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595LXHmh014970
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 10:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YQ9JTnhy7/VFugNTC6R+z9mSCDzzqwGBYOtYIqduWzQ=; b=NAtN7DHyq3ZwfClP
 4BcHB4FvWVWkddyQhEj1JSJQ1NI4EV/Xg5kV44rS7aNrWzfVxun8QvSl3tATi84o
 nTeNbr4AXqu7YGel83kYMryezB3tUzENWb7p7o9Z1KRJ8LbE1UDKMI+5U4iFYLtz
 nm5OELZyVYoQDuHh23ao29jFFhX048LzURZ6GEnuW/U2c0hiDL+KkIGqVhCed+aH
 5Wuq20ccJqcby2ltn4U1YLD+j6tLYWjngzqxXZpCKHvIM2J5g8KCGfzHvL/YT17H
 WWDVY/oKXA4cbVVNTGzEa0Sy8FC5xCZk/ClEUyGyEnE7sruPkDqgEyZWBoZAbyKO
 vEWGmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfjp8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 10:10:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e231785cc3so20508861cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 03:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745410; x=1760350210;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YQ9JTnhy7/VFugNTC6R+z9mSCDzzqwGBYOtYIqduWzQ=;
 b=p6yTsAh0dRYxKj2G6u1l6AuQpU0ZS0V74TVMc+xGDvxLFkwnu67JvMvRp3nH+MGXN9
 XRd5hprBNenYdJ5Fijsuy4S68jm93jxtoQIl7Wcdxm78AEA3Uv2Gek9Xwg4YvVcevse/
 ChUURj42U3TgspMHy1e/QdMLoS74ll0p6vrIzHKDvRJzLNeRaiuVXqFOe//jPSPoLJN0
 k43ts1fJC6Yd0yuqJfxJqkwLKBg3BqFBRncdy2UuPycxtgOPga7e4letLStaaF/sUUYl
 MZ/pFmVCLhYbA1iJpBf4/0GhiQyI0wvgOUSplqqUKir+4K5WWib/zxU4YVy6DNUQj3Xf
 ODlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfpGDu82nW7G42vO01dtpocwQbC0laaeHqOLqW1FML+PUO+JHRyyMSM2vaXRJvtocFezswpHBVsCY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycrBkc7Vo8vwBYWufxIWFpwj2VPrf7nn+OUqna//RwvOkCgy2b
 uKyr0IcB3/bns4TkF2Jrwc10U8nAn4xJg5VlSi5p4Cv+iuR+tv6NuTnLe8W02RLSPQPVbLLbaym
 b+ftTFjkzKjSAurUJVa3FemCvI1o/K24vEZekngXdopMSl8fFbaZePMbhqJV8gNqp5kX+y64=
X-Gm-Gg: ASbGncuwfTvGBbMz0EdE0DRMZbpZTJRxNtWZrF5/xv7Kp3OxF14wIqDQZA5SQj69xR9
 CXNYuDEwVJcIMYTCS6DIQRuLeKnPkR9pgyVViBuyWetra7o3IR1LKKFIBtWGiuvcknx/918UyMs
 tdTaqJJguGynxUJp5GxGhwWy/4EtONcHZAj5F56cALlWgl/x+l2pVbjLNBMi4KJgyLYnEt1OdtR
 VpQ6SgJ4+sB6JHVmOX0kCR2BQV1nCUDh86IfcujOoQGYrfiVY0blPvWodwiQJiSMDz+fsMXZByp
 4brkKbMOCAcpFaFI4cGxIHnpoQ7K8fLgx4w5A8AOD28eRejSI2+5lHzomUJVqqSESo6qNTpHzCC
 GDmOsev4+ZU2fhrKfQ2YmDvySSzY=
X-Received: by 2002:a05:622a:60e:b0:4d8:8b29:228a with SMTP id
 d75a77b69052e-4e58cca7939mr46373771cf.3.1759745410343; 
 Mon, 06 Oct 2025 03:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkIaT5uOBugms5gwERrur4Q5H8ZrUny5IMG2QAlBQl/ctjJPOfhlmFXcEGWS3cXzuKqN18GA==
X-Received: by 2002:a05:622a:60e:b0:4d8:8b29:228a with SMTP id
 d75a77b69052e-4e58cca7939mr46373061cf.3.1759745409696; 
 Mon, 06 Oct 2025 03:10:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486a174a6dsm1115628966b.90.2025.10.06.03.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 03:10:09 -0700 (PDT)
Message-ID: <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Junjie Cao <caojunjie650@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
 <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
 <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o1AlHeK8d2vI12yThFG02SEMjXSLpEhV
X-Proofpoint-ORIG-GUID: o1AlHeK8d2vI12yThFG02SEMjXSLpEhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX1YejCy6J0CZS
 uj2h9x9Kk58dw+6cUzidhVLe21qdXRwlOmnjVIw5vQ+vZI1yyBmcldk/Eir9ar6u9hio+LM78Ji
 ovQ51/Ehvbj+qeIILr4ATS3Bg+9K0xZGXxzNU6k5Zh14ixPxkVe46joiqKIxQonHwAAbyEeVhuA
 hXqzwM+yxT4ElEbnoRnfqrDfsU16qFICnKQgwpIYy9Wtr3I+t3ADLm0c+n9LXugxkrOntZeWPZl
 eyiNQoWMO74HqbvUJ/DW24e803+QhU+X356zmDZ7+ywcbdtpqszPmm2GXk9BCmIsRm64IGF394m
 XTs4WNf17jS4uhDBAe26jfHyDEi40N+6bvw4KMNRvkp9XRa1KjXUjDmpQtekqwlRmc4KitpCffQ
 gTCfGF9YIkW1qUURyUNEGuoylchO0w==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e3958a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=0RrB5Ro-Ny3bBzvrWzsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135
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

On 10/6/25 12:02 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
>> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>>>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>>>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>>>> tablets.
>>>>
>>>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>>>> ---
>>>>  MAINTAINERS                                   |   7 +
>>>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>>>  4 files changed, 455 insertions(+)
>>>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>>>
>>>> +
>>>> +static const struct panel_info csot_panel_info = {
>>>> +	.width_mm = 250,
>>>> +	.height_mm = 177,
>>>> +	.lanes = 4,
>>>> +	.format = MIPI_DSI_FMT_RGB888,
>>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
>>>> +		      MIPI_DSI_MODE_LPM,
>>>> +	.display_mode = csot_display_mode,
>>>> +	.dsc_slice_per_pkt = 2,
>>>
>>> As this is not a part of the standard, what if the DSI host doesn't
>>> support this feature?
>>
>> Shouldn't the core gracefully throw something like an -EINVAL?
> 
> There is no 'core' here. Each DSI DRM host manages DSC on their own.

drm_dsc_helper?

Konrad

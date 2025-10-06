Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B47BBD6D9
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 11:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0052A10E347;
	Mon,  6 Oct 2025 09:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bs0KoP7E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABAC10E347
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 09:24:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Lv5V4011725
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 09:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7K60QlJ82w8jj8i5uoLYN3GzdWOEyO3RBRWLo+2B9Oo=; b=bs0KoP7E4K2DZNRx
 c80iuQ/mm/ori1OuEZ5GuVEAym6B5UN+EQuyacoX5uROpeqXpCBFywcg3K/kknI6
 wOtqPLjNhmCoRphtuvAXQSe2OUsoZRQKif/xM8lfEEFtcaZHgMc5CMW7hq9aW90T
 R6ATtYgEjtRkbOJI7KaD/8K8U8GdIOxonMLySv8yqIvOzdis1lVWsHMq8Z1FDEkK
 WpucnlZlA7lmiScLUSROhosWOIjP3rvPvxTCzkIUEmX+JoAHlyPZCk09gVqvpwOS
 QKhylzGrgeH1PsUfec9YxCopUxWCsTXwTBUbgYb7cDeoyBmrslQFjrCifcC+j0kA
 82X2/w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgkh7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 09:24:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-795ac54d6f8so10006246d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 02:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759742680; x=1760347480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7K60QlJ82w8jj8i5uoLYN3GzdWOEyO3RBRWLo+2B9Oo=;
 b=dGXdFSSl1eMhNoUdhK9zLlfMQt9+Blt1+5/0MkkDiUKA+Jhq5RjYO0KdAQwCMhOezk
 81BPqEcUpDakcXJ0xODpGu6wLBn9jxpdeXGB2YderTRFSiO081JMHrKbv0yz6FHso1Fr
 hhuIRh0Zx82d4COiXajhceKUYNa/ZxiK+yCOopOx4zRy1Z476T1Jg1SLM/aE+TWyKtLC
 XgN/1105e5fiGz3dPozaYKu0U2yNKCAmB7OD76QytQhEceG7mu98GrClfbnyEgL7qgLw
 PNhrG/dm+fRoHb+TfApGfq9P5u2RbCgHya0yozyrvawB7mtk4Sw5eMtXZreP5dhze6nI
 sfAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD7Jj1/IDb3+8++7pxXKnqbks5ItdkLifW3WU/b2VYLJR3ng/g//xATRRaaR4Cgri+cwvTn7Hpm4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgvXuZuJpms1ruG1YEU1wD/rvtWH75vk+y7WBlfzKlsUre7mU1
 ITt9PeXqeDoqtho25Ns5YyVO7LD6tgltkbZnvibdvHoLY4M+NE3o84oAksFcfSg2qjDSpaDFuxc
 x4XEkwtXUl5zypAyjsj8jx5vDLjtVJBMvNuQKWBE/H5iZB6w2Rz2lLPJzZHJJSJ6Sa97ZRa0=
X-Gm-Gg: ASbGncsbf7705iaUvAHC8nc4pvLVvt5atHRa1NJmQt1XGkkRoDwuYYGJ42u7JfHVkWU
 vE0QPGDlqJ8pWApm9JB5+SrZuguyuufkrXORiqLHmEbNeA2gbJtzGudmpH2npV8Nt7l+Em95aRZ
 dokdzk8Ti3bt53PjbTGbnnx03GjIeuewHc83qSp+nBeewsUIZaaolU3cABwRDl6CkjqYGx9gBFa
 9JAct1UaYrNMyuPIEMEHBEEKYLQGI2EhsadlW5onfyjk8V178LbRCaIWtealLx0IUjyoB8jxdyH
 4V4XfYoGk5FPrYbdHsMFyBsgcjg3Az7ThVVBVjIIjKh06QjZbv4CwkwtYMAZlS4CVUa0efgkGB9
 +HxYK9cUFx3IvTxyxqZQfarFkk2M=
X-Received: by 2002:a05:6214:2309:b0:784:4f84:22f9 with SMTP id
 6a1803df08f44-879dc8cad86mr107666336d6.7.1759742679821; 
 Mon, 06 Oct 2025 02:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp/ysV59MYtgw2kvE1S9hkzkaZeuT8sanAw6VLuCHYzQ6S4o6+kY7M3XEpDaiVC+6tvUGVqQ==
X-Received: by 2002:a05:6214:2309:b0:784:4f84:22f9 with SMTP id
 6a1803df08f44-879dc8cad86mr107665946d6.7.1759742679281; 
 Mon, 06 Oct 2025 02:24:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6397c9355c3sm3510239a12.0.2025.10.06.02.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 02:24:38 -0700 (PDT)
Message-ID: <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 11:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX0KwDfHx59+H7
 Q86wvb+2XWSP5/cB2rs7kFrfT8btxWYWSSwZRnZm1Da7E3ePXk5L4V7Z27EfSlliDu2hfnvxilT
 MyQioboOstFjn3xdt+V30Cb97lxQ7cEcdKZFikeGYLffj4hlbborGEskYEuRP9aa6qcyjYsr+xX
 SepISaFDY/TOflSMG4fubEN5I1KPsfTncyU/yre6FTF9I/xHIV6Pu4uMBxlQqL5m6CoxCvh4HLG
 5oYExmKVEuacQCy1G4QRvUpDCQ6J1XzdEhYyTwsOaiFArL2cuhoucEmTb45ZEHVdefnbfSS5AKb
 PdtOgdMQx+INPxBA7bfejPdCvmRymyff7rDH63RYwkTDCuatrgAuxSxh7FXdHYp8aPk3me4eJpc
 QQFY/F/5gxpGTwi3N4rx8vEFzlURqw==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e38ad8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=oCkFgi9b2cravLXa5egA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: MXwn5NrqCSzbLZ5bFQ7GGG-xcUYV43Oj
X-Proofpoint-ORIG-GUID: MXwn5NrqCSzbLZ5bFQ7GGG-xcUYV43Oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
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

On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>> tablets.
>>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  MAINTAINERS                                   |   7 +
>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>  4 files changed, 455 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>
>> +
>> +static const struct panel_info csot_panel_info = {
>> +	.width_mm = 250,
>> +	.height_mm = 177,
>> +	.lanes = 4,
>> +	.format = MIPI_DSI_FMT_RGB888,
>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
>> +		      MIPI_DSI_MODE_LPM,
>> +	.display_mode = csot_display_mode,
>> +	.dsc_slice_per_pkt = 2,
> 
> As this is not a part of the standard, what if the DSI host doesn't
> support this feature?

Shouldn't the core gracefully throw something like an -EINVAL?

Konrad

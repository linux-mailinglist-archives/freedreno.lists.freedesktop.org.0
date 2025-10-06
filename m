Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF8BBDC86
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 12:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22D010E413;
	Mon,  6 Oct 2025 10:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUcwFQ9S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7DF10E412
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 10:50:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NB993010297
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 10:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IN3CVmizwhnegBcGc3ulurAszyJXyt4uRPeWQ6uV/vI=; b=WUcwFQ9SMmiTZbx2
 NCNeZ1nWtZj9SZeY0FBSxzXMH2IzPbeI3uKZPRyDG5mIBhrMbs10/bHJuffXN1S6
 48ULwM2+mereT1CMxjpteWfk2W6DE7SpPaMQsKBSaw72XyizRA1Vb59NKoU3BYF2
 kN/HEYqbQueAvdOe+N8mgH21IY8fPnz6c8f/WGVRE8w18TQTDEZPzYlp5pOUh0lf
 zq+LbL8Whz/R/nlEOxyrky6T8KZI+AHAWTJxHzZr4qHilz/JFh5CmyACSz8HviOr
 Spq4Ys3qsT8/OfP0FULlcV0FUoOP+wws6TueECzH/vCxhsEMrC864LP8WoN/bm5A
 MH9+MA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1kjqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 10:49:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4dd729008d7so11168661cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 03:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759747798; x=1760352598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IN3CVmizwhnegBcGc3ulurAszyJXyt4uRPeWQ6uV/vI=;
 b=SQ7t8elJK/dnkYDxA1OHray3Q1PkdrVWsHxi48MP8CeSOwCra6fAb0AhV7njFWtxRT
 T0LYSkdgMH0y1/BnopYB4kPtKJw+VJ9PDRgel+hHDM+ZhlSRyLaulvlmnTpGVOJJn7H1
 pIv1NWCyUM08F8Im4P1Cf7wXf3RwaBmWSXZYpN97iLhX4oynQiTGc8ynhPH8VODqz6+m
 vuwqet9JqzzGXmagplZIO40Qd2v8DbwJ5PQaGjrnrNPtGNBE/TP35omdzdsnMiAe7Nrj
 VKfzFERteqYMNaiELYYMO5go1PIaET6AuKLaBsBhED1LyaTHvXHMX3jsmdh4PlQFjm3/
 X/FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjxDHze2VHbwE15UiFOnsWCA5L8vksHamCw07ulfNhnWFvmDpVJkqvr6NOHE1W7A2eP9LhxdCCaGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbESvY3hmLLpHVsp4XqZskM+S4KDEBTg1ASGJGCAfkUCic0dy+
 yrEkETZKk3np9noDJPIARqnMKR2au5Lkyt4xaU3o9e+vcWK+TLUREwl8BaSa4DjsPSLDYXHZObT
 mxQjP0L27f0YdsDGOE0qiJnqIN/ur9w3k3SFXO4gQAXFWH8Xvu71z+tTDtJ4KIQV8JlmPIC4=
X-Gm-Gg: ASbGncud+WYqba7+WVYxeu+XUakYGcIsqxKr+rkETnR79nHipmu8UgI/nt1zBCSOhe4
 pMsbk8hgwGgP539W/I5UeaYJfStz6tyukgkKKIYWljqMt/MYvk+OOCY1Ytd0M+VAFHcPgsJevx0
 okQwUAssZ6jtyHGgXRgvypng4dQ8mkW7pSDP6nkxRUAEPKPmtJ46uRhfhq6kN9kOUqxiD/x142g
 kPIbs9zuBWya8yRgXrrTSut2w9AU+KBDhrk//ufxAqj7MsRrrDIWyLVd7pnPuXR6xfolhTePcsI
 iHfMO/GrrFygOvWyCQMS2i3X5wV7h2n88YUl5KVX2cbKhqWGCGSA7QXcTT33XHW7Ct+Nv8MqMJ9
 mMIImC6EYSmenyefBWtwespTCkTE=
X-Received: by 2002:a05:622a:60f:b0:4dc:fc58:c50c with SMTP id
 d75a77b69052e-4e576a45606mr94443271cf.5.1759747798223; 
 Mon, 06 Oct 2025 03:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSEU8VjnAr3dc4CRE1tKa0vgiLD4zAxaPVFZcAL5lIiyFY/V+S9ZVpzOWmv+pNPBnQHAcwzQ==
X-Received: by 2002:a05:622a:60f:b0:4dc:fc58:c50c with SMTP id
 d75a77b69052e-4e576a45606mr94443021cf.5.1759747797738; 
 Mon, 06 Oct 2025 03:49:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865f741f1sm1118572366b.39.2025.10.06.03.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 03:49:57 -0700 (PDT)
Message-ID: <65d0012c-4c06-4b39-9375-89d635f8abeb@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:49:53 +0200
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
 <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
 <2do3dk7gqvbloocsv46t3zrc4ghvhrpiqre6djk6heese3wz75@dlqwkdsnrkbr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2do3dk7gqvbloocsv46t3zrc4ghvhrpiqre6djk6heese3wz75@dlqwkdsnrkbr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Jck9Zb3nulEF6Gi24QaYYj4OGULJ5act
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX5MYpk6WbH8D9
 2wGETRIPeEd9LKShoTPMbJkUyQckizXMP0Tl3+qDH7JmzF1b+ArFSInL7R9OT4IgpCEB6HPYV1N
 4yO/h2kvr8qC3/vft68KyfH6YE3Zy4b9lFyqSlYojGepL7uJ/jjVN0LKblUOaf8fUdGrPrt1Ne2
 agtJe4UiP7ANwzKQTt9DI9UAHlnub1g4KvWXs2aTXvHN/meUQ8P5yuS7ypbnON1lPCVxLObkc2l
 l9Yp3tLNzowfmro7Luw07ET+prqqjqbyy1NKXd1xNqamCBZB9t2LTKCDLCT+9nql71hXcrzFOGg
 6ng35Ll3jeFRhPCOZAYKuK0iPXYHPWViKw1YxVTemUrcA0Al+7Q386TM861eox8RQ90PUs/USqt
 gVlVePdi2Gw+L7p8bIoJ/WpYm7hLfg==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e39ed7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=zTkMZ0gcjxiqpFU4bxAA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Jck9Zb3nulEF6Gi24QaYYj4OGULJ5act
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
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

On 10/6/25 12:39 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 06, 2025 at 12:10:05PM +0200, Konrad Dybcio wrote:
>> On 10/6/25 12:02 PM, Dmitry Baryshkov wrote:
>>> On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
>>>> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>>>>>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>>>>>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>>>>>> tablets.
>>>>>>
>>>>>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>>>>>> ---
>>>>>>  MAINTAINERS                                   |   7 +
>>>>>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>>>>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>>>>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>>>>>  4 files changed, 455 insertions(+)
>>>>>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>>>>>
>>>>>> +
>>>>>> +static const struct panel_info csot_panel_info = {
>>>>>> +	.width_mm = 250,
>>>>>> +	.height_mm = 177,
>>>>>> +	.lanes = 4,
>>>>>> +	.format = MIPI_DSI_FMT_RGB888,
>>>>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
>>>>>> +		      MIPI_DSI_MODE_LPM,
>>>>>> +	.display_mode = csot_display_mode,
>>>>>> +	.dsc_slice_per_pkt = 2,
>>>>>
>>>>> As this is not a part of the standard, what if the DSI host doesn't
>>>>> support this feature?
>>>>
>>>> Shouldn't the core gracefully throw something like an -EINVAL?
>>>
>>> There is no 'core' here. Each DSI DRM host manages DSC on their own.
>>
>> drm_dsc_helper?
> 
> No, that's just for calculating PPS and some other values. It's one of
> the problems of the DSI model, which I tried to solve a year ago, but
> failed up to now to do it completely and clearly. The DSI device can't
> check host's capabilities. It declares what it needs inside struct
> mipi_dsi_device and hopes for the best.

Alright, thanks for the explanation

Konrad

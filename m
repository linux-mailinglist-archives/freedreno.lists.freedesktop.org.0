Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE5C19772
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 10:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA3C10E75B;
	Wed, 29 Oct 2025 09:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nO/CMfSu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWuJ6a88";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA58710E75B
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 09:48:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4v5Cd3665669
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 09:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NXDJ/8mR0gw8cqrsb4EfbpEgu/FMCndzU0gyJwlxJA0=; b=nO/CMfSuJgXwZrsB
 YE+XH/1kPNG8FZ5xCpIE6LmWig76BSInQpp0cgV5alWrfp/5Wuuw1FXPBSwadAcr
 STCYgJbM8MAze1N/XVAjYSHHZn72PgbHkKrX06XB1rZaB8vLC0kclkOq29RhH9jp
 bOoZM4CkvHPzZfJYJruybBCPvDOVh1Vq8V7jvsljdmjNnzr0WDrPV+Ua6uHJ5tgy
 iZMNKcDbX7RsbEgsrMI6Ub4nd1a8Uj4ovZ0GM6RLFYIUs+ekSi6euimzvRUsC4so
 VicIKSzmvDWl7awoLeGR4TOjw74n7GiVfxIv5BZ2LLcsWp/juN7uHyxY3ExWYdGR
 QPKF/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3t2ju-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 09:48:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eb9cfa1b72so17420981cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761731318; x=1762336118;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NXDJ/8mR0gw8cqrsb4EfbpEgu/FMCndzU0gyJwlxJA0=;
 b=WWuJ6a881T4nXR2uAaSqliJRcvuE2kpLGrYDn2b4xkDcMA0iJgTGkZ2L8AsoTz15mW
 gbtCqn9peiyu6nda+H1DL62/kDFt2fvV5usHhn31eIz2Xu780UtE3te57dPl+4LNnt9u
 QEmFo2XnPzNwTKFpict5FGve+8OfrpNZm8CucZEifxPo3lH6nSSUSgR46pS08cOPpq4F
 vgkJ0b3gcuQCcKM4g3KOjAHyDiBScWBeB9uoXhtHNqHU4ZTKyZZ4TzLdWMfnDwDBDh9B
 AA64ugVGOXkKQa0LRXLJf2/Gv/BDgWK4FeKvQAYypDiXNFgwLi1ecF89jbocmWytVkWz
 G39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761731318; x=1762336118;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NXDJ/8mR0gw8cqrsb4EfbpEgu/FMCndzU0gyJwlxJA0=;
 b=kg2wRUHpYSnuMsd1zFlALnTVKMYKBcbmjSvFoDGGlZ6ZpOEMwgVR3NezeZ5r/aDeGa
 vqHnGoCfKRxNfCkokkgkiixATzEXlQuNnsRe20x1USmaZiLNu8IV0+MOR+3dMAjmXLFs
 kaydVw5BAmBTLQiZH+A1ZNC1/5GAhPxrGsO4Wx55V6wRMt3N7JuInIBueUhVK7IL8Yem
 jJZsb3kUulSjfcEgTYGZ3jFDPH3Ts585uDffsmFI6louaeMlMeVfUx86bq1MPmH7iGP1
 s79n4J5WjtUQk4daXjUpAyBecwe3lyZkmpKb3a4rMXxN4f0it6nX4yeqihW8jTxC8SW/
 fSKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjXsXGY7/lfeRFvYLj5CQruSVVPgMxrT15V3B7fEnJ8HuU55lzEWJ+qGShEct0KBv5FWHogytTTHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTAlFGnecn1Tt4pvJWs2GROoufQapzuooO7heC+SdkbOMkEFwe
 rKfigYcbk3ksFIyiPDbeBC0dZks6t5eyuokuZCmhuvtocwBwpeCePge8s+dwMMbGvDLbiXvVQEc
 /SUSSndSmmU6FQLjiCnnDywkl4Vew8S7GrEc/LTxUblbDrLzQIJifALCcfImBI9finXbWZk8=
X-Gm-Gg: ASbGncsZPxTvXjyl6ebGa0WpYNxjWS7BKthNb3g4IuwdGCwn6kv2o/X1DNk8oAn6dJm
 d+06yHN/PPdaGtbQHZBsT+qoiKsAOErQA4YkamY9+skpA/God19oY4w/dse5wvJdGzjB+c/TafU
 R0/B1yc22+jgTqBf4YhJ0N7t1Z2tUPrhFvc0m1vXNWbMLsmLxx8KMl+gV5sKXukFBW4dm9PNBGk
 8S6PneauwyrUGh/DisZy8u8PUImqKb7noZP46SM1Oe9Lq6qJe2SjPi6OXPwucrSQkJUwBm1tj5T
 L2AgFKPn+BCzDIU0dxqJJAyfCUujbqZfyP/0WTl53wTN8cjBd0QXwKFXclF0wQSXTUxuo8vvPsT
 UQVOEmnV/xcZfM+0DXfHYhfkm7vCukMd0dEUGdpX0LDjlyvoJ5plAk4tA
X-Received: by 2002:a05:622a:24a:b0:4ed:7ce:8497 with SMTP id
 d75a77b69052e-4ed15b5b4admr21772771cf.3.1761731318142; 
 Wed, 29 Oct 2025 02:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYOEqIUpR3rqvcOHQdFhJnl6mL7OfMUA6zGCTArqO2LmMgBKniIZv31BF5P5aE2+XJqdUc6w==
X-Received: by 2002:a05:622a:24a:b0:4ed:7ce:8497 with SMTP id
 d75a77b69052e-4ed15b5b4admr21772471cf.3.1761731317612; 
 Wed, 29 Oct 2025 02:48:37 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6404de640fcsm757954a12.8.2025.10.29.02.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 02:48:37 -0700 (PDT)
Message-ID: <c7c26f26-4e18-4f54-8c88-69ce97345e86@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
 <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _WkG-oRrXO5gpwcrphx7tqL74T_7Cc75
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=6901e2f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fe0abWBLJpTHcFswpKQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MyBTYWx0ZWRfXz5R3awbZ8hmE
 dN/G/Omi1qtG/h+tn29PGKhuFu4ZSlyF3Z9V5L3jS4/5O+19bY7zXhaomay5EgDBPXnpLW+jPT4
 NDYhF4N1y963gASMqNOtJHXlPoNo7cZcxPGVwXuoovGJVwmT6cToDEXsrBi33EjpTS0fZ0mOhLh
 F8ldaOqkHgvNNENxrqUjfa0+2wo3A5KZRj/WA1lVMK/EoBVynxjPrkt6ZTtCRb/uidtn1uNv2zp
 dPK6Sccj/0vP2xEUaLgaSrI1NEV5Aobbh5KN44WIxM4jt9wjfss+3vJQVTF/JciwnGWKtFn+7DN
 Lyn26e05x7vyIsLuF+ma/4byPsHDVNyab+3WhK92T32xwLOPK037t0kmO5iDE/LUBVOkH8U6zDN
 ciaSgKtFz22fwXZ3x+D9IWE3AYlocA==
X-Proofpoint-GUID: _WkG-oRrXO5gpwcrphx7tqL74T_7Cc75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290073
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

On 10/29/25 4:19 AM, yuanjiey wrote:
> On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
>>> On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
>>>>> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
>>>>>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Add DSI PHY support for the Kaanapali platform.
>>>>>>>>
>>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
>>>>>>>
>>>>>>> These two addresses are very strange. Would you care to explain? Other
>>>>>>> than that there is no difference from SM8750 entry.
>>>>>>
>>>>>> They're correct.
>>>>>> Although they correspond to DSI_0 and DSI_2..
>>>>>>
>>>>>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
>>>>>> new features. Please provide some more context and how that impacts
>>>>>> the hw description.
>>>>>
>>>>> Thanks for your reminder.
>>>>>
>>>>> Correct here:
>>>>> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
>>>>>
>>>>> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
>>>>> just some register address change.
>>>>
>>>> Addition of DSI2 is a meaningful change, which needs to be handled both
>>>> in the core and in the DSI / DSI PHY drivers.
>>>
>>> DSI2 was introduced in 8750 already, but it was done without any
>>> fanfare..
>>>
>>> I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
>>> and an output to DSI0_PHY (same thing on kaanapali - meaning this
>>> patch is potentially wrong and should ref DSI1_PHY instead?)
>>
> Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
> addition of DSI2\DSI2_PHY compared to SM8650.
> 
> look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},
> 
> Do you thinks this fix is OK?

The MDSS documentation says there are only two DSI PHYs, so perhaps one
is not exactly implemented. Let's get confirmation of which one that is
and keep the two functional ones.

Konrad

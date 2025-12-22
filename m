Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D0CD5432
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 10:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681D610E13B;
	Mon, 22 Dec 2025 09:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMUqUxpg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJ/nNUly";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DF610E174
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:12:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM84YKe3755813
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cwY2K98Yi/4JY/7MmT91JXv13PyCYygoqRFg2PiFWEo=; b=LMUqUxpgjb2wgnTh
 MhN/bm2eFGyH1VEb37aWcCxqKndbt/4bNLjREdQhKbFynIZvBpfRzVPz4ITDuETz
 HkD0wdyYkYZnyLeAG6q2d1bN3j8o1j66bFYR6NcWovrD/EJZB1SFesNc7keO619V
 eaiWu0sUnFHUyU9qDhTXldekEcZeBO2GovDCOS+V7brOoyv7fo4GGrOURBYxaLZ9
 FXMmL5L8jTfndThNLLJaPuIwY0wcoFmM3YEby9QEiStAUEs6WZoMi1gZbCmHBq3H
 xHm6VU/BEpjxi2+vFIvIdQv2LDbAzZHgWxg6q6yzigMSR/HnwfMevAVZozaFGcZ6
 G70/fw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahjqfp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:12:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a360b8096so90414086d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 01:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766394774; x=1766999574;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cwY2K98Yi/4JY/7MmT91JXv13PyCYygoqRFg2PiFWEo=;
 b=IJ/nNUlyyIt8KiuyrOTHNKpynvSgyB7AAGEqAOtfO9MhysgIB82VrjJtvjzkEz2GbP
 IJteynSpeSW7ei5/4sNEuPvEVbTq1mZ9+tvNKnK/ZVaYOXrNXE2JOlNlVJwsfcTHN0Hh
 1Fvwt8z+MLKGYmqwGB+4utJSWFjMM1c72q0MBixgt25APIwkiUAG7u9vlC4bCNp9nbzE
 urcdANd06N4TpEchwSk0xsi2WA/GTog899J8WmJMoFJhbBNQYjft3unaGEbPUBRYY2VF
 jcjvfonGnFvOiS3iwtxUGRtJwUt8zdX2ecYrt297ZQIcS7gkw4dYYZwzqoR3cG92fOvd
 Axrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766394774; x=1766999574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cwY2K98Yi/4JY/7MmT91JXv13PyCYygoqRFg2PiFWEo=;
 b=jcFEQAxf5sr1kVzoj3n9bDrKVqJzq40wNdPPTohf751ZXvTmSAPUoJo5Kum5xygJAf
 QUx0Mm6yZ+PUjpsaiG3ts9OuFOIPF/LbTNlBoGZYmPiExDb2e3T0DgPMt7I3i5Q/v8Ar
 D3J6ozJzLaH11IrfElLiqbXhxGjHrJ2+k0zGTePbtNUYq8UJzPv31eC9oSMABT7wpj6m
 UbpuFN9PfiajLL7fVks/wWJT2XMwAnN9LT9fn3z444noLRlr13N7yLADoweWB7UsP3gh
 LMyOY3F+sUkuj3Dfm64OSdRr4QWOpguV85H1kfkbQcLfoXmTEmWE654htvGABYXTCcp1
 dySA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGrHacOCHR8S4Q0nAiNNgTqS0gCn8IjqqILviREBnyxhBUSI1zCO9Lu6LGG4IjzABSqNeOIZwAqOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznb0CKTKpxqIOggAZCIbvdqwZi4wVmpBwwSEE4M5twOVGUAeO2
 PZxawiAOESeY8pCQ7fItidvdxUIuPnr42OrFMuPrCVNQ3ECbz5ChWJT0AGEpj/PO3BF64OVbcqh
 RlOLmmj/f8Rztn6kDwMz/lEAh56A/ax440YWDpkv3obdHhsPM2wrw6eafLRpP0aUtNjBUa1Q=
X-Gm-Gg: AY/fxX6GkYAQTWn44ifEDXuhBkWwGOCcVsgwESeSyv0pGJ3P5e4B3i3Y5mbAnIUvaXt
 9PqjA/iZzP/Nc72ldQIpBu68mAX4Qtm8hTaJafPQwokvgCbfhOt/Z+y57J8FPEhkA5hc/bC+Uu8
 jburl0AvJDSdLFty+m51jXSbFpde3NzuopeatB6hlmw8aMDGJbZC3/H2gFMcItmbjZ1trMBOxpX
 da69RNVT9H3i8yy0ua5qi3itQQBTPRZAfYmgvX6q6TwGaraijMQAiF7nt2BUtQnodaU7uHjRqJm
 kbk7JDmaY0hTxmcU21NlXbQxIirM0hFOnDPg+v7zTE1gF5iQUbb59Ek8INqRcbrdGT9x88MGnpJ
 RhfCNxOf0dHLmDF5Z75yqmUsBFy6nT7YvYqVwrlpGRrDFi2FR5h+gDFOrpKgpBFqpabvnqFqNIW
 JlE4JArOxTTJHn
X-Received: by 2002:a05:6214:c65:b0:88f:cabb:b337 with SMTP id
 6a1803df08f44-88fcabbb39cmr52330126d6.35.1766394774188; 
 Mon, 22 Dec 2025 01:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBurv4eHcwyfpCqbSeggQjL2+WDWRh3hwLn27M8pv0oLedwt+5VZ3ecuU47n/9XfM+vTu2gQ==
X-Received: by 2002:a05:6214:c65:b0:88f:cabb:b337 with SMTP id
 6a1803df08f44-88fcabbb39cmr52329866d6.35.1766394773761; 
 Mon, 22 Dec 2025 01:12:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a073:af00::4c9?
 (2001-14ba-a073-af00--4c9.rev.dnainternet.fi. [2001:14ba:a073:af00::4c9])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185dd7desm2949589e87.25.2025.12.22.01.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:12:53 -0800 (PST)
Message-ID: <9965e114-43c4-4470-992c-1051ff1b7f36@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
 <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
 <2f3c7bc8-8c7b-4c47-95de-7a8ac6dc3c57@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <2f3c7bc8-8c7b-4c47-95de-7a8ac6dc3c57@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=69490b97 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=yV6z7m4MmXEbFVxmnDUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: L7ZtAyjRaj8AL_ctnBDlql992d0UsKvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfX8KA6J8wYGJh4
 28T9QhUs/jxKOPDwfMPt41v+e3Mn49OVLTuyY+1msUIwAwKoQHhrw/m9q6YeTQY+XiVWKEp66It
 bECJv92754AGnsvQeOi92pQp7zM1oNBX0WJs9nzASN+QCDyTDfrn85+UKnQhr7vdAHiGr1PUwSe
 x+aQBp3TEXFE4UZN8yNPMg0I+dI64+vSbjLuKh2zIcgPu8jzycavUFLm7yhTKk/+exxAamd2X6E
 WCptmKaKqnkZ7erVjZeabNaXLjrEipUP5JTdZe4MYwPcCTQpha76HaMZvzbFkiSsGk5y4qgZYRJ
 ahk0Nbj3dzmSnuNOG45Bw9qwpVJA5DZoqquZkPHiboWq+vKlxhW+fAOa79E5ZydAcg5rCLJs0Sx
 TmqwVXO2WhmafVyI37GhTeVPS0lMnOhQBteJfI6/NFe9yCV7xrYiJ+TgcZo/GIQt0qqoi3YDnx+
 CoKiK/toS8XaA20qaBg==
X-Proofpoint-GUID: L7ZtAyjRaj8AL_ctnBDlql992d0UsKvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220083
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

On 22/12/2025 11:09, Konrad Dybcio wrote:
> On 12/20/25 5:52 PM, Dmitry Baryshkov wrote:
>> On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
>>> Add support for MDSS on Milos.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>   drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>
>> Though 14000 seems lower than the value for all other platforms.
> 
> IIUC it's essentially "nonzero" or "first-level-above-just-nonzero"
> 
> The downstream DT also defines a 140_000 and a 310_000 point.. though
> the middle one is never(?) used and the latter one is only used during
> UEFI handoff and upon the first commit after (runtime) resume

If I remember correctly, those are also used for programming the LUTs or 
other big tables into the hardware.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


-- 
With best wishes
Dmitry

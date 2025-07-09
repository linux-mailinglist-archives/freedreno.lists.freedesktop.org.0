Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9967CAFE3CE
	for <lists+freedreno@lfdr.de>; Wed,  9 Jul 2025 11:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371C710E773;
	Wed,  9 Jul 2025 09:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MD04QiCb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8BA10E76F
 for <freedreno@lists.freedesktop.org>; Wed,  9 Jul 2025 09:16:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697lMFw029113
 for <freedreno@lists.freedesktop.org>; Wed, 9 Jul 2025 09:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Cv1BCk8MYMc74KhkADwnTl/g1Y3GZM+AUyi9qevFM4U=; b=MD04QiCbcyupDjwl
 uMpXji2CFwUbWFMp4gW7xRrfwrZxp4LFM7WwubrPVypwEkJ4RNX5iWmon+pTowUp
 JSmny1owcMo9YZW1vft36dB9wAFi2pcXdOLdReDPrdxwxGwAKAmeqRlidX/FTtSw
 p1od8/Z6bq4ShAqeq9qtDW+4MDxabq/a2vZJf0Wtl+ubakfRm42HMYLSTsI6iIyP
 pnEhGuFJ9ArUQcl2QMnMEXzZPgX6xjC5Sj2k+zbRX7SmHTmM+9RzntQeSv7km1K5
 dxDP2hvWQSW7EetVn/i7lzhakHkyVMw6vpYV4yYGjybvf6aSVka0Kf8ILF9f3AqI
 RtKmNQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbeg96w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 09 Jul 2025 09:16:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311d5fe941eso1604668a91.1
 for <freedreno@lists.freedesktop.org>; Wed, 09 Jul 2025 02:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752052572; x=1752657372;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Cv1BCk8MYMc74KhkADwnTl/g1Y3GZM+AUyi9qevFM4U=;
 b=V7Es9EcqSarW9780GA2hTIkw5suGDEOlLb1uRLWohakkpMBm8ebxbiW5zNkoUFcVMU
 xmgYkU/FJ32Z3II2qryFDsMa43WwchPtjLSfFtnf9bZxc1NjRWdQWYsfX8nLlaWLnMlj
 R/BfpiAJRjnPnA4dgMvHDt20rtqLTyRFD3wov8Bj9Tw8mIE4C1kTl+loxPFpPCgi6Blb
 Q4NMXUBdvYcB3jpleeoWG/uIH10isnaixatBFII/cyb/Qn5beGxNHsT23IRClSsyCJHw
 nW/eFQqf0pxCLF5Fr4imXmKOkEOEUTAuD12xcFZX22nGH+bUSeVunb6R+ppzCQkcaF+Z
 85VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnu/bufxvQkZPTBceabxK0736dtzmildgBR6BMO89yQjFL8yaNaXq+SqY7ChnKDtrDRBe6NkIVsfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqlNQm8XJs5CPjY3Jg2kzDc6st8j8NivWsunAnJ63DRtbFOmh5
 b5czhXb/8MZgL78bjZx6H8XhmDjZbix64cuFFBTsCkrPUlhlFEGhdotVww/TvU7pCjXm8ADwdSE
 ays/SxwjunL5J3o8SXXI2440VJItgGd6br8GSW3Z5nScxXgJm4RsaqmjCMduJn3bWiIKu4zc=
X-Gm-Gg: ASbGncuqP8QeUI3Idjd7s+eC0u0J+x5mLxwQOJH4G5sXF7WN9oqLi3POVnPMX+Q4o9w
 3/FhBXsz91jPgdbw7uIR3JCZTnS4ET9ihmzr5zkss3G72Oz6MAkC+6D+vc/m71vXV5F0F04PYI9
 CY7QLwl7FCyLbzW0dfhaYrL96qUTt4zNRIR7fRNbu36XwiEnsxjqQ1o6Ey+5y30vEsOm2xA9baO
 2C2CT+rfqBatIPz36inBy798c2lttM+K1DiAaqtUFcZHM9KdYhsiZOr39qR0ydWCthAbWVavuTS
 fGyGag8RLR8v/1slERMn/Raecl6EZFadpCHyZS/EKzIQuPSBWr6/whUHbss/Zv7fSzSEzU3nkPN
 cDyvF0ubNTOvg
X-Received: by 2002:a17:90b:35ca:b0:312:25dd:1c8b with SMTP id
 98e67ed59e1d1-31c2fcb0251mr1322489a91.2.1752052571536; 
 Wed, 09 Jul 2025 02:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdfQoEh/GXWJ6Pu0rY5iE3WeMtosEwrdpewcGf70D85+7o6PThtirQuZHfaVGHEd9tQdVP5w==
X-Received: by 2002:a17:90b:35ca:b0:312:25dd:1c8b with SMTP id
 98e67ed59e1d1-31c2fcb0251mr1322454a91.2.1752052571046; 
 Wed, 09 Jul 2025 02:16:11 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c30067a55sm1502877a91.14.2025.07.09.02.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 02:16:10 -0700 (PDT)
Message-ID: <d427de7d-76ac-4e5b-b79a-3b7638a8e7fc@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 17:16:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 quic_xiangxuy@quicinc.com
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
 <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
 <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4MyBTYWx0ZWRfXzxt2B7s0/2AT
 rlAlBm2CcgLsZ7a5mgsSUAPkoioauCpIixK1a/EOHV88wli0wfxrlSTn0E4eKbjAE62PGFDMlU2
 F20qglylnvvgR1eFc7bsaG+dD/2q2tLujBt8fm/dmq5AKf/D3oGU2M4qGWuSb7D9iUX+NSTjtLy
 z6ClsjfYgGcnbfiQb04WyE1Ibnhk0TQycbc0EaKZnMC+KmRQ3xzfeLwuCBmLw57aYXwdcPcOOtp
 grOmFSvRf42Z+KfkWa/B2V7gF7u8gxje01EqFq71XpsViSc7ixT17sVNQu3eBafm7IGXkmUXRKq
 Y2BLnzAQdS97ejK3R4j8pdfU/BjkDAs3rjYvpM8ww/PWl/c/OdYhwuwHpD22FT3M5tPQuxc/hnA
 Qokra1UA6MCzh83ZdDpIB92qmjADG0KlFeAIHcJqiK3P1nIOrDRsV7+p9rxl/8JhHlxIguj6
X-Proofpoint-GUID: wdNGcdZ2pVr84xpA6ilLWw_mP8DZAfpg
X-Proofpoint-ORIG-GUID: wdNGcdZ2pVr84xpA6ilLWw_mP8DZAfpg
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=686e335d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=M9roUVu_bSbsc9sLP4sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090083
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



On 5/28/2025 4:49 AM, Konrad Dybcio wrote:
> On 12/3/24 3:07 PM, Dmitry Baryshkov wrote:
>> On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
>>>
>>>
>>> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>
>>>>> Add a mechanism to retry Link Training 2 by lowering the pattern level
>>>>> when the link training #2 first attempt fails. This approach enhances
>>>>> compatibility, particularly addressing issues caused by certain hub
>>>>> configurations.
>>>>
>>>> Please reference corresponding part of the standard, describing this lowering.
>>>>
>>> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
>>
>> Anything in DP 2.1?
>>
In the DP 2.1 spec, mainly on section '3.6.7.2 8b/10b DP Link Layer LTTPR Link Training Mandates', defined 'LTTPR shall support TPS4'.
The other parts seems similar to the 1.4 spec.
>>> - All devices shall support TPS1 and TPS2
>>> - HDR2-capable devices shall support TPS3
>>> - HDR3-capable devices shall support TPS4
>>> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
>>> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.
>>
>> Any other driver doing such TPS lowering? Or maybe we should be
>> selecting TPS3 for HBR2-only devices?
> 
This logic is porting from qualcomm downstream, 
For other device, only found in some older Tx chips like i915（intel_dp_training_pattern) used the maximum hardware-supported patterns, but not lowering.

According to the description in DPCD table 2-232 003h, From the DP spec perspective, it appears that all supported cases should preferably adopt TPS4, as it is more robust.
'DPRXs should support TPS4 and set this bit, regardless of whether the DPRX supports HBR3 because TPS4 is more conducive to robust link establishment than TPS2 and TPS3.
0 = TPS4 is not supported.
1 = TPS4 is supported (shall be supported for downstream devices with DPCD r1.4, except for eDPRXs).'

Although maximum capability of QCS615 is HBR2, but the actual pattern supports TPS4. 
From pure design perspective, it would be cleaner to drop this lowering in next patch. 
> Bump, this patch looks interesting and I'd like to see it revisited if
> it's correct
> 
> Konrad



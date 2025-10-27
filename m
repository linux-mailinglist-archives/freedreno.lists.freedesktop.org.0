Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEF2C0DAB3
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 13:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C12510E478;
	Mon, 27 Oct 2025 12:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPomL/Tu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9653610E478
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:48:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RBJjTE2546726
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r/Uv8H0003TgVcInLi9IzeOjAS6Ozviq/41bAtMg430=; b=KPomL/TuboAPo+sl
 OFjAhcmiPhBOLe+KzbXBZfPL1GnTUPWJxo3IeZghUFgrUJN8pOvrMZSuAReHdxQR
 wckDlE/ZATkF1VKg50GPZ4TkORxLDdZyjCnBB9/b6kHx1x1OUncnc9gSYpNLHxpo
 x7aTMuHYd1OW4Ftn8Ge1Mx1Gb7j5CpM14Bgi9tBOtneblcI6Zkv5edK367lv4MF2
 qJX2BOfmw9GhI6Q8f/Q2ZyEPeD1vjUXO0x9japLYzIltFG/BfZWeSDwZJEQoMFxq
 5uWewu7IIky6BmISPqHJJ1OTis7rfcSEVczyxtnKvR7/znZ390THbegPFAs1bEON
 JDPmOw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2g76m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:48:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-873eac0465eso18767856d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 05:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761569317; x=1762174117;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r/Uv8H0003TgVcInLi9IzeOjAS6Ozviq/41bAtMg430=;
 b=uDqvUKzUCz7nEZ+S5tC/hru1kzwO+2oDnqDOGEas384F+QZiyC6ZTKFeHfnRZnG4fD
 eZV4iN48XAyaAWv5eMbNDZCpDcA2Jf23U6cnsx6nuVS0haQMZzc1AHmhkBzwkHvurd4F
 ng9bMgFXHm0rs7J2C9cuqloI5Vbh+jgbut98uUovc06OgQIdcjlb6o+tw31WR92SF4h+
 IluZtBe5Etxo67MXILd5dIyNTXfiGTFrwW5uUFb0aM+7tR+Aq0jlSJs9BT8VsS2iNK/k
 viciwmXqtXtx08vo3tvDFJ44udMC7hf4zKwmH2eQQQ/FsPrhcFf2Gyacb/cr3STr+50P
 Z6uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR8xrX8urZL3e+PkjvcaFng4TVjQimBZ8fhEBauAVpXuQKkNDux8zPYI+aRlB1xGULVrw+rMnn6gY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOiP3aTeLKuk6Qe8LomdeyOsVXsovPDJwe4R9tACy+0ySNoJiH
 jkXWciIrS2PZVLIF2NYVt4nx97Zli0R57yI4HVxwlA+IIpcMo5HSyyQr6m4cADUrwxYoyO6SYEm
 z+vgU8lziMVXPCvT40KymSKF7hh6TAfG97wNPxYfel6msNF41vI28rLfEkrVGKvyUVosPpRI=
X-Gm-Gg: ASbGncvN0Jv4h/mtxv98vyPagHiD1kmB6mJvaYoXaGG2Y5H66sX1sUdtEhGDZflUGU+
 Gp9XBpnwEy9g0uDnquzX9OO54ds9HRNzcHdd7y95AUM5usfLzd4o1FvGvgfDEjvHTtGj0derFWs
 QsZrTqLMQdi+Sp0e3kpfVBXydO/vRJ7XNcBRUrFaobgpgkzCbrAK6vlDOlf0K7qsNme28gqZtwN
 xBLWEhhUJ8+zHuA1FmC0F3lfFxZtHgLCLvTfXBK0Z7R34hkmePMBSKktfTcUZ7MvjXXdUXdVgLW
 SOEoOZ0H/XJQFJt22ktgisSFmYaXC9oR/g63r1AnLWX0iGNIcSlh74lE9TYy3+Ww04mIiNEsHQ0
 3W3WzPxbtRKIbmWxvgS2CIHodtl0GhVD6Baag9QWpJYJdtugx6DwzSxH2
X-Received: by 2002:ac8:5704:0:b0:4ec:eef1:52f7 with SMTP id
 d75a77b69052e-4eceef16c1emr48423371cf.11.1761569317106; 
 Mon, 27 Oct 2025 05:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdTHwN9Gandf3Nr8idY1T2xhuzqElR3BXPKvTHU3HR+2RoVvlDvxy/LNpNChn+i95pgTzFOQ==
X-Received: by 2002:ac8:5704:0:b0:4ec:eef1:52f7 with SMTP id
 d75a77b69052e-4eceef16c1emr48423031cf.11.1761569316647; 
 Mon, 27 Oct 2025 05:48:36 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8544f8eesm736062166b.69.2025.10.27.05.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:48:36 -0700 (PDT)
Message-ID: <c8cac801-574b-4e4d-b233-56dc5cdbaa26@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:48:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xKuQvGWLB9xakZYl7hLiNbr4mBH-Brl2
X-Proofpoint-GUID: xKuQvGWLB9xakZYl7hLiNbr4mBH-Brl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExOSBTYWx0ZWRfX1On6yyYuk8NK
 o/oKd02OcMGjXV53Zxmqb+tq0D2zYuL6k4ZPj45kkcCVwik5dZswKR9BAVmOFON9QudY+3ZyFXA
 ZjNiu07kw96pfKlhOlpVH5XeooG2s+p5EizJdhAiXPMbQ4RBbcS+AcCubKmtZZQJxoGytIyQILN
 oG7/+Zjk0OrpUFjC7VYYMhLbZaXN7dMqJ/UVm7WynMMIJhlZmtqlVEml8V7Su61WIhy8lfPM3UB
 ns+YGJA0DloSJTpmn7+rnbGwV2AMyTeeNSb4xpjh3wrD1L4DhCYb1KRlA6HTPvtXWV9E77QIk6i
 cxR5T81XTp1PbItUKLlkH9YXdN4VqflvK7FuhnHjS7IUCs9EQY+XOgEzNhm95acvRxM/QR+JK7g
 DP0ir3hwB2kMwRtM8T8/D8BvApbR1A==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff6a25 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f1DJfOMeYKxADSZecjwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270119
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

On 10/24/25 5:27 AM, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>
>>>> Add DSI PHY support for the Kaanapali platform.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>> ---
>>
>> [...]
>>
>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
>>>
>>> These two addresses are very strange. Would you care to explain? Other
>>> than that there is no difference from SM8750 entry.
>>
>> They're correct.
>> Although they correspond to DSI_0 and DSI_2..
>>
>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
>> new features. Please provide some more context and how that impacts
>> the hw description.
> 
> Thanks for your reminder.
> 
> Correct here:
> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> 
> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> just some register address change.

Sorry, you're correct. v2.9 had a number of changes instead.

Konrad

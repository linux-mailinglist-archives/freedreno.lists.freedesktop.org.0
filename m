Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CCBCB4083
	for <lists+freedreno@lfdr.de>; Wed, 10 Dec 2025 22:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022C789EB1;
	Wed, 10 Dec 2025 21:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLaqhhBy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qw4W3lnR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A1B89EB1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 21:11:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BAJ9DLM4013608
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 21:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bfNgQDXXb8iWBGKdAi5rKgqEDEYcr51IEsgHSku4xr8=; b=CLaqhhBy0oW4NfTA
 Veh/x0/TcqmAMrnMZj+melezU5YkN1Sn4u3O5BZF9GWf1Oydv2qBr9vlV9g9iy6i
 8ObpTD4fXGzeoWt4gR5fxLzJN/+uXBw6IPXdnul5A2w2XAkTcnuAEGCGEf/rRte/
 /lQBFIsui7fpwgW0ErDDu2a/kaGxYyYY3A0gLQQOZuLPcj6ABdsmYE4edx77sceu
 JQxpOVVNIGvJWV3jC2orOCXUd2iOY76RydmzCF/vgA3rn/5224ZeZK3BTCgQgnkz
 T4WpqsogsirERyTFdMK0QcV0FgVHurTPG0xhJKUNYWhvqoJv3F2rY90CdDniVXkW
 SWghGw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayes1g9bm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 21:11:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7d481452732so424539b3a.1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 13:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765401061; x=1766005861;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bfNgQDXXb8iWBGKdAi5rKgqEDEYcr51IEsgHSku4xr8=;
 b=Qw4W3lnRakDXr4ACkoJ3CHZRsrwlALz/zjP7JHTaBVMLBuYoZSQVFV6Pt3JLR0dLqt
 T5f/0w20bFh6FefOczGmRw/itRz+Sxok+M5goynSguagUC29XNGp6x5udjKnnnfCky+2
 QXOlQfVcg16V9PdclXL+rtp3JDbD75uQH3TV2nFAJD6KazdHeEtvhssLOytUTBzxl5Bz
 hJYatxfUzuVZ7bWDPxLSM37ZBChF9hu8K3VhVuZkcbqxcR+WqgzNDpt4wSByv1j5xO45
 z1PHXXEFCMg0vmBnCvmwkoY6Jnv5Q9tE41CiwP2bEfxJayPR2OO+HISUvSvPDCKUU8HV
 Ztng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765401061; x=1766005861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfNgQDXXb8iWBGKdAi5rKgqEDEYcr51IEsgHSku4xr8=;
 b=ErEqofp8pehNSk7FOP4eMc9UeE0iU2c1zWyfhMXdWLkWO1PvADyC1SH7NYpcydGNNn
 OEpdNfwTlJ6Gy2xuKPELYShmgj/wvS5kJuOMIGghWv5Ta9NLE44phtW+goSCr2BiPHWF
 4EK9FIutCtnR583D11gOfCQw5uO71Suv61kiQDsZ8suU8xtmroOmLIeObQq/vr97CT4C
 GdjD8MHb58kV1w+jBnGL5Vh9KeUGbefTV+DgIynplIew+2/sWDYlZ0GYS0uy7BvSD2Hq
 7GA8BtU/MiliLDGbPAvRYt8c+TGdTx/+YPJob8/JuKLfApD8Pd0f+PUIfjEmRZZ9AUfh
 aU6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF6rTz3RShUZNOnZawMZVz4UuYq2YntRLhcWDEQvulfUXLnufW628mQrJV2YtfhXlVp1UUCwqfPuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsmEP1sE7JF2zE1sJBgTQEBV+BHRDiPbSe2vL4IjlOkvw+LYyw
 IRBgDo4iiZXkpIULf4mt0DoGT7zHuPLSTo2P1WpwDLh7kpnHJ+od8KTAorbPJBUmlr9As4mXkUj
 pryV3v7FXGImPSnq2f1KDwwR7qH78tIgbAQ9vP+mcYFDGC9kH3OOqZ9EMX0utunnoLCSerB0=
X-Gm-Gg: AY/fxX4XNe729+RFjR/t8VyoQL9F9cNQS1s17wkas7WzuwZ4tTbRT60JdDItxsIYGiy
 PcPuPycgMEY+YBhVGxrGFPZe7a6oRogxATyjB3sNj1EtxP4lFfKpPjQiJRnBLNW886CzJztNaOp
 unhno+9BPYnkS2Ekbx9wbA4ChVxfqt8a/x+xGf83Lakh4FrH9h1QsO9bwmG6b6fd03v9P00MGvS
 LMbqBf9JP/Ise+n56RDByuUXLIC/YJS9ZhHUJtU54E9m5NQfIES9Y0E34eI7Ye8H7zyndU5u82G
 TyjsOK71mLAqVvIsy3g6+gv9Ni+cWjMWk8kOoGv4GTVHYKoJvQi85ZtXHjd31AlUSNRvDLfanpr
 WYPRtx7LWS0Avo3PU5VI4vh159crWJKlv
X-Received: by 2002:a05:6a00:b91:b0:77f:efd:829b with SMTP id
 d2e1a72fcca58-7f22e0a30bfmr3813216b3a.22.1765401060884; 
 Wed, 10 Dec 2025 13:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbBXzDiOXtSdMaF2b7fdEH4r75SwGnJGdOCk5npK2CmpZqJ2QEVbCBDzn/HBSCMic4HCMWZw==
X-Received: by 2002:a05:6a00:b91:b0:77f:efd:829b with SMTP id
 d2e1a72fcca58-7f22e0a30bfmr3813195b3a.22.1765401060352; 
 Wed, 10 Dec 2025 13:11:00 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.96])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7f4c4aa91d0sm402642b3a.32.2025.12.10.13.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 13:11:00 -0800 (PST)
Message-ID: <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 02:40:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vjNSHbHNmrekSap-yT-yyGqMvvYcpf7R
X-Authority-Analysis: v=2.4 cv=KqBAGGWN c=1 sm=1 tr=0 ts=6939e1e5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=CcjbiXvC7xLhAd+qVKJczA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iOf4mfiAVVuFJQUywdwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vjNSHbHNmrekSap-yT-yyGqMvvYcpf7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE3NCBTYWx0ZWRfX20+G/S3tPYXL
 Cg6jbGGaXezeLQ7G8fdvlru+yHn/1ornq3YsuwKZqGUw+ZtaQWdcAGdw+DMQtpWspdkIp2uoZBr
 7YEfY5w4x6caNzTxYYKu6FYbBCGNxQJ0kM+JaXetWzwRfrULg97JbK1hqmC3Dx7APNEaDtP9V8L
 dZB9p7GvG0wQ0W2c+1I+VXuRxXtTmiT6LhYTZEpGZ5yIZpZOZ5AyZ0hh+BBmHHF/YDV8LAhMJL3
 BEYuFoGlU9qR4qf6eEcM7Ioglfrccm043llh97g67SKFn8v0UEpNpSJIMcP9f6RStMZqDd17zOf
 UPdX5QyrbQ4efb6Gc0hEta2C/cnrV+XO1HPDCAUA4KPsDhhwEQQnL/LSCEraxffe+cmlUSCkGiJ
 IRMvrAAMQ3snW6rNihFMw3ZcvOHhTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100174
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

On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>
>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>
>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>> +				compatible = "operating-points-v2";
>>>>>>> +
>>>>>>> +				opp-845000000 {
>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>> +				};
>>>>>>
>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>> or mobile parts specifically?
>>>>>
>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>> here.
>>>>
>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>> except the 290Mhz corner. We can remove that one.
>>>>
>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>> speedbins from the mobile variant until that is supported.
>>>
>>> No, we are describing just Talos, which hopefully covers both mobile and
>>> non-mobile platforms.
>>
>> We cannot assume that.
>>
>> Even if we assume that there is no variation in silicon, the firmware
>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>> wise to use the configuration that is commercialized, especially when it
>> is power related.
> 
> How does it affect the speed bins? I'd really prefer if we:
> - describe OPP tables and speed bins here
> - remove speed bins cell for the Auto / IoT boards
> - make sure that the driver uses the IoT bin if there is no speed bin
>   declared in the GPU.
> 

The frequency plan is different between mobile and IoT. Are you
proposing to describe a union of OPP table from both mobile and IoT?

Another wrinkle we need to address is that, so far, we have never had a
dt binding where opp-supp-hw property exist without the speedbin cells.
And that adds a bit of complexity on the driver side because, today, the
KMD relies on the presence of speed bin cells to decide whether to
select bin via opp_supp_hw API or not. Also, we may have to reserve this
combination (opp bins without speedbin cells) to help KMD detect that it
should use socinfo APIs instead of speedbin cells on certain chipsets.

-Akhil


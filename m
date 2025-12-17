Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B6CC79E6
	for <lists+freedreno@lfdr.de>; Wed, 17 Dec 2025 13:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A232810E2EE;
	Wed, 17 Dec 2025 12:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1A/aMKO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArXsGFPk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2614710E2EE
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 12:31:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHCL8Gb2043020
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 12:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nxVppHwCu+8rzGZFO+lxpcmtmdfr8y4QCMH3zpU7R4s=; b=H1A/aMKOhk/+gM5V
 mdApKa3vGivdomtYsqENHApdIbqjY7Tuy/zC6Vl9TqwQNDkpmrdRW/HgVnaMNqRJ
 5vB5KXP2X3D/HtzMTavuPd9BWDda9qAfH4VbJzv3zqKomr0XwOqReMQK43TSJvdp
 gMtHjyv/LmFlN8ua1ASvfTXDgsACSV04uCauTgSV+nPLkXPnBmABMkVh97mzCaL+
 bCHi65VwY2PYWBzUsa0oGwR5KYP5SFW9fREAZqEkddqspy9f7hu+9npIV+stBNed
 AuiQUadRg1SfGv+6E1jlFobUacL4uUOkOBumYa7GkuYR91e6L1AtkK4SUywddCzO
 f7HgFg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1tcs4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 12:31:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8893be16bf2so14951486d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 04:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765974687; x=1766579487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nxVppHwCu+8rzGZFO+lxpcmtmdfr8y4QCMH3zpU7R4s=;
 b=ArXsGFPkOysAIC0JZoDedG+xCSjfD61FUqg9EX2BkRcbSag+7PHiTjkX0uHO0OVMxV
 2+QWZn1oI4S+LwvcIs2xdyOFs1EfZWOmozjOXwgm87XwzsQjfd6GdxEqdbRTwsWmJIqp
 LPAF8HxKefcGRtn2N36IFCf8HTdA8gQDUlYda8otpycPi5z+Fn0DfJVjf6WkxHuKiHno
 bj7P3dSrGpGqzmI9YzmAvIq/slDu35Kf0VK3dpBg/DF7jMqYj2SEwTqip4H/YuDGYgxP
 VxbFL9eYrvKhW7k/OJ1PizVssL8enSiyr/dON9h79dHKXCIYdtuZahY42HMddIc/V9d2
 zvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765974687; x=1766579487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nxVppHwCu+8rzGZFO+lxpcmtmdfr8y4QCMH3zpU7R4s=;
 b=a2r7e9pYavI0Nn7leQOBZZnWVBoAL4c77sx71nIZPn3ZrfdYoqPSMGNJYHXJ2P8bZp
 b4M05EbSMzH6qHveEi0C0B4PJvxcBqO/FeQE7/mXov5swoOcCEfoTGSBMOeIM1ol3sbj
 Ikr4OZJXD5FVmx59v6xLWHlYqxhlJw1jhT126Bip+z0/U+AwNc7LP+HdE1dBHRWV6F5L
 RIYHy7CCfeFO1S0JgRxk8AccNhamDhsHgLJiI6NVjemHTwPOlWHC31Kr5vhFJS0EFFLt
 Ms5t4y0xw02+4xib9Rztj91c7EZkjfCoku08k2fZZ3Vdp6P+dlVGv2hmTp7+eBgH6NUC
 orYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi0H6SzuaTa0Qay9Si+MHNT9dksOQaPplJpHFIjpYII5bhEGJrrAwxHQwxxWcUu2eZxKB3HkJzJSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUNcXlfwZdqhR7a/2fPNNexO689LmTPOafR//LjMMXnxriE4e9
 gk6wgnLqEygOPZ0K6vi8KJ2Ro3vWTneBjM+jUcppRMjyownfKSUOd2DMDVOZLet2gbmWz1ymZGU
 TwLfkL0a7Zh6YyTElafvutU52mGAoR4Qt/cL+oDaeRXbLNX1ppLKGW+Z7uUCjK/+kOzJsuxM=
X-Gm-Gg: AY/fxX6ZzXPVyRmZJ6rIpUrks9U7Z80T+V1rIwhd8pC1GPIzdm0pU4hanDG+jA7WEhG
 GUooBneDpSFbzgEU6iBm1UVOL399TGQchdEELZVxTKbWzUNRoT3qnhOp/xSSZC8k84BT5YoVg/k
 bqIMQQahVBw08oBmgsjL2aMyYTWmzuGNreksHdLYAHCtjlLYuJQZTriKi9K5Ce8zlpWxtCng9ry
 8LXErm0Ns6NzGpMnB6oyglhV57/loKuXXf7B8uox6/Z+XYstNpgTtnxkIB2hOKbkvDozbKQnQEH
 KyUnFlBJk+BHfz4DGoC+Uw6iSqWHbNPHrpXLrzcS7zKF1kiaL9dJD8ybasVpp3kDQ44JIKFFxiS
 NVfGPV9d2+LU0mlu7gv4zPrU+UR9Koz+2xjMkB1xQkLo3Q32AkQxIHsigLy3K2qYCqQ==
X-Received: by 2002:ac8:584a:0:b0:4d0:3985:e425 with SMTP id
 d75a77b69052e-4f1d05c4201mr187452741cf.7.1765974686656; 
 Wed, 17 Dec 2025 04:31:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnU9DbqrhK2XEvuuPlNpfpmPEgKFxchCz9pi8QCpDey3PqjG8IsmXy18lP1a+VjNcjkHkDyw==
X-Received: by 2002:ac8:584a:0:b0:4d0:3985:e425 with SMTP id
 d75a77b69052e-4f1d05c4201mr187452261cf.7.1765974686190; 
 Wed, 17 Dec 2025 04:31:26 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80013c7ea0sm321246666b.65.2025.12.17.04.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 04:31:25 -0800 (PST)
Message-ID: <7e1b7b46-f4d6-4028-8518-80e954dbb7cf@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
 <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
 <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
 <ed4b1e3c-bb30-42fd-a171-12121db2dbec@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ed4b1e3c-bb30-42fd-a171-12121db2dbec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NyBTYWx0ZWRfX9lqmzjYJjwqY
 SxVleqrv18ddlXIQpL2YzBNNE0Kmee04E83UFIhQqh1oEdNh/rglxPyqlUJA/E9nryBEIBFOCRo
 89kLQVhZmjL8UJh1Bg1lKyRPdogw15Yqes5hYdTf1UI0YVkQ6MkDEpMIx2SR1s1VXcRhsS+CWkh
 6eS7/TGecByNFqTHC6BcbQ6p8JyhhQCQAg8//6bhFDOqt+dK2mqCcVnbOPLG/2dZzHiF791vG6k
 GeeG9KlPykFwI8CGzpXOWRph2EhjXJz1TO2lG1cT+kzGjB8r3B8oCFt1pnKbPMyZYLeGfVBnfwC
 24sivvOFZWNa4WW02gwx0SBHhfbAFEeVOTOYN8n+OEshUguvC4ArVPs5Qrf4o3VACORN2nNgLTN
 9RpFbB6HKY2kHCofUmAZS/XyOZLWcg==
X-Proofpoint-ORIG-GUID: ZpC-4AUWfnbafdbefsgYpy4U2NjXG_eQ
X-Proofpoint-GUID: ZpC-4AUWfnbafdbefsgYpy4U2NjXG_eQ
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942a29f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=trE_h3K6eqWXygPE4hIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170097
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

On 12/5/25 3:05 PM, Akhil P Oommen wrote:
> On 12/5/2025 7:22 PM, Konrad Dybcio wrote:
>> On 12/5/25 2:41 PM, Akhil P Oommen wrote:
>>> On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
>>>> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>
>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>
>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>> +
>>>>>>>> +				opp-845000000 {
>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>>> +				};
>>>>>>>
>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>> or mobile parts specifically?
>>>>>>
>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>> here.
>>>>>
>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>> except the 290Mhz corner. We can remove that one.
>>>>>
>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>> speedbins from the mobile variant until that is supported.
>>>>
>>>> Writing this reply took probably only slightly less time than fixing
>>>> the issue.. I really see no point in kicking the can down the road
>>>
>>> We don't know the speedbin fuse register and the values applicable for
>>> this IoT chipset. Currently, there is only a single variant and no SKUs
>>> for this chipset. We can add them when those decisions are taken by the
>>> relevant folks from Product team.
>>
>> If there's only a single variant right now, could you simply read back
>> the value and report it where necessary to make sure the internal teams
>> are aware?
>>
>> There's surely *some* value fused into the cell..
> 
> We don't know which register to read at the moment. It could be the hard
> fuse register or some soft fuse register at an arbitrary location.
> 
> It is better to leave it as it is for now. Who knows, maybe there won't
> any SKUs at all.

Please don't take it the wrong way, but who else would know that? :/

Konrad

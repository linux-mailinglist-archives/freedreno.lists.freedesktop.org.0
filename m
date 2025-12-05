Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCCDCA7806
	for <lists+freedreno@lfdr.de>; Fri, 05 Dec 2025 13:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A3910EAD5;
	Fri,  5 Dec 2025 12:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLiHqHen";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5xHXNLX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8880A10EABD
 for <freedreno@lists.freedesktop.org>; Fri,  5 Dec 2025 12:03:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B54n71m1915875
 for <freedreno@lists.freedesktop.org>; Fri, 5 Dec 2025 12:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7ibRns9NpT7LfaypmozZ00h9uMW/vCu+51UfOTwa4xw=; b=HLiHqHen3PiMkldG
 650qsThVHMEsBaLSxlhAqqxkXk9hyckjX3twAM+eVhqgQPo+buHuUVkViDY4U5M3
 x4mjcu+QuAVSXxAJEZGIFzlwFJ9A3urUPBK89UyW0aOYcdMl2LXBtqoutVl/xLX3
 2YMDjUDdmcQPNNiezzjWfbzFc8+/40uzOfO++SQdqu+doThtkmzU/kdxoJnMC0UF
 3/sti3IUArB9nsozpPc3e39+uHwWfGA/UzaDY2yoFuetG2l6+MhdxTpYJVEupz49
 qI1eJlXHXr9ppj2MGZucS7ebu3RbhBoMRClYC0uTfHBrOs2tcBYCmDWZFh4qRH/I
 K2knPQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auec1tt9g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 12:03:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-882416e9d9fso3545566d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 04:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764936195; x=1765540995;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ibRns9NpT7LfaypmozZ00h9uMW/vCu+51UfOTwa4xw=;
 b=B5xHXNLXmJRCwZcjfJ9PcnRRO30blK6JsWGuoBvXCTWbenpVSrYCjilWDFGSzDELiR
 6GO6TVU4J1qVbx6AEpNAES/Bm3cB1ngNJJLJKJfzNs5IFF6W7jhZ1yrtWYccqmovsfz3
 ZSVmiHH35HN1tm8qS7x6i8gH0uc/xCj/zKjs+LAyqEq9vhlXNHFI43TsiYJatH2mOkCp
 1AgTBRCjR/U7UfrtZRZZTjthi6hjnV5n/1cE6i91uwX2q0TEgJ0UwfbghXMMW5roQjOG
 xPw1/+mgwRcGBOwMl915WmCA0o8zPpeoEaNAUxvp0GTUPwiqiPOsTMpIjKZSoIqp0Nnt
 VVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764936195; x=1765540995;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ibRns9NpT7LfaypmozZ00h9uMW/vCu+51UfOTwa4xw=;
 b=OmXyQ/xAKHgwiFUEd6ymiILGCdxAkNLdSDkCv/hnMfJ94Gjoil9Co2TVXXXGt6QhoA
 cs4F8FI9/7m42gje1VF9sTOkpHZ5ktUqw+yG54s5pZwIJNtsn+Q4PkhG0w5CmhPhyMnG
 cXUSwUHYCODq0rlvD9wB3suQtylHEb0Xnug+bJfCyd23MYYtmT+z0yYg3Q5ue3Wq8Ndl
 KcCx/uE+GvFTZH47cocZ8cPN/UVWF9SgQQaWKS2K+pTrYn+F665WzUP91k/QIJ2av+Qc
 xvvwu5oD8dcGNGOjvRieOXtQB6bNbbsl1xaF8nJD9Fu3K4B1CEzQKuBBgQRjXt+2/L6O
 d2ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMHlhrJLP+et2lkkUsZrjikz6dMRIKuDJrHlP+vWLGYNpKcSo1TmpCm94b3QeNUkjcocheNt8CShs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznNywSYbwnyAM4zLw+s6jFKxMWYJICUlTVvXqinFcCnEhbGvgU
 +4vIHH7yETqSNFE5NFEl098ABq0iMIgTPqinarZsIwAKQDXAUXlQotBuKSqaGZX2y1UU6bPhYS7
 8nJzxvpRTqcRQyzbfXWiDedJHuds7iUAidj5H5PBgzDOjBiyrOt28X+FcA14tSR2oBDuBfN8=
X-Gm-Gg: ASbGncvSKEZcj2Y+R9pfL9M7k+uz+hEPW3VxEk9Bu1S6K35FrMlZlUahGGim+Yl8Dmo
 ouYsf02VQDjcI5tfu51CXdJdq2qWRUIz95qTZjhU98njV/4Imp2A8PVnUiIlY9GSuaQxv63J1DE
 V9NhUeu4rtjbKbdEK0T71nQCU7/7PSOAUBGZhYGyzOpJBEwI/Hvpsv0YFovyh0b0EcK58vEVvct
 23kvx/DahTiecKsRHuK0dWuhDRTWLfgddKVh7EIXWGTDoapSSEcYxqr7q+V87cJi0tkRF9R9aBw
 5mC960kCTlDyyiWsaKCslleBojUn6enb1IrB1xFVLCqMNIEE21btgCPcwdvbRFNSf4An+7HySkF
 3uHe9ZZ6G/bMOH01ewdUKBHO+LT10+vBP5TSMveMK5tJ0CablLchqPasKx9ysPQOkJA==
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4f0176844ddmr100919441cf.11.1764936195044; 
 Fri, 05 Dec 2025 04:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDtA69UwRIJoySS2OMMEYNqbCpINvG3hPdksp1reab8w5GlGFxHYYfb5cJEmOse38qlA5hXQ==
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4f0176844ddmr100918911cf.11.1764936194568; 
 Fri, 05 Dec 2025 04:03:14 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975dc1sm345503666b.32.2025.12.05.04.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 04:03:13 -0800 (PST)
Message-ID: <551b45ae-0980-4bd5-bb83-2fac6d7e2ce7@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 13:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
 <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
 <7b4bcb6e-fbb1-45f6-921e-dd1340a8cece@oss.qualcomm.com>
 <CACSVV03buEzs9UyDaDpamyAXwM8vrkp2P_N67Wqt3oRjhdc-sw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV03buEzs9UyDaDpamyAXwM8vrkp2P_N67Wqt3oRjhdc-sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HeAZjyE8 c=1 sm=1 tr=0 ts=6932ca04 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QGPp5zjhHj0ErSlcMgEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NiBTYWx0ZWRfXxe3+zC7C4GaK
 H8xmZxkK+6Ydv28tcCJDh8UsaMn0dQqXzKFbFLMd8je/5tbXWLP+npwXX5E1B8X5qm0i+KDeuUD
 /RHNcZj9Yl+Q6sPX9sNmXA8NUyeH+72lcu21ereEEeVUhoN0txg1kiEGBzbcNNncmQNoveXrHRV
 +uzA0I3tHWRoDzaCyEj+fKKuSgggKgtngCI25e1Gt4lwHbp10ArsmOPNrU7Y1tOvo+HSYgTptut
 VF9Gu7mNShu+tJiI04rU6ttO1oZggg+di9+WPIdGC3Hy8pSkRzK12DGdjWulry68hraLPds7yVP
 uV8GySRLAxXSd87nZeI7kmClBY8+9N3dwNUYWyG7pWwLtzxmSGg+vORnWROY42gDMDbkrjZQM0p
 L+LAnmq/c1rQrpqDiXyIU10mmmSwZA==
X-Proofpoint-ORIG-GUID: VMyMrjmgWFeBXcyaZx2N03mF2yvqGFmn
X-Proofpoint-GUID: VMyMrjmgWFeBXcyaZx2N03mF2yvqGFmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050086
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

On 12/4/25 3:34 PM, Rob Clark wrote:
> On Thu, Dec 4, 2025 at 5:30 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 12/4/25 2:10 PM, Akhil P Oommen wrote:
>>> On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>> Some GPUs like A612 doesn't use a named register range resource. This
>>>>> is because the reg-name property is discouraged when there is just a
>>>>> single resource.
>>>>>
>>>>> To address this, retrieve the 'gmu' register range by its index. It is
>>>>> always guaranteed to be at index 0.
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> index 5903cd891b49..9662201cd2e9 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>>>>     return 0;
>>>>>  }
>>>>>
>>>>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>>>>> -           const char *name, resource_size_t *start)
>>>>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
>>>>
>>>> Can we drop this and just use devm_platform_get_and_ioremap_resource()?
>>>
>>> This API seems to lock the io region and fails with -EBUSY if the region
>>> is already in use. I am worried it may regress other chipsets. So, I
>>> dropped this idea at the last moment.
>>
>> Is there any specific platform where this would be an issue?
> 
> IIRC we've had this problem before and ended up reverting a similar
> change, due to gpucc and gpu overlap

Argh, sm8350.dtsi for example seems to be affected..

Hopefully one day we can fix that..

Konrad

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EA39BB759
	for <lists+freedreno@lfdr.de>; Mon,  4 Nov 2024 15:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D73310E2C5;
	Mon,  4 Nov 2024 14:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFl3mqvP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A34910E2C5
 for <freedreno@lists.freedesktop.org>; Mon,  4 Nov 2024 14:18:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BxQWH031659
 for <freedreno@lists.freedesktop.org>; Mon, 4 Nov 2024 14:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u1v/WVvHGAo0bVyM2Taoht+/F9lPQwBWyf6U4K1s2Xk=; b=ZFl3mqvPbcrqu5Fm
 /tdQBLyc1RjQhobSxIgv3AoflRkDcnVMqMoINj4uQJrMxqktvTB6rn27n9CmqOur
 Czq75fWmigZZLMbsJ3t53Gt3ZlRiL4Oif9NVq9/u6JkNSNGmiNGPPnnGG0k9LB3L
 aGAlhLDddL7oTD+Wd3bunyRsHIPHHWHYvqvo4O143vt5SH/0Zt1aaDCu3Rp+Xvgn
 /vCyTIy46BxEQR+9JKGPTpu7VgLGNVhjhD4A++Ad3Qv8iQ4d55wwJvkZeaRBNg/j
 85kvTB7L9V3m5tKT7c0vJWwULTmzd5GWtwwZnvcq1U17sJpeNR3iBxRltqp/3bLo
 nn1YmA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4ymdcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 04 Nov 2024 14:18:10 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a6c3587bcbso3792415ab.0
 for <freedreno@lists.freedesktop.org>; Mon, 04 Nov 2024 06:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730729889; x=1731334689;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u1v/WVvHGAo0bVyM2Taoht+/F9lPQwBWyf6U4K1s2Xk=;
 b=jaW+wfRhtRta8gWeyXXgv6xz7PsgcEQt182Fv0i+cNaAI5zKQWUkAtASNYRt3yaosO
 qEWkl5B9Iguq3+wLfa3pyxay18j1nZKCG5GquKvUeBWcKEwvLQXgmMuIhNHXjMdpHCWX
 4AKEEbZjTNTpKdmpiEE9lBjTUiR/49sjNWHuXdO70eoeIJGgSw0CD2VzWXbjFPvpdzDX
 Ox4FKjCeqfa66tNdIhimd0sxpOaATA4qyjmrA+7Fi5g28+e0N8kgMwiEWgjYnUmYexV1
 KXuQA9uGhg01ZH9j/ndMsMlNpd5DslLGvaSifLsbM/XFq7qShrdA24whm8A9RSvN/ofT
 2ryQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtIB5yXy8aavekblArvCCtBEvN7l5jocIACqjcgiNxGPM5XJ+LwuVXGt3v+wXQBvVsWQOjAacQTgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlGhSJFoCGkqRu+yeGHGs3lXfvVt5CFgBsd5wXlOfVAc31Cs3k
 dD9lhTv+YrgfMR/YV3tj1c5dL8BE0iyP4Z0jWdFUHi2wh5913Wz340lPUYkCXIKlcnAvevItiHb
 LT914Gd8tQVqI3WrECoUahEsWoZ8qMBwnivZSw4RORdvggGmF7mJJXoiR4mo2o9kzij4=
X-Received: by 2002:a92:c561:0:b0:3a3:af94:4610 with SMTP id
 e9e14a558f8ab-3a4ed314920mr76085965ab.7.1730729889309; 
 Mon, 04 Nov 2024 06:18:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCE3MSfa+IhWcVZ63OZ1NsqKoHNMmvePwJ57m9ObdgTyluZNlPMfMOzkM+3rGnAfblsK0Ltg==
X-Received: by 2002:a92:c561:0:b0:3a3:af94:4610 with SMTP id
 e9e14a558f8ab-3a4ed314920mr76085745ab.7.1730729888716; 
 Mon, 04 Nov 2024 06:18:08 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e566442easm555348766b.166.2024.11.04.06.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 06:18:07 -0800 (PST)
Message-ID: <e1871824-78c8-436f-a41c-16ac1614004a@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 15:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-1-1e5e91aa95b6@quicinc.com>
 <1543ae2a-76ff-4b36-adae-37076e48b7f8@oss.qualcomm.com>
 <20241021220914.vrxiyeoxjyxweovu@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021220914.vrxiyeoxjyxweovu@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A6hKRyrp82xBMjRUAZ8ZcH4MhpxlizDe
X-Proofpoint-ORIG-GUID: A6hKRyrp82xBMjRUAZ8ZcH4MhpxlizDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040124
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

On 22.10.2024 12:09 AM, Akhil P Oommen wrote:
> On Mon, Oct 21, 2024 at 11:38:41AM +0200, Konrad Dybcio wrote:
>> On 11.10.2024 10:29 PM, Akhil P Oommen wrote:
>>> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
>>> the power consumption. In some chipsets, it is also a requirement to
>>> support higher GPU frequencies. This patch adds support for GPU ACD by
>>> sending necessary data to GMU and AOSS. The feature support for the
>>> chipset is detected based on devicetree data.
>>>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +	/* Initialize qmp node to talk to AOSS */
>>> +	gmu->qmp = qmp_get(gmu->dev);
>>> +	if (IS_ERR(gmu->qmp)) {
>>> +		cmd->enable_by_level = 0;
>>> +		return dev_err_probe(gmu->dev, PTR_ERR(gmu->qmp), "Failed to initialize qmp\n");
>>> +	}
>>
>> I'm still in favor of keeping qmp_get where it currently is, so that
>> probe can fail/defer faster
> 
> Sorry, I somehow missed this email from you until now.
> 
> If it fails, then it probably doesn't matter if it is a bit late. But for defer, isn't there
> some optimizations to track the dependency from devicetree data? I am
> not entirely sure!

There's devlink for clocks/supplies etc, it doesn't apply universally
for all phandle references IIUC.

> 
> Since qmp node is related to ACD, I felt it is better to:
>   1. Keep all acd probe related code in a single place.
>   2. Be more opportunistic in skipping qmp_get() wherever possible.
> 
> But if you still have strong opinion on this, I can move it back in the
> next revision (v3).

I suppose the answer is yes, I have a strong opinion :D

Konrad

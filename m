Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45C4AB13BD
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 14:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02AE10EA37;
	Fri,  9 May 2025 12:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhWVPitU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B6610EA38
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 12:45:54 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C8kRU014286
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 12:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AWQynAaZdyP1BwCe0FmFpLhAGkNvtkQ5JL4l2VsgwRk=; b=UhWVPitUSRA7HncY
 sy/jnNE7ycinfKCQQaQ6408d/qaG0KYj9QsEr7ca75/hdwxTRkkX2Tfd7vqMhGxU
 YNgVocrPrcmv/hMTI3ptSOhqVGqCwQy3lkiDg0/sDj9UZif/OV+PK0W3lASVW0gf
 btSA35yhKCsrlO8fJeOWUQW1t0DnDVzUCreCF42Tp/ypRUNC/601WU0N9qyZ15tk
 2JtNgtX+LVE+9pXOyd88VYNqNoN4yn6HDT9NDBWck36H3yQERaoRmFLISQ/FFrti
 RfxaozIlBC3ZwsFfXsXj0eWHt1W5n6S52GnDROUnSzRWXCHdoNEnY7rQWshQMk26
 aKcU0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4mq7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:45:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5ad42d6bcso51593485a.2
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 05:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746794752; x=1747399552;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AWQynAaZdyP1BwCe0FmFpLhAGkNvtkQ5JL4l2VsgwRk=;
 b=TraSjucrLy60On+he83QJJ9ndIeysYD0R3L0kBw0+NuKzMI/Gpo46MZjKx+aBBMl4G
 lPO44HUF5UsiRocylMXbvUFQf0x+JD2++K8AUOoK+/xWgbIKz9VCGG0hldjhWBVfIUZ0
 L9KVf/vTyFSFFbPF4rW/yTPsF/YplaOfWBW5Jw3/ku1Abv00q69AuaeOx+YvxQrGJhqR
 EOoXseFLcd54X/XeLwcKQMFw64lKU8CRFD2o5JCth/lpWZKckQ/2+RpmtVc6LkQeYewN
 kdegsYfsahLopivhMAXz8kDT90hko/v6qcf6/PEe47H1lbJuE1AupMMaeJHMnzmMJ/qz
 XsfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyYgo/Tb44+BqfgYydXNeh1BgbXWsYRoJrFW/88fXCiQ2HyzPTQ/18uVhSPnXEHDoz0e+PUVcUnWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1BJ3IQnd9e2EewE9FShn71Xz2WSNdxoUyaW34/2rMa59SNYt4
 QcqqkZr+dHnMI+Nm8vaOP5hEn/tQh0jufjnuz10HN+aR6hBkyPuEQOHDV4KiSGg4lh3oJpqsFqw
 rg2ONd8mcrqspwXhrvGwxiR67DOwAfN8iBmqeoK1ToTDxpKL64EmTfvBS9d7QcFddkv0=
X-Gm-Gg: ASbGncvs2ZvofaBl/9zTN75tpxvq0a9I0veeyqG3/2T/nTU3UGXkf0JXgYdsHtOr50e
 ZX80nOdJDB+MhT7oyzmtHQKyc3+QCb+d+yR5ngV7RWKXw09RQ6+fuECez3wWILNT+dwvApE56vK
 2ik4lOWvAU06s7tX0yd60FyoN6OIkX8jT2S2SjVjbCEjtd53dDVxeiFGverqthZ1lIRAYJGVz3e
 qBkY+FGaEaPXi9aR0GXObaFrFz6Erjy15vY7/x6rMPSvZ/2Y4zmRsJsAUdcwVpo46dyQe5P57dj
 zu/K7gtDWMkRC+SUhTNDQQqB59PpLxBoA21YJmKRgk4e4/plYLOy0bFt8fLAfAiS/Ck=
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id
 af79cd13be357-7cd01284a67mr201895685a.10.1746794752021; 
 Fri, 09 May 2025 05:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/01j/klFD9hnBlTgtkHmbIC4d1TarpECZjk82ft0PbRbQixnKSn2HYkL9AbA+mBnoAh6gVw==
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id
 af79cd13be357-7cd01284a67mr201892785a.10.1746794751615; 
 Fri, 09 May 2025 05:45:51 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd525sm145972066b.144.2025.05.09.05.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:45:51 -0700 (PDT)
Message-ID: <c4921bf8-5eb5-458e-8afa-eeb86d5b5f34@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode
 (again)
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7ZtsSP1K_wfwvklF0lr5shX1P3roZzSO
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681df901 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dD46bHw1nIv95-N93oQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyNCBTYWx0ZWRfXwwYgIAki56Tm
 ChaXqLViJCdbDPdPjDh9tlmvIdQCwKk1eTHsgHZS6DFQYwl1bszbhaawjt58ccSbiHa1jE5VpXv
 s2ENyFsbdaTjCnG3tr0io8EmXSSqpaeSt7EYqFUX3acP5FUjTa6YUmo5cl46mtNR2yHOEmrWBcu
 2DwhnE0AYrTPrjhlnyXfqHHI/gPI6ydJxOXW8cUMMRtrAiEUNYQat3/DGHw5as6QEjCCh2vZcAe
 inNfd2QKdHV6r4IYw7OEnsGvPcSJAcZmO48wPk6Hzf1gxBWfQET0TjEzi7LQYDVRfIsTKEe7Zsu
 +6hULmyK4yzRooaIvscyFFyS1oS9fswq5JuQPtesj09ArPD2BYZlaZhLb5WJmoJKwhQU0wyNNzI
 0PIIifBDbETm7dfCe9ihaTddZ2N0WXjBgLRVYUevlJ2VgSjTqcQBn0GFf2kBgI0BVt6Lzi04
X-Proofpoint-ORIG-GUID: 7ZtsSP1K_wfwvklF0lr5shX1P3roZzSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090124
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

On 5/8/25 8:33 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> SC8180X (A680) and SA8775P (A663) require a write to that register,
>> while other SKUs are fine with the default value. Don't overwrite it
>> needlessly, requiring the developer to read the value back from
>> hardware just to put it in the driver again, introducing much more room
>> for error.
> 
> I'm not sure I understand that last sentence. The original reason I
> always wrote it was that for host image copy we need to know the value
> of macrotile_mode, so again the value exposed to userspace must match
> what's set in the HW. We can't read the value from the HW and send it
> to userspace, because userspace queries this when creating the
> physical device during device enumeration and we really don't want to
> spuriously turn on the device then. That means the safest thing is to
> always program it, guaranteeing that it always matches. Otherwise we
> just have to hope that the default value matches what we expect it to
> be.
> 
> I know you're copying this from kgsl, but kgsl doesn't expose the
> macrotile_mode to userspace. I expect that HIC was added afterwards
> and only works via hacks there (if it's even supported at all on the
> relevant SoCs).

Alright, I think I'll include it in the common UBWC config (even though
it only concerns the GPU), as IIUC it may differ between platforms
implementing the same GPU SKU

Konrad

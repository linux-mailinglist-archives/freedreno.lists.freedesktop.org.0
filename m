Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA8C51866
	for <lists+freedreno@lfdr.de>; Wed, 12 Nov 2025 11:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E9310E6D9;
	Wed, 12 Nov 2025 10:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnS32Jw0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipDCEZES";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C842310E040
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:00:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9hT2N907270
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 09:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /c8M8R+TWpXRQ5e1+bQrBnPfd6et7TV4rbqupFG9SIs=; b=AnS32Jw0ui6C8JOY
 hiPKBk1G4+knA0yFTPdpEN1SZwfHaZFz4tFVcbsVQ9IJ5pY7s0a42fBtGJkaNhZn
 dIrOr48Vx48OTdnNHvTLezT+eYp2723P/NsAd9bkiuCdYsUldX2xwlu8KLiAILmt
 zzeKMU2LLcMYA3fzCWYnr3iWf0zNVUKDMrrV4DHhs8bMFEaeX3m8Z9+smhLgubRc
 PeOJ0ydOcuZaeHnNI8dPpGdS9hl0h2r7hYJdIGgoetwxgmlfdSFPnQuHQnODFHmI
 SJ0BlK4q2Equkaba5vjiU0N1ltD3uoe1CxBCAZeNMs0nel/le8dcemsABbpQ161j
 FAB8kw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqur821h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 09:59:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b25f8d38efso24124885a.3
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 01:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762941599; x=1763546399;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/c8M8R+TWpXRQ5e1+bQrBnPfd6et7TV4rbqupFG9SIs=;
 b=ipDCEZESi/5KyCB4QZFsXe9BZ+MNdNQxpbnDhG6gPXcEgsUN4CjhLiJ59p+GwpwyMz
 Wj6HBqGvfh8+6OSTT89dheWeKmuSY7yP6pdKebXf1b0jQ922FJZrcTnTO5fIy+ERJrcb
 uoy00XeN18/DxjP41yd4ZCoEXR55O2CpZItkw36rNFgnBmFElqseHRnM24oWvSKNTQ5W
 HN25HbcWWYjmixSkeg0ZKynGM1Ggp2aUpaf+2kAjYMc/IJpK39pbSI/0YteEdLXHHu0l
 DUTbpCvxgoz3JTYo/Pon8m6Crb6Ihgo8s+ZBg7SNqzo1GNUBMcyTkjrd+4mXmjvNleII
 AFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762941599; x=1763546399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/c8M8R+TWpXRQ5e1+bQrBnPfd6et7TV4rbqupFG9SIs=;
 b=gFDdhjDBgdfe1XSjY3vbU1aXOMvLOLELPBpxPE84ZMWBqyc/jKoKnl/L3en6LNM7Ed
 4HJvkrYBFLg20LLrR/WzOevQnVhijctQlUhqL/b1CR0pVFjAcks2+qAFN/wiKBx1F6Dp
 //N3PQ5KqteI1JYuQph8IHfCJXxArdBfJ4PoJBmuuzjKagji5Kg6SFRKBeKTGR2SDH3e
 NecRI2M3Sx/OQzaOsRU2r/sibIINnDqyrDAoM0YKDzci/H9dOKF4yfIh33j4CXdGvVSG
 r8n7wqRGB1DT+IzU/JGLN4NXSXCwd8L0NsYlw3vFiVxv5XWi+8yvvps0AtgNczxmqif6
 BKnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEy3mGRG3rbiqY0w7Wl377UsYHOUjFte9+F/FmYC+3RS+ls75RaQvc9+LeBZMf+W4bA/akR7DojIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3L5zb9SKnpAvayeNkMtgj/ohta6KUqcZn8b6/PCAAqmJ9honq
 6vxjzkjHnGAGNAOCMWnYw6vrv/8DDjrTVYLtfqU2E0JmlsBfyCyK7lGzvxgMdXlsPNLrNo+/dWT
 QqJThs2DIg26UUvyTxeDROI+ucflQtbJBr9rW/qTxjpC4bmYMxJDRqCX3Q5o0oWPxW8p2PHw=
X-Gm-Gg: ASbGnctLJNfAtqBQEgN1jo90nw4QQn80k49DS+Ut6K9aTeA+ojXWIvIyXI1L4BxcNfk
 vyDceD9eozQ8yioKUtz9fa/TYM6zE1u2INS1ohsGxfPN+z8M4s3NDaiOiEzQWySaVPK1+orFAhr
 Y9M9pdxOdEb5PemC5fYNy07N+6k7MoP151F+QkcI0TMLIx7n2xriEJgNj7OpZ9qLaFxMkU7M+SA
 bxg7TVwLPS9ZITGXkHfmKSSpxS7uWFhKm/HMGkQmkWflrAno3/Bg7wVeAVDI8j27Wjz9FIv4/7i
 mxPAo1gR6QcOjdz0fenKsItEd71gif0QkbyNb9XmkkQALzTGZKyLfPVZm5qKa0ufcT1+FL4w7mI
 7aRB4cXTEsbA8h0jbRsQLfleapfs4j33Ci9CXgjcx1+Ec0nJlxm5+XnFY
X-Received: by 2002:a05:620a:4047:b0:8b2:fea:21ad with SMTP id
 af79cd13be357-8b29b7c1df7mr186052985a.9.1762941599123; 
 Wed, 12 Nov 2025 01:59:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeACvtEsXBDBf86oFt1CCQ2CtTgxFZLUvN151CpNKDu+hMJHO80+bcfR0KyKS8bfTOd2+bww==
X-Received: by 2002:a05:620a:4047:b0:8b2:fea:21ad with SMTP id
 af79cd13be357-8b29b7c1df7mr186050985a.9.1762941598464; 
 Wed, 12 Nov 2025 01:59:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa0f37csm1552008366b.64.2025.11.12.01.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 01:59:58 -0800 (PST)
Message-ID: <2b10f34e-ab3c-4329-9034-8666b252ac49@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-1-a2d7c4fbf6e6@oss.qualcomm.com>
 <abf79d96-72c2-453b-aa2d-0626be584baa@oss.qualcomm.com>
 <65714302-3b71-4a15-8647-ad707e056302@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <65714302-3b71-4a15-8647-ad707e056302@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3OSBTYWx0ZWRfX1gYFOQ0udloJ
 W005siwt3s9psif6fi4N35QYjixS9RP096azNJPZNrqjNEdZhQXAA/EOvrJKdg6j7WTaBF1vUE3
 aMaCxykDMQcWSMPAwPfWmzFn7yeoe4CJ0WiYwsraOCxljPtDO7P1TweXReJV9z1LdH5UperHsw3
 BkkA1sWQ6QYxJqCTr51ufUek0nlaX928dBdtIHrth4Rd0mgTqa3gE8DSvDB2/ED1OMnt2j+BTHh
 0/E+H2aWzwWvAJgsSHTVTq/5ZnFF7bcR5Gw56RJ5RYGY+Y5BEruVgt5uRnkyIMkkQ8wnOYsl4nG
 ZRpwLYmjOYhkW9b49ib5Z4F9j3oG+ATTVp9N6eE1iuK3RDJPgapzPHW3M+UXjxgHmc4Jyv5HOFu
 Tph11D6CDzE5sl0Xgd+0DStY88lyhg==
X-Proofpoint-GUID: SfHaCzs1pmccYvL6scFQYPriUknlER1O
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69145a9f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=yXIK2swZwOVbrSwllKgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SfHaCzs1pmccYvL6scFQYPriUknlER1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120079
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

On 11/11/25 4:10 PM, Akhil P Oommen wrote:
> On 11/7/2025 2:28 PM, Konrad Dybcio wrote:
>> On 11/6/25 9:50 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>> of A615 GPU.
>>>
>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>> which is a small state machine which helps to toggle GX GDSC
>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>> any other features of a full fledged GMU like clock control, resource
>>> voting to rpmh etc. So we need linux clock driver support like other
>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>> This patch skips RGMU core initialization and act more like a
>>> gmu-wrapper case.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>  	/* Enable fault detection */
>>> -	if (adreno_is_a730(adreno_gpu) ||
>>> +	if (adreno_is_a612(adreno_gpu) ||
>>> +	    adreno_is_a730(adreno_gpu) ||
>>>  	    adreno_is_a740_family(adreno_gpu))
>>>  		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
>>
>> Downstream sets this to 0x3fffff, but IDK if having a timeout too
>> large is an issue
> 
> I reviewed this. It should be 0xcfffff. It looks like the latest tip of
> kgsl has an incorrect value for a612 gpu.

Thanks for confirming. This patch looks good to me then!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

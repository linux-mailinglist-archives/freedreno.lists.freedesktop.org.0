Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB21AB1392
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 14:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6510EA35;
	Fri,  9 May 2025 12:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhRNtL3o";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8F310EA35
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 12:37:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549CT6eG002336
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YwvPt4t2OCvE2vssyY5oxLacKQywQ7VxFJ+NInkStNc=; b=YhRNtL3oZAzp5W3F
 V3D+oiMMj8Pde3XmMUhdSm/s7MFF6zNsmrAc53Zik9Z0M+8bUI1X/6vu6juDC42r
 9sQI6Nfv/zrFzaT+iNcTWkHBEJSO1S5wTtqE/5IViUs4f2uCFGFO+tDje756za/g
 p9XWTPwwvAhsgIDVvMIa2rhJyv+qjUzHUgaHjjiEwAi4UBscS2TEZ7LTGOEn9Rvq
 MPX4pJBFQ24Jm1pL5VAqc3HScS6xUEYwUeIJ1bzTa/gYJ/YkrANbx3EIFu6AWQA0
 33QAMN12pTWmXhk+dLiEoEMfC8O5YJ0/yHjCK/+eEuoVHOBLwXgTDuYB3GjdXWBG
 NAIuig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cmev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:37:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4768b27fef3so4839701cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 05:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746794271; x=1747399071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YwvPt4t2OCvE2vssyY5oxLacKQywQ7VxFJ+NInkStNc=;
 b=hfq18Xq/HAJEhgp7Y3rVDBHnwMk8ZTr2UIS4pC4eX9/WAIna66DBOgxhsRQYHnmSbD
 0AP4sUA6oX+9wiMQL6jxDlRsJV4UMPqUf5/yICgkcC2Kaf3JvJldGR00Ni/s8//cuVFw
 GYoTZqtn2ZtbL0iwhsWewR6Sel6H+T+SIE1Cf59GTlWQXwKcHgzece2B35fXTBrpd4z5
 3PkgqcVVBXlz7/ceXgUfUBljWV5ZrZCg3O6tklsZ24euDOYwwsh3QNlxgLgdpEFB2CF4
 P6NlupnGSYnUb+SlwpcbMDPpXZwUk1rcF/0PjKAoRwFqI3o7Hk25k/z+P3/xbh5CCQbg
 COKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1ZeVaUkFfkZQE9+bFQNJMdJW5Lcg/vvq/lZ8o4UMbIkpecQOeuMaN5fSRmz1+7Bgb9ZT/v2WxATM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+57g1XSUaWuOabDFv7NkjNeVu2zJpPXnbDvoiNLX/fQ0A2uPL
 CxpE5Bi1VGqkOgLHy7pzKIaQuVsbhN4CjhCS8tHrnlwMW/zVYUtyES9vTro/cyCc068qaOoQJaV
 sIi+jBMs8PllL96v04L4O2s7lZyOxRmv50MuTVrpw1lIZvj8G8YB1mFO/56RmDQge01Q=
X-Gm-Gg: ASbGncunVg2GNFCe4sSQ+Xz6DS3u5pcSh9REHEKIM9NcA3rJAYcrA6QoK39OnH81ppj
 f1ycKSdmLV0Db990edcL8wHvOODeUlA4Bhqw5oaUe2nYEmdvxLB7X2rpEBuQRmblPFZXz1V3L4n
 BjBOaVWDlXEC+/ACz5zO3WhbnukXlNWdtOpeyIMzlpqkYxRFj6d3Xbxkfl7J7vTexxwlGyEryqK
 DVcobV7gfatvoqcJMUBPsbySjefDdOsNUyRw+aNbBTF66Qoa3W512nYoTFpSLWrls4eW1DAXdKD
 uDdJj1IpocAJTzBFAXRP10y0puYvs7qe4dUw/LaQdbV7XS1yXb/uhJGNzS8wIKhAOrI=
X-Received: by 2002:a05:622a:11d3:b0:471:fef5:ee85 with SMTP id
 d75a77b69052e-4945280295cmr14540171cf.15.1746794270869; 
 Fri, 09 May 2025 05:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERHUVO6nQzP3GMy6DlR9CXLC5BNc67GbK1LwQUmC7YI0zwpgmz8DNyH5I+IjBhgY5B1ZLVmg==
X-Received: by 2002:a05:622a:11d3:b0:471:fef5:ee85 with SMTP id
 d75a77b69052e-4945280295cmr14540001cf.15.1746794270552; 
 Fri, 09 May 2025 05:37:50 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2198532d7sm143701966b.170.2025.05.09.05.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:37:49 -0700 (PDT)
Message-ID: <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681df71f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hjmfpjirZ_eXqKrHEEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: TkwjCDyeJuSYi6APpe4RFGCGy6y2Em5M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfXxCehLEeRXg9D
 Ctn8oSHs8WVlgKLTV6WUq1plgFwoeJZibe6+l4SCwCW6XGmeP6AHOKY2MnvqhtP6/Y+m6LDFxQg
 uxPi8TmPEoMH9MFapdtxWOgDgpztQ2dfmcwVSWovgruPxbycqz9ajkP1Fy+9HAjy6Ah1Xae4MbM
 iNRoOzxcWl6zJ880UoVZS0wKr32zu8gxFDNj27KMFe+Vx/T+ypdAsLCC9TFifF5jm82aBVE5tyG
 ZgEkME4ltZnFwTAJFKFgiX2Y9+stkIWCdvMDRNvmo3GaT7CqTmFQxJzj2MKQW9MLZrj62lhwEt6
 DYh2dVxwzoQZIIXwmXT8r3zJEiIoEfQj15hXzh8y2Ya6SoIkTSEdZhvecqZq/k9FT4vIMY9tOJ8
 4PQOAfaL2Oyu4MRqAZCH39++yq9eqogWf6wJglTFduYyMO42LRdHf06V0Kqc/+aZ4F1JhKXS
X-Proofpoint-ORIG-GUID: TkwjCDyeJuSYi6APpe4RFGCGy6y2Em5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=919 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090123
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

On 5/8/25 8:25 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> This bit is set iff the UBWC version is 1.0. That notably does not
>> include QCM2290's "no UBWC".
> 
> While this is technically true, AFAIK the only difference between UBWC
> 1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
> is why I originally wrote it this way. There's a bit of redundancy
> between the UBWC version and ubwc_swizzle bit 0.

It turns out to be a hardware matter

Konrad

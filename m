Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CEA82B16
	for <lists+freedreno@lfdr.de>; Wed,  9 Apr 2025 17:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F24110E127;
	Wed,  9 Apr 2025 15:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="crSzCxjW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF6210E06A
 for <freedreno@lists.freedesktop.org>; Wed,  9 Apr 2025 15:49:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398No5R004578
 for <freedreno@lists.freedesktop.org>; Wed, 9 Apr 2025 15:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OfB1diTu8S+2+IjYQiq6NxbHo6UapGpX/p/Wbz6Phn4=; b=crSzCxjWuljA7YwG
 3hvyP3B4qsWxqr+qYYgK9MlYP5erpW2GWyefuR1r5vpHD1cy8I9TWSE4Izkf0gVi
 9C+SZeQhcibQfmpJupsNlTbcXJC64QGCnttIYzLLBtWXRou5/MgEvypCqYO6Jh8B
 WW5QqllGLB1y4v+WWbjs4KMz2Hs3OkrkhjO7pRUqfKRCsNXcPJSi6Oo0QGqkOjea
 /imDrzNxxhX3QrN0yoE8jeojpfSpdauv+mF7J3E/c6wjMSTNOIcALw66p8Oc+xIA
 YhYeInXE1V7/Wqyyv3Hqqs5S1/QCgdCH4uJBuE0LZI+wIp7vpA8P9/r2RGgOs2qX
 3KN16g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb3yt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 15:49:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8f3766737so16352466d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 08:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213797; x=1744818597;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OfB1diTu8S+2+IjYQiq6NxbHo6UapGpX/p/Wbz6Phn4=;
 b=aP6/6PrQUUYsd+8wvcpeZNZN7Kj3EsY75nvHU2W3YP1Oudz5gCjQBP/fpSVVigz8UE
 LWkdWU52Wc2IKgpFpUp8R2QD24+mqR3LsHQ+e4AN1KwWChSOq4uOpGp/UM15dKhnAYEr
 jgvm23OoAD55vNVI9jzPsR1W0F4Q8YEGVwjrKtgpLmOacFqWG39qUoxeq7nEulc6lbdp
 4Cz3LQru8SuHVgn6YOwiYJ/Uy+8cgSRpUnXA8lMzcBSKwne6zBxUR8MCapa/pIk5v8/X
 YMcKROFUuJO1LV3DK0dckzS7arkjmvy2Zx3opJTVSbtIMqiKJeR5BYB4F9+f7+lgvguB
 X+xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyAKZnoLe5fdQUQxUfmvWwa7AaZ5h/s1RyzIwu5vda4z0LKxly2fUbXwqoPFqg677P6vzK9mH9g/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcgnHmaUpOFNtlhrL3waC3hVc5O+NfcX1/JMmUznBffCwgm6jS
 B33ja2jVvdVgWOCm5DzEpk4W3SF6K4YyIHGZmR7z2JO2f7+vnmK1EvvkuFrZiejXOYiE1uOP6ED
 InLHVo3b82nuV2IYiEpC6neP1KvAEDSbqEmg/rfkCzT/WJnTkTYm/zDvae7QVAB9zMAE=
X-Gm-Gg: ASbGnctXLCUj4GNSG9sZazZzzvqDAzHEy07CqYQqNfYfTg5mBUlevRssRaGvd6eRXqd
 Rc3PJwbZv1cQefzwBEdvL9lqKJsxmux7uk3zkG2ySksK74RIzl+EwPqRXNtp3dEOnQJQdPoOR/L
 ymwlTqQlPrWb66u1ANAb7JoFnEswc9NcckvlmGRJwWynooIjifNa6NTOW9QFiZ8MsqEd9m3k0j0
 lKCyJlm0czC7PweyXA5ZHRpQJriK+muirGkkaSf5ioP+7QtXzOeT+xKKKkj8k+IAmmQMBz6pFyf
 FEgVJ8VRmxaYtRZFsngtfluL7l0AgCz0Mk4Pwy0PEU9x5XTWptd+KAc+0RpaTD4tIw==
X-Received: by 2002:a05:620a:4148:b0:7c0:bd67:7dd9 with SMTP id
 af79cd13be357-7c79cc38a2fmr170376185a.11.1744213797594; 
 Wed, 09 Apr 2025 08:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgLb4SIntY1KrRW8OaT6UF39Sv6qcj05/CcAG4bsBVpRe7H1ghDwXTdXn925CoiQqmrP0N/Q==
X-Received: by 2002:a05:620a:4148:b0:7c0:bd67:7dd9 with SMTP id
 af79cd13be357-7c79cc38a2fmr170373785a.11.1744213797214; 
 Wed, 09 Apr 2025 08:49:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4129sm117214066b.98.2025.04.09.08.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:49:56 -0700 (PDT)
Message-ID: <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qeN5QDe0eXsD0Vls3tBD-ln3LDyTK7qp
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f69727 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bKdCaboesIjPuyFXCNkA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: qeN5QDe0eXsD0Vls3tBD-ln3LDyTK7qp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=558 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090100
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

On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> On 09/04/2025 17:47, Konrad Dybcio wrote:
>> SMEM allows the OS to retrieve information about the DDR memory.
>> Among that information, is a semi-magic value called 'HBB', or Highest
>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>
>> This series introduces an API to retrieve that value, uses it in the
>> aforementioned programming sequences and exposes available DDR
>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>> information can be exposed in the future, as needed.
> 
> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> 
> - SM6115, SM6350, SM6375 (13 vs 14)
> - SC8180X (15 vs 16)
> - QCM2290 (14 vs 15)

I believe the easiest way is to give them a smoke test.

In any case, unless something is really wrong, any changes made
by this patchset are supposed to be corrections

Konrad

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D82AB155E
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 15:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E65810EA42;
	Fri,  9 May 2025 13:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXmS5b2n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051AF10EA42
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 13:37:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497EjnQ019189
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 13:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iOOyMJiEKwo0E2wR4rThFjXKnQmgdnx4JZVsMPqv+MI=; b=EXmS5b2n/lmS2bQ4
 CW2Vr9rM/WGS5/AkIlhPpJWUy0r1vsBGPIco4kOoiAKRUcJt3Xuuogh9cSa03eBk
 jkoSun1dkKF94Y893RF9AX/sDMbhjToeY1r1EgLQU93dMeCYihv0wk+8dD06HooW
 BEkL4P4spVMQtYwGdVETFGPNtMMTmkl8hXaI5uZruaH9rhmoT6dgsjvCh1MxCWmJ
 13I+duS7m5+nslS5MJAvGx1volYuoG3PW6TUrecMMYqAXIPHcPOF/fc9DmDRBfX+
 tyPiUl/68csQvb2Z6kFb1lZBbVdF5s31Sl0Z4TKP1a97Ewys3tFgxgsWaXBCRZNu
 2w3BlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj48mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 13:37:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5466ca3e9so38435085a.2
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 06:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746797840; x=1747402640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iOOyMJiEKwo0E2wR4rThFjXKnQmgdnx4JZVsMPqv+MI=;
 b=Cr4/ZPBtqFavR0D2XOdCQk4WxxTLTrW1VCLHDuJlWN+FrXU/g/2K21nQSxvteE7V3Q
 O6uJotjtUI8W/hd62ZsSD6mnJE3i7tlx9uLo/uGIs9mIJQFqaQ8pQz8h0++YGDThbvbQ
 iJz4V7tuvQYBS+oj5MGwiDqtjThTvugqhA+y0Xpt5klOQI1/YtLTBjELZZp5AMHgBMEW
 ODUHK2MmxAcAUNUoYhjm7jwiaTH2xzzgVvrJ/WsL9nTTbQxUY+abFugXpvZsyPwclIg5
 /a9xvgh3rfmjxe02i9QElxiVxDHAroVihWtUJRfFTLYXzgKgwbQh+zNmgbZSTPY+74/i
 nayA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8TZHGws7L8ig1n7osdALnm+Nl8aTaO74XtbAIgHVph+i67X3cnjC7QQMpKpaxJXFjK7MneunSJHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0+9+J3wAIRS9ZLwSi/cQ696rgK3JpoEI63OGoOFbCfrOIAZZB
 XhBiHydcXoakb8oX/Vcy7aUT8/rLNPoZ2SIsWVC0moJe5yonuTM9VGNo9IJBBLtFv3RWsRhvlcc
 hvTIWBiySDBnAS2XQ4th8k2s1ZkAaby4qlivKqOYRNhmeBfYC0XPWKSlVm/arF5X9Uvc=
X-Gm-Gg: ASbGncuvlHoN2qshOZ6U7pNTzNLrb06Q2iWFRI1Y2YjxGw6CG24Nrktx0ay2dXuAKYy
 2O+mEA3hdn72xBqsNK4XwyycD+YxGrOiZrKLRhJWeQ6T3/VbU8Q9ojuiTdKtpxJUjXy6RQiGweR
 7JGyWJVYQAvFDEiDb1YlZq/yxJbf2FJm5DtoJOlc1zbJkFIOyxsM8N4cBRvO1OamGn/ijKHx5Oz
 xsDr+4BFk+HG4M2LLBYWLXXazK7lhLqUTJISadYWoq1HKZBL5d3vhg9VenPAXmnX22CTC8pjegD
 6K/3KTaoHDUyf4kccIElCv9TcvOqCwVqCYIQJWoM3lpGbpL18Jh8DpOxHvUcAc8+JEo=
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id
 af79cd13be357-7cd011520edmr199007885a.15.1746797840075; 
 Fri, 09 May 2025 06:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuHC/kx6/TH6m3sFD70X3TGhAwdHUaPhxaRjn4iosPvYhb5stgDjoSjqTnyk/F9Gh1p1qG5g==
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id
 af79cd13be357-7cd011520edmr199005285a.15.1746797839676; 
 Fri, 09 May 2025 06:37:19 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197c5b9csm150979366b.159.2025.05.09.06.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 06:37:19 -0700 (PDT)
Message-ID: <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
Date: Fri, 9 May 2025 15:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681e0511 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sEJkFV_Ntms1zBwlKkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMiBTYWx0ZWRfX3IGUAbdLxkhg
 1i9VRx8KdYvsb4t4a7B72Ag0Sz3ZkeifDo7OBnN9g1nR6OGibJ1DU5cCiyq9f69Y9B+0j8wlm9k
 /fH6V6vCzxYS2us1ulR0ZUSkVh23pxrPNfVj83/1iHckIJigta4O/Q8f5top9zdkPkcGkR8BGeQ
 +4DL/XQbtNMclCkbisDn75GYH5rEP0IZrgwZmq7wF46bby7va28riiCDbQVljbuzBU8bLCd+O4b
 P3zZeEySAEiFlwyZSGfsZQRM1JKoYmT+l25s2e4io5bJYdzProGxyaLgbiYbR0X4roF4M8116vB
 sma192QzZSOBLrfIPWlF0BHd4fwpPLoKDl/jED/KOJ4gwgZ0YM4UTZdYL7QmwoSfqlHBF424eio
 XxnbMd5fN4Et/Bnmz7D543xwKFJkZJ/nRJguOxpbQgl4U0Rw0kek90BEV/6ozPAqnES4toW+
X-Proofpoint-GUID: dthAVA_gY9LTNRgSkKrz47-0iFwe9O6-
X-Proofpoint-ORIG-GUID: dthAVA_gY9LTNRgSkKrz47-0iFwe9O6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=915 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090132
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

On 5/9/25 3:17 PM, Konrad Dybcio wrote:
> On 5/8/25 9:26 PM, Connor Abbott wrote:
>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> On A663 (SA8775P) the value matches exactly.
>>>
>>> On A610, the value matches on SM6115, but is different on SM6125. That
>>> turns out not to be a problem, as the bits that differ aren't even
>>> interpreted.
>>
>> This is definitely going to break userspace, because the kernel
>> doesn't expose the UBWC version, instead exposing just the swizzle and
>> userspace expects that it sets the right value for older UBWC versions
>> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
>> It looks like the data for SM6125 is just wrong.
> 
> Oh that's sad.. I'll drop this commit

Wait uh, we have this data in the common config.. why would it break
userspace?

Konrad

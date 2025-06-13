Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346E4AD9595
	for <lists+freedreno@lfdr.de>; Fri, 13 Jun 2025 21:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF2710E527;
	Fri, 13 Jun 2025 19:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSrPdwDy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A68A10E4AC
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 19:33:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DD0wun002664
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 19:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +fMLdwnRPpM/JGdtaQkyjB4OdZw1gHBXH2ofPLgbcHk=; b=bSrPdwDyVHDVY1cE
 FDtMc/JMZFLYRhZ6Ok535aWwgysIfTSbOug82ixcVXoINnwqCpHnxgxth9CGTkt6
 1irMAbqWu328Fqi67WFjPzuMDQ5ze21UntANglhyM8TeBdAqRJ+M2ZUdxs7RxbbL
 iJJ1m5cWBuV9fC5OBzkuAsa+dkUbglhBcF9fRHz6CFOK6JWSfQDOt1dMdvuqFz0O
 CRvZ+Z5KoNVmTjF7lk/K0FYvzIkpdH/aUI8iJNjxTVgKTV4AlLNhmqZT2tqcW1y1
 59EOksy005Df3zdjpMZeX+Bzba1rLEH+rb/iweSD62YV+X6px09i96UZgAWe8ym3
 BYigNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbpnsr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 19:33:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5ad42d6bcso56660785a.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 12:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749843193; x=1750447993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+fMLdwnRPpM/JGdtaQkyjB4OdZw1gHBXH2ofPLgbcHk=;
 b=CahMxA+IB40YrRy1F6JV2LZYFJ2/Hd6RQqAobLNJFgQlvRk4QLmKoeKafguSnYtsD9
 7XuVpj9J/BV5+BLLdXY6uaR3FvPDixumaTEhep7bOhFD8gKduB9PtbX3tRaWkIi2TCaQ
 5ok/iKJ86RtVWvV49H4AZnAwI2RC/+OgWG0MTYCbduKLpphtEGVqXmMAGYvO2CxJZPcN
 hoZ7PXgeY3UhKDW8bK0FRx5y1laXKlSfvLaEsK72tS2ErG5rD4weVw2R2zvooLO/n7ph
 s5Fd6zUruOVLUtX1m6x0hZwqZEu77EfROQe3fZ0AvqObCzUm5CaPWCqjkcTaiZUw/JVp
 MIlg==
X-Gm-Message-State: AOJu0YxU5SOmtx0yNWHfsWgpIf0NtdnSx9UOXdV+RrcENllRBGkPItQ8
 g8yl8Eef4lB2s/UJgHC1wjEu4VwKhNXPCv6GMOBsndgB9lngnIjo6rZF7PeXtD9LUFetzQYPrGX
 aFCOQPUZlWlO0f5TDUR2E398vVfkBNC6i/B1Z++fTeSWO33ExGNIXAv++4+m0nHImiq5gbaM=
X-Gm-Gg: ASbGnctpsB4Jf76MLpUk3rTeaa7EyED/QIEaSKOFysfLbh4fytr4iBmEUBbco6+TiG+
 ISg1yJ+suhfDeqHc0oTUdNxktYxQ7+uR3wEy7Kin2weYrCeeQiHeDoA+fK5yd/EwGSFNk72xOo+
 yAIWzhjxoqS+xMDfjvtqnZnxaj72+P5q5U5A6Elt3wVapMHoXls2wzDiwcokC10sPFiHN5k1R+I
 LAtFbYM9kaqtZOlWNQTC+dCDO0hD/rMVdZzyJyJt4mkkY1xDBdazp4ZzomDZWemWXrxuOJrvLRY
 FK0k702ZvCytRhUHfmQQB5YRL7/Fr+q2aYptNbRQF4U4AvsrfpmWO5W/1FwaZJwUXDWOVY726+X
 FSHg=
X-Received: by 2002:ad4:5cc8:0:b0:6e8:fee2:aae2 with SMTP id
 6a1803df08f44-6fb477fe024mr3165336d6.9.1749843193264; 
 Fri, 13 Jun 2025 12:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH01QDZOiXpTt+NsBhAxASqjmghXoKA9xtVp0rzR0/hmDEEoJUb0ozfkNkgF193N2L9KBI4Iw==
X-Received: by 2002:ad4:5cc8:0:b0:6e8:fee2:aae2 with SMTP id
 6a1803df08f44-6fb477fe024mr3165116d6.9.1749843192890; 
 Fri, 13 Jun 2025 12:33:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b48a8477sm1589010a12.6.2025.06.13.12.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 12:33:12 -0700 (PDT)
Message-ID: <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 21:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
 <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kfhdDAuWhAjsmLtO69ikPt7KftrZGg_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzNSBTYWx0ZWRfXyR8i1YGJ/SY7
 MRCg3w0+vWHnkH7Ew6BWPVQCnFKf9fzbWPt2i+pvIzUy+769trBcWWxNNthO+objE4RXi60E/bR
 mYl3w+zLl+jrKZGI09bLX+p7zImeUXuhYFBFz+rB4p4ZEArjuPbVM0IQE2+0vGekxyJ+IlJHnlE
 x/EkUIhmuZemKmrZoY2dQxkzg6sm0fmExN7IS5y4mQMqC/lZ1e44NsFiaWLJb4o7PDjbxv4Tyd1
 aYsPTLy8Z+NaXhAKU8PtqfL/+9/XzKtTYoG5cWb2Xs2Z5tQXkPj9YR6bJfhShijbMzzZnK+hxoc
 Sn3iEe3tRjjS0dbk2U2kQyxRf1xMwv3ACLn66ATnQhd4Hcug6UuDNpdS/erZTxZhERBnlOVmdKc
 yDmg/9Z4hDRhWCzlQH7Ep95O8z1adrBiBFCN89zhfvev2AfkT5IRXg0R9GNsrNtz3I93OtdW
X-Proofpoint-ORIG-GUID: kfhdDAuWhAjsmLtO69ikPt7KftrZGg_o
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684c7cfa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=BU9CULlEoaguDH3JKbIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=905 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130135
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

On 6/13/25 4:57 PM, Alexey Klimov wrote:
> On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
>> We want to WARN_ON() if info is NULL.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bind")
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> 
> Apart from tag problem it is usually a good idea to add relevant people in
> c/c. Especially when you fix the reported bug.

with Alexey's concerns addressed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F9B8F65C
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 10:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4639910E3D2;
	Mon, 22 Sep 2025 08:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHqe234Q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EFF10E3D2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 08:04:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LNtOep004892
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OBOlNt0KylCLkmD2DPMzP/dcM42JfiU2PW1abyinKzQ=; b=pHqe234Qr4hfKtip
 8vFbscrqsNDOJhQB6RrHpm3aVnDYgX+Z/kJlOKRtpAQS+BmMCNPZbbIgYBX8TWmQ
 71izMGieIm6StRm2fZ+V6HPEQ+Xtxw34Oiss6v1xpQNjc2WBCerD++Gfil98f04E
 fLRJZhDAIbe7ZeXi4quiOU2HYvvDZo+BFPKdadiCebtgvq1//aAkVZaq2fiVzvX7
 LUbcaVOsO7rmVQrDTnvEyWTE/d+sNF9k4VYg7y6R3hHIGVZf2zIKCI9+KRWrswdk
 pQey1qYAsRpdNYPhW/nKj7pWdqbRa+dKC5OZxs2lNSrOtrDrN3A9vEa/HyuSGWRq
 TB8gPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnm4jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 08:04:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2698ede62c2so13287025ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 01:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758528292; x=1759133092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OBOlNt0KylCLkmD2DPMzP/dcM42JfiU2PW1abyinKzQ=;
 b=EI3UbsAb3U6GJVBLXBUoT4eCEFpX0Q4KKZ2uJPz4+23BZ/IiUZrhxFyH9s3R731J7w
 ZNey6VwfTQ9fVV4z/gBtsqOWF83vWNsEpJ+uVXkWs8o85XF9rSrIzrodgdtibIlu4NOL
 +L1t5MWE6gsyGA8QsQJpt1P5bVPlH1WLZQxdy/4fub1kO5bKySjE3WHfRQlfo6w4z0vh
 4btbk3mwhlMGbntXq6iN1sLXWe88xIvQwacIf/0sMYstds7OYn3na1RHpngMQ1I5EwRn
 V1GhkbEdtfu+4aEb8OcQyiT7arSXDObRG9+p2yOerGF+VWd/cRWFKCKhTdurmncvhkbj
 V/4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtP8rDj90NiANDAlc2pt/EcUwf/invz6AUVa6GzvrOhIju1T50MW64561Q/7IN7+YTMZRJIZ05LIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzprJvXwuDe2wER0dw+3L1S2oOPEhZP0EcCpKLSg29PoGRzUfiX
 Pr/8Qn4wpm+EuX1t5C//Z6nsLEVmXUu4uAamqbbHxbBTb3P4GzIJmMJWqKMhmbzRbnoIaQtm1oW
 qh/OkbyOwdlFCkTjpqrzbrHZ3SACvKOV6UoPDQ8UT0uV4ipCwS8eDtw1r6/bRisD4P5dLEs8=
X-Gm-Gg: ASbGncu3GigcgqvsSDm7jRNbvujYwMWfqV1zcNM7RvCYhG5qWTuipIm42e1xhFei473
 oXa6TM2zHk+BNm9ZboauIHyPPd68y8EfkG6EMouQHuCFYVlY6n/u1h6uYq5RIxCN2zhYBVqe4/K
 w/ZBe44NHVYVFYfdshRwXcI5Y0o5kcJPpw8vQSMGB+0imieN10TJW2P5jL+shD8epf9VW540HRR
 E/DQI+s6KqhaknsUcUGpqzxDvrhU5Yo/V9Xg1k5txva2hZMbdIJmRbItclOAmaXpme7gYV5h6wD
 c01ijDRAHJ4ggyKdo0sVWa0QU0K1BrE5ZQeugS5k6SfuA7FNMaMqjvzX69Cwh3hLIpRPaXhrhjU
 BsrMh12PPMYXj7mm6oSnKB9sRXDoI15WKBg==
X-Received: by 2002:a17:902:8f90:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-269ba565f84mr64992215ad.11.1758528292461; 
 Mon, 22 Sep 2025 01:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETp7wbXt+1gQikMI1ABo2kP9bbRyManwLPmYcLYXRvB4adBdDDjXk0Op1hW4hh5H/vg0jXlQ==
X-Received: by 2002:a17:902:8f90:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-269ba565f84mr64991965ad.11.1758528292012; 
 Mon, 22 Sep 2025 01:04:52 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698035cd39sm124460975ad.146.2025.09.22.01.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 01:04:51 -0700 (PDT)
Message-ID: <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 16:04:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d10325 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=M2ADfI_v5YemfhxMpdoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fWszOxYfolkszTrfaaAJxA6mYhm0Q2iN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX5nMPfEwbihEa
 7QY3AlcVqjSxzeRmIf2CTR/WfflKrnDWqEP1vrcqC8JJGaYqAApg0zhHWGVQyoWnLT44mqzYyIp
 le0jcA7bcHjq2/aDhbBKl3VH1q2OaOyJScq8BNVOV1mzkG9IIzpGVdZNlJPULj0/G3zIAJcTuOy
 6fzlcCHXOHSglBmToa6Giyq7eTqQaYzCrI392LK0xsyYMpLBtjQitnGd5SDAo7hdDD7RHVDEq/K
 RCvUC2xoDHqlxVsEzkPUV8yJkBZjdFUq2fppsyGYvFXFhh1JciuMCBU8ZxgHLjeFcDKub+oz4MV
 DOzsqZlmDHoex9KuG1drGMDMz2zARWrsXcBepzh34qxE0qV9vMmD2FtUHpI2////nAH2wqB8CSO
 uK8IAcsV
X-Proofpoint-GUID: fWszOxYfolkszTrfaaAJxA6mYhm0Q2iN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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


On 9/20/2025 12:45 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
>> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
>> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
> Why? Start your commit messages with the description of the issue that
> you are trying to solve.


The original reset list only works for USB-only PHYs. USB3DP PHYs need different
reset names like "dp_phy", so they use a separate list. Moving resets to
qmp_phy_cfg enables per-PHY config without special-case logic in DT parsing.
I will update commit msg with issue description.

Or do you suggest using (offs->dp_serdes != 0) to choose the reset list instead
using new attributes?


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>

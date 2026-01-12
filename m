Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D09D12224
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 12:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967EF10E37D;
	Mon, 12 Jan 2026 11:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N92VpAJm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUuCcF9y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1057E10E0DE
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:03:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C852Y5138153
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=; b=N92VpAJm2B0J72Xz
 ZktU0OSwjYr40awJYJIiU0YSL63Z6jPC10H6sqrh9GaUnWrtGnKWuAX6CggLNoWy
 yBrm6x1NOjdvs0un5q049WP1IGK1ZOGkD6IRdsDUc3AI/DAked3UKd1oX6wOG/ly
 RmC1XpK2VevFfqM/FiS+uqJda2Ij7ina/r14ks4TVFtzm8xQXsrM9Qxuh8xQv7A8
 Goi+ZuqiMPK6f+G7jXWCwX7Ha1ux9ec+FE4DL5udZTJEfos9q7L1vWemr7tc1BxQ
 xVo4UBaHieS+0XX9Cj124LA8WKgJ6rBEoffaDRmJMulRYWh3dTVPphGPLnNGY2Dd
 qYQWRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kytq5m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:03:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f357ab5757so23064121cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768215794; x=1768820594;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=;
 b=fUuCcF9ywq1geFdu3IwNyZe8rXT0PBz1hrsFYyqQdCbdym4gP4Z9gI0+oEC+fbg3jD
 NYsccIURC2E/QthoZrFj5xFwGeHtUMGpKd9HIVQaXZa3Pq0bHmbw8qdAzsog4iOKRfHf
 5LNOl7vaAiV6gdtOTOBNthSIR7apwlfRQMneO5Km2WRxUoQ2tMKL+OUtfjkWj1nbpLDp
 dxRG+Zf5V241yt+aA10NT+/C/4mkHxCvIfNmjEe591w/UyxrKYrVbqwooU2v2aeZdx2k
 CQRgAUXCKJsm6giWXgCYXdEx/sf/QSrCduONYrIymqyJ8JyfDXa+FHlh9j55LlVJYzQm
 11aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768215794; x=1768820594;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=;
 b=d/kAuu5ot9/lWraXUuSqqVq0BxSom7drjlzM6JeExIotijqj9qvm5la33nxcWWdkKW
 xuQHAfJH5VlC39gsglXpBNfJbAQDlGkFGkAOlilm/09FQEjzDHcg78KWk9u+Cjb6IfVs
 UdJObQ3gM+aQK5Ty/XqNeMni0mkNJuCnA32gPw0hAmno2Qd/8pxFqpKsDQkWvZdAWZUt
 MxMH5dASXeyJKz89fy61znd5TidB4hoqbit0EXkP68Tv6rOcUzCp1aZKcwXHBVWwQLOy
 CKGZWpjAc3tN1EIPt119BTkrmk/9VKv206vXQcZ8Pr+mfqNEAgIfkTgeJvo1ykJbDAfZ
 UPoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI23GpH3dJfcCiwRTgXyFDPH1o7PUAsEdcxVOY3HpXn1Mrw5RzB0SzWd7BzPRlgqcz2Dj5oDZHnaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdwJB0ThmLFvU4irrwn2R8xCA0rSi/m4AlpUfUVusM0FgOT3Pq
 yglfVXSlCb1uq6BOFxkUv8BgbYqx2a6OkAtkPTinUzyIVir4F0Olf2t/sTKqkTGsiJ601fSM3ES
 R4/PLQhsXaNyjUoS4fD5OKcV+nK+dPTk82Vi0jIwbg0oVunQmVQdaDpZkGOp33ejp8qJggNI=
X-Gm-Gg: AY/fxX5uck7UyV7tBYjHJeplCt/Ey/moqSl5nMOvU9AuUbhed+nImh0RghxehjPKf0D
 HA/39c7SXeEG/puxI9V5os6ThYwwSCIfhx+b87E7uEaO/yVzYkNjy+ktE3VuNqq7NU6h2nNyChX
 mG5TyfwdSDbux1SWeR4fRItEWJmhKnuY1qNI9NAMnpjnOUyPFmphjfop52aHQwpcpFESOBm2/Dy
 WosR1xa5QTeA8UnPuUAAOPneQF9U+moEnA9HGJBadYs4mAsQVS1Alz/EhWTZTewS8JuR3z8g7H/
 R903Uh8P43RtA6aA6OWhrcXAYnGcT9j+JL45hvPX5W+4XB6sEu+jzyHX3PPAvT35v92OUJ4SCKx
 E7faYWBIiMcKtpEpdByaj/G1MIhNHSvfEPDW8KUaJ1D7AQpPglR7EFMPPViDm68awuBU=
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id
 d75a77b69052e-4ffb7544295mr183416111cf.0.1768215794617; 
 Mon, 12 Jan 2026 03:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPdWC6RVtIWLJZLBsPSoSldl8ze1rlBRJp0qiP2IpWdz0SLjxgaaX3bN1FJ0pL6PgEwpUCsA==
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id
 d75a77b69052e-4ffb7544295mr183415731cf.0.1768215794228; 
 Mon, 12 Jan 2026 03:03:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b872642beb3sm153934766b.46.2026.01.12.03.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:03:13 -0800 (PST)
Message-ID: <5865a207-16a3-4448-955f-beb769c1931a@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8k4AtCUo5fnuWkK2dK_917oE2B82iPJR
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964d4f3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8k4AtCUo5fnuWkK2dK_917oE2B82iPJR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfXwCC3ngnf0Fnp
 NoKRvDVY60q9e/vp8MzMJQYg03qSdRPOvVgm2vmM1TmcIO/RlAu7rcjk16/5YmBMzC56AN9XXFH
 1Q5If8ykVvCyjFDwK1MZ+yFRvGR3uBAYS0WAiDHci39zbtMF+If6fg4Mr29KVZFMhooh1ysZWTw
 NpMm/Awyb7CJmiPI+Cwa7W4jl7SUoHL3VgcuYUuFbZTjea98FrsItKpqJa0vMkLZTtLBHYzgt3s
 OhhKoIYU/yPah7UXNCto6qHbNHZnCqLj0FoHEnZ47/eK/uQBI26/L0+lNJPhAYrkwQYEJA2jXoh
 Pl6EZ+90iSznsuQvgqyyefvvljbX0S/ahrtp+knHxtyywj1rg7U+JMkTvr0NtijomMuwFzbUj9B
 T2gEuT71VlAY5FvT+/W0IR/PARVgC0JB62/9GulmjpopTErnnLOt81SohnvwgrzZc9F6122RGd8
 Jl1Fjh7ezIyqLfKaznA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120087
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

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


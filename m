Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEACB1C293
	for <lists+freedreno@lfdr.de>; Wed,  6 Aug 2025 10:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CB110E49B;
	Wed,  6 Aug 2025 08:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksDURSDQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C857410E727
 for <freedreno@lists.freedesktop.org>; Wed,  6 Aug 2025 08:59:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766PZXT022167
 for <freedreno@lists.freedesktop.org>; Wed, 6 Aug 2025 08:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c9I/PRnvwO+XAYuNdl+hXvdMXnF4nGQyuJTKHNoBE+s=; b=ksDURSDQKWTiq7qX
 /VjuPogM6lDUZx4KB/rQ3ZuuzyFazP6W6oIvdTWEdvXbLcbciAnZ+yC0mkyvZmOv
 CjODee7bCnFWdEQ5cum5huQV4ROS4Epy0JIV5H6Tv3GsYrdd6ZccnMPZaimvuOud
 QTdQOMUrCvMf32S4K8BjBRaB64oWJ3cr6ehPaJ4DuYHKvaHFDig41u+Y5xSQSyy/
 QcjICPFmt1qKXOT5rJiZmGTwPg6cslzOpB1tSDgxptiTGakp6qOisi5WZMjpNoxP
 /GK9zkv5TosWv8tAr3SKifv0N4k+x5DeJQlCLwf0ZXyRtcxVIn9EQ1d/nH8CQj/V
 QPDzaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8a0s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 08:59:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b07ae72350so6663121cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 01:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754470779; x=1755075579;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c9I/PRnvwO+XAYuNdl+hXvdMXnF4nGQyuJTKHNoBE+s=;
 b=BJKyGHO05XqQnQlu+19sUAJZ1OvpwewRVKEsBWQwGWcYd74HSK5XhNoG8lE7HMz9oK
 e5/2R6elb4eHr1MYWGrg4oGgtqd5qffT2DyrAyu2Q5hU+TrOBuPrrUwu268ISvplzWiQ
 vzXSxYdgZevil8jvnSiizQmb/+TBg3dDxVq7Embl5y/JhwO67aUY13C0EqGr25RhQeUY
 QzNT9moJxiZP4TyicPu3h5i7cLrl1GK2RJhHYJmIuqB7qgt9YLOMvwPhRvCy9DSzCMvR
 LnA4jL/0hx3rQigPRONTz11dwnSi4d1Tk6n7M+9ubeZ3zRABQwTU6rdODHXN0hSexaux
 Tl8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGhmNTV1aLpaN3GDi+J5Qx+uV6lBdyUJJzCrAQLfIKwkiTYvpUR8eQplShR1cJ3kCJaZCHAxzKh60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT2CYKBfjK2yQRb0UlxrN+lfMr7fxxMdyvBkBm1ZX9wUDya24r
 tUyn2p0NC6O1zeituPNHve6j+IParywrKx+ZaDP23MilGtxCk1jrqe+9g5qDhFY1a9TEVkkllKp
 5CkUvwt8pylwBI2LPDlJiOlMTjEd6Ps2Luo7m+6nWKNjGAsgwUy4+B0169kpI8pHlD6Wf+t8=
X-Gm-Gg: ASbGncte816yHNdJiICtTks8aU0E2OH3vYattpxkElprS3QSvKKrEbQT4numK4RxCkW
 OvRjT4+x5hhMJ5oHxoCGwOdSFmxkUJew8OwKFNMUalc1WNftau74QDgBNsTD9oR3HsQaRMQ0Uye
 GBZJnFqixJrRqCIqls8C1UVWEOfy1SZsq0Fma+41plUPpXrpMGBv7NytZKVc2nAJEj5eRfssZpa
 dC/ix0+rkk4CUKFPjxlp++TgEgKiiNvVt1MtIvJmy3gOBNo07IhWwKf8UTeQcGnepWEFK4sv2p6
 hsTQ2lAx9wYkiF/++squZAEGi34iKe0LcELnf0yq+heihdCaiZBjyuegTImPLSMpL+k9dWrtS4U
 jkUhZaBNJ76laMnJmxg==
X-Received: by 2002:a05:622a:609:b0:4ae:6b49:4d7c with SMTP id
 d75a77b69052e-4b0915d25a2mr12806411cf.12.1754470778851; 
 Wed, 06 Aug 2025 01:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdf6mYk0vm8CTUCUOiGdpuR4DjfOcWPVGZsk5L2Aq3igXFKb2AjbidwZTi756A4BnYvppCtg==
X-Received: by 2002:a05:622a:609:b0:4ae:6b49:4d7c with SMTP id
 d75a77b69052e-4b0915d25a2mr12806081cf.12.1754470778117; 
 Wed, 06 Aug 2025 01:59:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076620sm1052660566b.10.2025.08.06.01.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 01:59:37 -0700 (PDT)
Message-ID: <ecaf893a-0c47-466f-b8b7-54f9ad166b80@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 10:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
To: Yongxing Mou <quic_yongmou@quicinc.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: erThsjI948sM-hfXmRfUVhqJP5Xjxd_l
X-Proofpoint-ORIG-GUID: erThsjI948sM-hfXmRfUVhqJP5Xjxd_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0/jrJjQj2Ioo
 f7XUHv81j//MnBuVXICQMqMolf7bz7Vgf9LNN5N7Osv78f4iFnfw98s2kyh1xK+kckVFPlqJJss
 qI9EEX5X8S9Vv5JA0db1tbAzJ0aqSfSvwBNJAkuqNw6hcrj4zWhNcqUHcmOwc+r+Z9lWwB/F/Rw
 c7kZ3kWq7LL5UQOS/6yREfZkJnbc4ayGgp+dQlpVu4nczjiHBd1T3tg8Eit6Ah9oUuRB4Fqve55
 8UDxQwfgxOT1ArO48JoQfacezfVW7rZApU2gMB/d2KB9fnPvsBA6OVdYK02hpe2RGTWh16u1yAD
 +21wscXZO1c5iIxf1jwP+HmChI7xGgdZ+Je2StRG0HcDtuoiqZs7AVq961g/edsUwKiLR1EgAIc
 860rOQQF
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6893197c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qcYK-ZiiYIKsHLxbHAsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On 8/6/25 5:16 AM, Yongxing Mou wrote:
> The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
> the SC8280XP as fallback for QCS8300 according to the specification.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

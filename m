Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80DB419DC
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 11:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A91810E011;
	Wed,  3 Sep 2025 09:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VsczgInH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954DC10E011
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 09:25:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583240J4018254
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 09:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V8xcTnmvm8vaCs5GzeHhTc9j2HG7qNwDmT3oTLQQlSE=; b=VsczgInHphxWEvck
 od5TCtrl9ghVLbLTHWdb0twQmaBhz6ybE47LtAXoOdfY9++I8DJYxKsiud5Xn55O
 vfkjfXP7jf/+n9Q6rxnluj9I9cPujwDFDSC0Pr171/rktCL7xfvGMvZpEUv/qEyo
 6Lh6EcvbFpcbMqwoCfAJRc8kPR22oA2yUuu9MYDEwZ8f90Py1i3848QbbqgrXSF/
 QjcPKVSflYpDj++vKFOvi467eEmg2eoISAXepz9skJQrqWPgB4+pLHDTLqQecBuL
 fYY4Ha8IpO7bvph/u9CawZB0Z9dbRZaG0m97e6Y77SVYnikut8A7jZ3m9sORz9FJ
 ISXUSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwcqq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 09:25:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b2967fd196so19022691cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 02:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891554; x=1757496354;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V8xcTnmvm8vaCs5GzeHhTc9j2HG7qNwDmT3oTLQQlSE=;
 b=aMY8e5vimpItCJB1IiaJqqguL8IeHgCRKTH2ehXwNsEYs9UgPSNRWRqW8haTG1oNXC
 j15tgxJ9bsczUmt2ZAjh8E4VEofD1KLdl5MK9/ncXKjhE9pdJ0NMdcVgzUQIcq0EfNjN
 jkE/eq4pakdxo4phKrpEKHcMBtZDLRdvW1x+Mf3L2SlwNyQZ73vfMxa5elU2D51J82cN
 JmMV+9/5fT8UfOTrsvWWGfsuiyyfwMzZHlh4uh3hhFJApFP16ftxU3/4TMfyTEQBeAvG
 tOvpxDUzHKs6BUHBlzOU/pf3xX/gS1eT6JnFTf0wWE+T/sodKkQ2AXV6wr3RT8J0i2JM
 e0gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSj6XOsORVoCYxhKhvvT0W86wMMMtfzypW5OfrKJsQlIWz85Z5Ft6v2yUp7Cvu5jwhemUVWXSksPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrVf+5/xJZbWLm6GEajCuQ+VDczZY5RP+avY4CovOFY9aq+HFZ
 2yh93K73aW8VUNQV9C1KJH1AkR7sVwnNPpGrEU2H7ROgfAeqmyIAhLB3PhmQjs+oSqAJdRSYh0q
 3f921UxvWRYClKOD+nww01WRlq1q/G0EKR2dQ8/NnqPl4WGDYpuilQS5F7/FJhk8ValbM7wY=
X-Gm-Gg: ASbGnctH/yajCubwR+1MRK2naBxXsDQvVDznoRZrYsIzWsPs6cD0yLrZgnufR9gS3e/
 0exnxsno6lsYMrBd8HKw4i5z9jwuLAjXsB682rjSqhX1Fj39HZ+mpptlCYVK4DWZIAnLuifsRLO
 hbQLKLkRlbxSqgSQ5aNtWttpMRhdJeOs2k1inw4V3lRjAzg0Utya+AnlhQ1tTD5VnBNuibtNnqh
 T0Q3c6qrgMrUwLfnVGikCmHEMYYgJe+lPKPaiKdjo55919JHSUrcMwOJcClk7acz/LgSzVdO01f
 8cN2WU1JyhKIzUYzBbaSAjcJDHdkTWVjSAjjwmGDYifR4CDoPJYbuFuNoPT4kH5Am8rOBmAuCFF
 4msPLHLF1HLv2h4O2QtnhTQ==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id
 d75a77b69052e-4b313dfd74dmr139717831cf.1.1756891553755; 
 Wed, 03 Sep 2025 02:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtzVlVNKODIar3OKV1Dpdt4jlT/5/HUDsUa/mjebH6AoF7OB+QsQV0PuV0R4ZhtiSsPcI5mg==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id
 d75a77b69052e-4b313dfd74dmr139717631cf.1.1756891553148; 
 Wed, 03 Sep 2025 02:25:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046af12536sm102654566b.100.2025.09.03.02.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 02:25:52 -0700 (PDT)
Message-ID: <b7a1b89b-54dd-4d02-afcd-0144df5a6d57@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
 <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
 <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX1AXhks2ArI2y
 lBxqkKrQPtzA5mkksYsgIvPYGN8a3V8Vl8PpHAYQy+kpndcB6PbVYyW9H75RPf46PKNtPM53C8Q
 IQSy/xWZdS1t7CW+EOVVV/zZ22JICf/BWIpIkED6+c3r4VpW1eGok/wWYnZEDm6832BLQv+w2a5
 ZsDKH8jn7OKeflcg2Z5EUrveVsPAtmNnUiNxT5V987fPmI81a6lmQGOx6VUH3hDdnCgDy7wJNQm
 QWCPWFIPI2U4rP+j7LOqlge3wZoK5TqTy6DogKTUmZFcZRiCH+xFTMzf4rqIvyjT3qpY/S/j4ax
 CN7qpuLzTl1sqAJLteRZkjAAvNS9JRsWe5uTUbHcggXuRcyeuPvBJBnMmuviaOgpzG6Do+wy1w3
 56dl8rQh
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b809a3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=q_ebNChVWJ_O0X_IP0EA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7Ah44soJU3WazdSxf3Moepr5hW9EnGJn
X-Proofpoint-ORIG-GUID: 7Ah44soJU3WazdSxf3Moepr5hW9EnGJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
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

On 9/2/25 3:02 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 02:30:48PM +0200, Konrad Dybcio wrote:
>> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
>>> During bringup of a new GPU support, it is convenient to have knob to
>>> quickly disable GPU, but keep the display support. This helps to
>>> fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
>>> modparam to support this.
>>
>> I'm not entirely opposed, but slapping a // in front of the compatible
>> in the dt works just as well
> 
> Which requires rebuilding and reprovisioning

Fair

Konrad

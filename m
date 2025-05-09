Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60AAB138B
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 14:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296D510E120;
	Fri,  9 May 2025 12:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OekZo0N0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D58910E120
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 12:36:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Bt5VI008438
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 12:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nj3eTuWQfQQ9acGARQe0moB1OSB4sNdWAMULwa+W20o=; b=OekZo0N0lSQx2oHV
 8DoRNN12uLa1TXCMhuzv4XDkf67zS3dqE8tOuGbnGaaWxZI4B0rIoijr28ZkP+Ot
 4CnkSgwh4EuXKJmY+jpWhrOHszRvJCKwUYGzn0GP8IqfEnVxjd2Xzsz/JkawW8AQ
 9rdYXD1RaRU8oDuSVkrfqYtYX+KYzTTRCsUKw0d8kC7EZsURtxeClGOp5h2vduuv
 PT6Pjdn1FWFlkjCzAf4rJIAnj5uXDw9rhLGCfPq6RWRdf3y3f4EjbTCzFtnkRTd4
 lG9Nf0g3go90LYKcr/6uZHTTGshDsr8Ce47ySHa3zCvBqD5WdjDjGKyK8QgfAEqQ
 9SYf7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cn7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:36:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54734292aso56639585a.2
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 05:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746794207; x=1747399007;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nj3eTuWQfQQ9acGARQe0moB1OSB4sNdWAMULwa+W20o=;
 b=nQ1PetRN0Xb/KtQ6hY9B+NRscImwb4jFz0hEyA/ipzIDF5t567KA1C9NVLc1gtkSb6
 DPcL7LU8PL5ArqC5m9cIjQN6Cp7Q3UoUnmtlFPvcuV5+7BwkIojVAz5hb5z3P/1H31O8
 Jbd+1Bx2q7QD4XoyY7W/O39ADiE+BQDtfUGAqpILBYQMbehDvXuoYkVq25w935g8C1+R
 4UPs/sP/+oCsY7uZROwNJwPP3lkMrGmzYGMHf/m8JQuUhYhJy+J+h7t3SgHjhHDDLt5A
 4rClSky1eJpkEujTjkbFdppI/0voJtyI6Qw29k+AcVVzCEP8393QXQixHv4zqheDJEUf
 zTJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZxn2a1nRdxS1gqIRA2fyO4uVZLkG5+Tr0xGV8J4/Jd4E/ZWmi/YouG45IwU+4E9ugolMGRS8AB3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH275zvLfycgUhvxJUmif8erEgNqYAmcVxBBMql9LztaVNB3jF
 b24QHnF2XvBmY16TgGbjCXp2Z1FT8iN2nDydgoyUqqOxF7eSm5z1tQIOYnDlcnFckJ+mGVoTi8L
 LylO/EMx2VYkIr2aNOGe1vZw/EH6TKAZoncQALsJ06yWi4SK9q2jGc3AtSplueg0Yhl8=
X-Gm-Gg: ASbGncu98jXlv7mIJEq+wgbDvkNSrz4jOtD/HBKmYeIHNgewpLP/pgFdXxAoAluxpLm
 N9bcI1fD4M6Dlp6kRLhX3Wiwk7dnLshBrQ7JELZ4KgOCmDBJi+QMLo3uLdVaR0BXVq4EL1HV9TW
 YfR+ucEz2yztH7hoGqvbslIeIwWYccaXcJ/peTHg2i6jUBwtzRNKbwfHoFHHqVWQkrPVsuz5Dft
 hjm68jvjnmaFzOyxcT083ZhKrRkfYTmLvTkRWZCbOHBB8PJtmqhAuhoNxBLYjfMl5Hx+M47SlUp
 ebsvOIGKwXdOXPQdGeh6sTzeJQexrGWqXilYOviEcVZVfSsT/4+PrYNG/4IHokYjyIE=
X-Received: by 2002:a05:620a:f07:b0:7c5:79e8:412a with SMTP id
 af79cd13be357-7cd010f40femr186039185a.2.1746794207709; 
 Fri, 09 May 2025 05:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQhiMLUJ0ERqiuafBgH55DApa66wpoH4lt5Gorw5mA7CwOWIVCyFKphnkpkg2Nv6S/CahJtw==
X-Received: by 2002:a05:620a:f07:b0:7c5:79e8:412a with SMTP id
 af79cd13be357-7cd010f40femr186037985a.2.1746794207301; 
 Fri, 09 May 2025 05:36:47 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c83d9sm145517466b.28.2025.05.09.05.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:36:46 -0700 (PDT)
Message-ID: <407a75cc-7a8f-4a45-adfc-fdc1b72185e3@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 06/14] drm/msm/a6xx: Simplify uavflagprd_inv detection
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
 <20250508-topic-ubwc_central-v1-6-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7G8QEoadxOGOi22QCePR5C7X81wRZ2yzLGCaA8Um63ibA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7G8QEoadxOGOi22QCePR5C7X81wRZ2yzLGCaA8Um63ibA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681df6e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UaTn3js9I2XXQmNgdkcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NOSK6Qipq5TP4Ouie5twTlyYW52lVIWp
X-Proofpoint-ORIG-GUID: NOSK6Qipq5TP4Ouie5twTlyYW52lVIWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfXw7/XTDbc7mS6
 LfJYCyoMo9WVhRYePQj8niguSdrKLMtezAEnuihzLJdpofDa25QRFm1Ie2jkJzeYZvAqYGp3JFD
 tTsl082IA8dWwQCiua36oDdL9UUV76uOg82PUetRyoyYBxDj59xy7Oc8WhSoa1C99Hn/OTMIZtD
 H5BfNBIZEeVmgRAp0KyCYnwrghVXPF+rmcVzR/deM/CpfcStNywVrdSZ5q3cbFrAUdNi2vHUzch
 pya+7enmeC1h5+nbWN2AOuJLNg8VgAkYnesHAuHIkvIxSvobqDIpryO4c5CTevVh2S4f9dcc2M7
 iyTfrhTjN+VrLOMNJ9npd6SSJSF35FHPTeg9/6lPVX25OKfesQdAuUiJr7c6cGNbEM5XimOywKA
 ha1zD80bGJDKYkNp6PMgwzpeZd5UcHXejqSII7IJVqFTaWAgObmsyfH2uglgetJAJGyd/I1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=887
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090123
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

On 5/8/25 9:05 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Instead of setting it on a gpu-per-gpu basis, converge it to the
>> intended "is A650 family or A7xx".
> 
> Can we also set this based on the UBWC version?

Unfortunately that doesn't give us a 100% match

Konrad

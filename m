Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304ABAAEB44
	for <lists+freedreno@lfdr.de>; Wed,  7 May 2025 21:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB01410E1DB;
	Wed,  7 May 2025 19:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNgXu4BQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4911010E1DB
 for <freedreno@lists.freedesktop.org>; Wed,  7 May 2025 19:05:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547B5P6I019003
 for <freedreno@lists.freedesktop.org>; Wed, 7 May 2025 19:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +SHDmPRfAeDjssx8L+cu2l7LCPnVp2BGSEPoSn2MUB8=; b=iNgXu4BQN8U92D6D
 Lxf9aOjh+Vb2zIhmTz2xMpMRID9F5WtGLTuDNmZ0fWZjsLoOVBpVJJGGA3AyVm8N
 i5S6rbAo6tcwUIBENLofOj26VB0thosM8mqr1BtAZQ/bG6wW4mvKa3jkjkiD2FHN
 dCcI5OA3/Z+D0ToO88pqAq/lWKPC/Tqs43y06TrgeaHC2XRwkTGasAQAW79t8qbO
 DBRZRY5h/xL0PtidAbmVSy8GepBaUYkjv3tdj66Xo/hTuA9/oCsf8Tj6VInE81k6
 I8WSpylLhlVdpshdngSxHx45/y8XddFVgDKGXTNrLzRLWO8czpUMB6GXh2FH7+ot
 4bDrGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg6qd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 19:05:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c545ac340aso3976585a.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 12:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746644723; x=1747249523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+SHDmPRfAeDjssx8L+cu2l7LCPnVp2BGSEPoSn2MUB8=;
 b=UrPJSpoVgkKyJ4mu2IzHSllxOO3Nti6Pplw9sYi0a6slc7h6vfUtI3gqrVhpdy8quR
 QrWo25pFfFv1X8UeTXtY3C4nxxCf6FKFsl/hYPnm60+QkunqbDiW8QP+fiQ5VSpzVKow
 iTNnFX/04C6c3e/i7GXF/gQMi7w1bNsuZ+KqZBxw04T+rMa1rghUehX35KTbCU+32/wt
 N74wuD3IKiNGZKjZEDNSjBkCGiVDh5cqd4lj+WJB4d+azkmiTsjQbOWDeKBUXJfWFOYH
 TILqV1thEs0OeGCPslNML0FPIif0OfKNzigWeaCVcJkkjT4VKetsASKkOmIC4t6GNu+8
 Eq3Q==
X-Gm-Message-State: AOJu0YzrfmZk8Y9T/m37EGy7sIyVUajM5EAHuAOCmsJ5gR9YduE7v01T
 26dTAtmiUB7VHOCr4vpPRFst0t9SHzqVlzOuuBjV5mZVBRcopNnl8abkt0Lh3MpCq1RckuvsFYr
 V1/0MTAn8YLzJXmozlU+viya6vxSdueGp+tOL3sM4UWnkJricMqNcR4OIhr+I5hhZWpg=
X-Gm-Gg: ASbGncsNu6t1DPT4nCcdJkL31ZEnE2CpPXtiSSyJ6uAgAQmslu6ifU5zkJT7RPt/Zcp
 GHX9s0pK3nRucXRK72wQDHjMHzacvqWzrTAYQa3dW3UAoPPUi9IO13CH7UC7dZX633FksfRy7Ca
 dXs6dgOQiC6LE4+cmePoIVMuCc9mBna46NuAdhkjgYPMdw/xXpBHkCLWdGZVYjBt7UUfrVoHnuA
 YKY/g7PVnZO4P7lMvdL8EP34z2PHNp7HFBxZq1S3qj6qT9Mzrtjv6JvTuM8HciAD5eZ1iSXBdsm
 j6d8RUj1XGy0UacGp4ytUjvZvn9J5zZcA9LSJZF1kN35++q8VbV1lCgjFeq+nB6Fiy8=
X-Received: by 2002:a05:620a:318f:b0:7c5:6fee:246f with SMTP id
 af79cd13be357-7caf73734camr275203185a.1.1746644722775; 
 Wed, 07 May 2025 12:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi8oUmL4ldGmEKyWAOMA5TwxCGWZERQSSET3xMoBXXRc5YWp0bJOTj+IEY5QkdrpAQaT3HLg==
X-Received: by 2002:a05:620a:318f:b0:7c5:6fee:246f with SMTP id
 af79cd13be357-7caf73734camr275200185a.1.1746644722249; 
 Wed, 07 May 2025 12:05:22 -0700 (PDT)
Received: from [192.168.65.139] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189147329sm949542466b.1.2025.05.07.12.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 12:05:21 -0700 (PDT)
Message-ID: <e307c4aa-1dae-4d48-ae79-36923372c8e0@oss.qualcomm.com>
Date: Wed, 7 May 2025 21:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Remove MODULE_FIRMWARE()'s
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250507154723.275987-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507154723.275987-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i67PviAkXEUJEl824uOuLLWwb71SS3ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE3MyBTYWx0ZWRfX7DgVpZ559SSU
 dZMYcc8J4wJFJaSxbAasXGzmUYUD7Qa0eLbYAxFUtSy72rmCu6OSsqM6dtZZ1BJtKmLFuuG4zvm
 eS+2n4HpoQlTqJMo/dycvTXxVChugguTLDrcbkYnIbrQedbhRarqL5nSGAx6fS/C4CERCCdB83b
 0wBizxouBIH7syzuGX0wnuPG7kcnw8SBYtb/+oKQNCJUBKyW/rR+88GFCHsShCQJljA5of6KIXS
 16qjGUIpV3cqte7oUtqgKrjjkgDWm+ErQ6PjOjWNppr5Gq3UAUkP7F3NPIMdU0q/KRNjKWcaFpQ
 eF3UR4+W+a60AFE4SaRjgC8PlKc8K3i0vK4SFfm3L16TfDmD0uRr6Bvu1E5RGrhKufitLAty46Q
 6bdain+mSw0H9N5k6YSiSK+IsbkXmpcrB9fcXQBc3VlTrIbVISyiaoJEW3NtEDLYcB58nepm
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681baef3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=O4ZBKxZU-tJ0OIaaHa0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: i67PviAkXEUJEl824uOuLLWwb71SS3ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_06,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=862 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070173
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

On 5/7/25 5:47 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The driver handles the case where gpu fw is not in the initrd.  OTOH it
> doesn't always handle the case where _some_ fw is in the initrd, but
> others are not.  In particular the zap fw tends to be signed with an OEM
> specific key, so the paths/names differ across devices with the same
> SoC/GPU, so we cannot sanely list them with MODULE_FIRMWARE().
> 
> So MODULE_FIRMWARE() just ends up causing problems without actually
> solving anything.  Remove them!
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

it's probably the best decision to avoid all the mess..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

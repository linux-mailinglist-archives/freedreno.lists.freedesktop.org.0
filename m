Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5780AED9E7
	for <lists+freedreno@lfdr.de>; Mon, 30 Jun 2025 12:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA3410E3F8;
	Mon, 30 Jun 2025 10:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBMmDasa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC22D10E3F8
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 10:34:05 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DBZq023313
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 10:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g/DSsMm2kVm97th9bVbLAFQC3F5AhKTQNEcJC1748oA=; b=BBMmDasa3kkvlduS
 e7tyBDj6a271BzJUI+pMBE2cH3olV3LZbKolDv2l17VWcRmzXTgvxrW+g81jE7x5
 rTiVnRCzQFLYN3hY6stwMh2dzbdjvXzu5Rr4XFrIUPh4DaxQtvpwnCGL7DayGvHa
 nC2ZlU6yE2u6XyxFxvWEtEUE6FjVEQDGaCOQaLorxT556tahwkfdsJqVSP6QKOCT
 hHUflSnBkAnRukLnnABsMSxTyLsLB0O6nRQp+zWU/fOoFSTWHtEmAmstLudl+r+u
 hba8y1lvE56l3Hbf7xLXdQ1pc+EJKCm3T3wDmShPGNKI0utPop46kSfNYmgedKZx
 Bv0gEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kpq28fc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 10:34:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d0979e6263so14067785a.2
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 03:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751279644; x=1751884444;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g/DSsMm2kVm97th9bVbLAFQC3F5AhKTQNEcJC1748oA=;
 b=ZZWEjirudOsJJuCHQOCEacSwh6H6HIu20RHP5lNtWfymVBvoVOEP8C7smNHRsMr7Xq
 hW0ETUzEKwZ+sGvCKS5f6BDmflrGWubSGbUNJxSb2Ihu7IbjKSNeukmTeENWXvG74zSh
 V/vu/64twAqO7l9NqBU13YJDJWhE9GTeF7BRFpHJRS5ILD8Fn01p0iAAVjb+VZyL7j/0
 /BK8hXIv9ZvLOkKrDoY5cMUbqiIrbi39ApKk9Elu0h/9LYJJQ/MwhZ4M2mp/bYdFnv9M
 VGUwSy6MER5/Alf1iJArGsTmKJ3vOtgrLSX4QREkyKD6DMcvdplmO1UUEseevADVzRd0
 Pd8g==
X-Gm-Message-State: AOJu0YxbN48/+2deALtSMqkUwdma8maDtF5bfYH373GSFKH5IfpWIfMJ
 xc/oXszfLh+wfBFlkNevYLpd7FnWCY3EpB6R2BNavvs3UYlEW1GWuRX/oiMfooLdMjLPB6JkSKR
 Yx4c6+6XLaiwZFykAmldSn23kjun6ld99IuME0Q09+YQZJl+lp4Dp0HRB+5VP3eTZ24a7U7Q=
X-Gm-Gg: ASbGncv+omhDgCnUA/eji/tPh+4j4EdfmjmttSq1Id9oOED7DXfgHpl28Y83fvD1pN0
 YyqJYyl3A+QkNbRu3dIJzM/dcGMDzVP3F0r2KXOF5g8WnF7A2CDg3D/Thrid7u6Vc97ksaGKoUf
 C2aYuYwOun6YvJKxd/dQmFce91omZd2vN9lepzo1C51PZOVpg5lUgk282nXi1yQPVEAIdYa+ju2
 /HEFO9V/UnWJOi95f7JqRsTQt/iA+qRdwxPMcZksauqRsJG68XUpcSWdTf2bmJYygh5CMhMMxFp
 M3sfdYJhYn2Gfq30EwAf+G1AE65t6HYr8N6lTWvvILjWlCGE+YsCVd8FfoZ3jvKWrarZ7HkAN2I
 RKhel3QZn
X-Received: by 2002:a05:620a:a218:b0:7d4:60e5:24f3 with SMTP id
 af79cd13be357-7d460e530abmr63824085a.6.1751279643696; 
 Mon, 30 Jun 2025 03:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF14u67wYVOXU0dwFwQQCwd2FEAqwgbTauB1E2BpJpoGlhPPQaUrdj7uROZsLTFGEwJNwiJMA==
X-Received: by 2002:a05:620a:a218:b0:7d4:60e5:24f3 with SMTP id
 af79cd13be357-7d460e530abmr63820885a.6.1751279643192; 
 Mon, 30 Jun 2025 03:34:03 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl.
 [83.9.29.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c828bb7b9sm5684192a12.15.2025.06.30.03.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 03:34:02 -0700 (PDT)
Message-ID: <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G4scE8k5 c=1 sm=1 tr=0 ts=6862681d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_tQuiCBsMoVRMLc1B3gA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Es7-gMxKfRbjjMNTMHI1H6d909DLYuEx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4NyBTYWx0ZWRfX84QMRi5Gq4Nx
 KX5LOCrBn+6ky8Pj3MFahMWKc1xQq1xfyfKmMzX0GQzC9EOrIu7M9enmRdil2XqBu+NFucFw6lj
 +/ffF+qO4GLhKCgP5hIMrM0+cVYvNjB6qIZBncMZL4SkOCe187ADCAi3xSBc90Qm9QK7M1AsI3U
 kHYFEeLk+aQ66k7mFnXtpl8QUYd5s+L0SLzEXjMv5XHPODZeXzvifCqF+QpROikLPr1ESleX++T
 nqQzn4pz/BZuUMzIWw3Xtzu3SE9N0nhFsblZM72E2p0L9nCbFeyTlWRjdVReqXMqHCZ+51D0K3e
 uH/umqPLsxcCsvhGrT7HiKRBF2uGcsv/gEq14Zo88FUjHFNAbVB3i4yT4yPavgBYfeqJXcjpN0n
 Qs1Ko71SinmACBSPk68f7masBrvVNqtlnW5WdcNejHTwVSj0A06Uwt9UAk07JgTogaDKqapr
X-Proofpoint-ORIG-GUID: Es7-gMxKfRbjjMNTMHI1H6d909DLYuEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=773 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300087
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



On 29-Jun-25 15:58, Rob Clark wrote:
> These runners are no more.  So remove the jobs.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Do we have anyone using cheza at all anymore then?

Konrad

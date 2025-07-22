Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25E7B0DBE3
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 15:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B56B10E6AE;
	Tue, 22 Jul 2025 13:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuBseHBs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5865A10E044
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:55:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7P0Yc013299
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8FxxfuLmav3rtJMFdmgEGtcB
 RN24c33Z4J181Ntj5cw=; b=OuBseHBsJciLM9V9eyKUMsshokS4fXHHtBYtObDQ
 1NdSZffq9+hHUkMoF9P/gVIzXe6oS3TMwvf0kGptLxR0m0xY6UdjXJ5+wnQfRvnd
 kwlUputlxh/BL4WFsnFcBQdD9wV+soilJFXZWTTfucdvl7J3Z/5Lh5XE3C6T/ir6
 UeuIhDVoLfHUnif9UfbNQlnOLpQuoeyZHk2CSjr7ajPFblgK3/XVybnKWGzMeZUF
 N5Xb871llrP6vGQb1l3/q68sDjsDjQKV6gKqyRHomf8IDLkqk2QYkWwkmgwe/y+B
 x4Dz4EhTl6icbUxvwiODIWTZ2KA3AvXy6u13LgoRJaVTAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3emek2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:55:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e095227f5dso870853985a.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 06:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192523; x=1753797323;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FxxfuLmav3rtJMFdmgEGtcBRN24c33Z4J181Ntj5cw=;
 b=NFgI9bkHE3VqsiUwV6BU9MIj2xZToVBZ+7xz1wH7qEmfBQrp/EuqkTg5WxuaIRWNDl
 0bcnE/V2n4fTBbGdB3xXHP9KzbrGw/H5genDcPfKyJNncYSoKaCRzOipnEoVts4UhREr
 1yLJvowvE+iZ3dlkDzw3vKOpBu8MNrBTSSA8/D4cepdT8RSXbDH8Hxaej+2o+WgMaAuV
 1ESyeNa+jwu52Rp/sKkJHdnlSLsBGG7hT3jBL1CHbuPs+JVWa0GSEi8ACHNSlqmIvrTf
 xtjUhiEHxyQQUgZ4JeHN/Q/u0eSuxc6P5eVahmkrsfo8gFIVQNSTS16Ek2Aet9sez5zY
 5j7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpJMHet5x/I6Drfx0t4z//fOyllZS/EwWmq1vqsw9Ok4S5J5wToRGDlnWF6Bd6vYBGK7SISWBBCQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxALl/Olwu0wgQ+zo6BgrV/ONrMy8iL/a9PWZmXyKdib10nt5iu
 WMsQtiT0M62K8TbjTS2ETGQSCLTWFq1F4f++PJeG6npvgrS8g8sfHBJm1ZuvB6agfPnJ8D0cgOB
 +2+/IGaTcq2vuykR0pXxZq0U5nokwvtEqLjc73M2AqHgBVjR+XrdLnYqu3aos0HxcPQLIlck=
X-Gm-Gg: ASbGncuqw70lHloT8cu1ZQQrPU5JqoPc4pt51OtWKw+B+BSq9qEq8epsLomWOV4zBKr
 jf2ek8SJtWPrxwRY/jPp29PcpYigWSNJA8IGKM3OGeu2sRG7iZYHFkmV1Mph59S9wTzLleKqgjP
 EEDssJKihaXMdN8Jw8f1aLwg6eq4qbMQBxkIYPqvKVeTQ/QCb+ocPueOYxTGSzm1SZPAGbjFSNQ
 6pKBUGX+/FM9le4zqAOprxGTDfHOePSwjf/OO1Pynef9WR8Cmdd4/NsYaIAtuglZF2sn3/K5Bq4
 p0kejC/I7GSQlMOrcCSrjg8NvR9DgwNM84CjveLBcY8CGxTnB677zgDYoCQzLkNa10Xiak0W5p4
 BUF88N6LaPkR4vPR/fsDlOAwqfhRVvJZ4v54fUUNJ3RPy1GrEGbgK
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id
 af79cd13be357-7e342aaa43cmr3564066685a.14.1753192523348; 
 Tue, 22 Jul 2025 06:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSTMlUUIcQ5GQ34bJaL5Zr/uF8zkXIHPl/bxOYdlNcBILtA/tK5Op9PqoPa06PAlpWzt9uJQ==
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id
 af79cd13be357-7e342aaa43cmr3564062785a.14.1753192522837; 
 Tue, 22 Jul 2025 06:55:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31dadfbdsm1951812e87.216.2025.07.22.06.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:55:21 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:55:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
Message-ID: <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xTqKQ_Ooauztc-8KMVpdao8LupRDjlGd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExNCBTYWx0ZWRfX8Z4TVHMUtxxi
 OfmDmA0U8THKRxQg2eYXINZ2D3hlO6cVTlma0o1iJviyOVChqpZIc0l6hEelRLQVcGlagTOYc+D
 zFzaImGx+YRcLPijvckbuFh+SbczfjN3RMHgdguEOl44sWRxV28DPRmUROZlyyYbGkGQYgwfzvA
 gTWznTcKPh7JuE1hNnIa8NG3hR+8o/+nOK4EHhMTPIqAdtpySwleHy/3TXx+q5QDy5F0l5bFuU6
 dVrAq90xYGE1kbA89iQ+njiIIhU7Mmb0ZflTHzCF/Cf4E++9RHJN5Qe79rHXA7DSxHV2FITXfwd
 iPSoy81VS6bkZjo/iggrela1ZkdNJLJn1Bk/ke5ENsNuH0wRwrLPU4cKCCMp+n2JrGE9vSNqkL1
 qFGjSaNlasuILy2OtntS1UrjStVaVtwuKTPhEMIzaLWLwzJNfpw8BvaR3bdrUmnv9ugOydvm
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f984c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dsTHFzNMvnhyJiqkEZwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: xTqKQ_Ooauztc-8KMVpdao8LupRDjlGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=632 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220114
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

On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.

Nit: GPU

I can't stop but notice that KGSL enables IFPC for a bigger set of
SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
supported on those platforms?

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  3 files changed, 78 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry

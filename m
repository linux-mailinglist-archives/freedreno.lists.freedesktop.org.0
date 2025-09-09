Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07345B50089
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 17:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2187110E78D;
	Tue,  9 Sep 2025 15:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fq5ymuoA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105F110E795
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 15:01:45 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M4Dh020602
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 15:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+YAkGp0Was8SY+eD78frAm2r
 kjGCrvc6KWsSn1t2uZE=; b=fq5ymuoAhCxfolSJ7QsAym0GWLEar7BQu4+tpmuq
 o+JzNNpJQxs4yIecyqSOB/xNjJQlO9N347rAkP7ZFcqiuZXPMbMv+zwM2Y9GhVV/
 s5jvxgSEGG+IQlKe3s34ii9GYGguXNOhEqSWacsDMmxW6uPYXgHJ1xkJPHTRcuAb
 nz1n8yUcCxfG0OMnlj6Ys8VvJc6+OXo+9M9mmAFMRgzffJbiNTXrRV/np8G8P+XM
 zY0DcvMHF1f3ILkY8XU6FWhMUDZ2pkBiGe1uZ3Vi1XTNW1Y9JIPzcK+cLIPm0jCV
 Vwer4dyuWdpJ9jlYLXCtjGGJoGAiJZw77FiF+xC2R0ogAQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc24mqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 15:01:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-53928f6338cso7670449137.1
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 08:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757430103; x=1758034903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YAkGp0Was8SY+eD78frAm2rkjGCrvc6KWsSn1t2uZE=;
 b=w0sjWNGqqnar/cBhf4k3Iu1X7tvmAt0oThOZ4oAL4JR9OgZha2bE+hz5ubiuYVmiaJ
 LSHgRO8NRsijCbCKBy937B0JLkNYIdrQIYd3Y/9t+0drExNN4bWaWYoWRSs0Wyq+MMVC
 vZ5WItWpMQPz3VJeaEJ8IamgjA1MqwkHZB7AOymJfhH8YWxa8J6Fr67fmemTwjyBRbLK
 iY7eHkevI9lGmDIuR4sLfaweWI6kUdMStUXpSck3WM9IY5nunnfzVoNguzLsdV1lodLC
 s+TKFM9ga1ryaFM5g+e99R+DDCA0FRFn7Em4uPr+kuB5jkuxxdCkwPkuKYkN2ywMnHDc
 k5kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTvK0989wmMdYcp9fWCg+psun+YGvOs+g6iyogN5kGO/lwglCTkmt/Y8tybZLUCQwyg3Ag5Z4JWRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDlutpHnYjbUpdXypKImA7ZNou8YB1OJ7LRWW/Mek60fxXGWFc
 qm5cFUWPwrUPhQCf/MmstviuKFH6SJaCLfMuPKklgHIgk1fcp956/+e/M6iSEf/0PjFdTU5qNu+
 0zwax69XGxQTcXxYJd9RiQq3RNkj/Rn+//AWUQa/fk3Nrk4/BTyS58sNTYdxUYKJrdKozCpQ=
X-Gm-Gg: ASbGncvXu9hyN7iXUGBXp9nNInRxKMUCT5uIENi4ODcQb4yCT/3DnTKnImIWQuUbQJz
 u8zap85FKKpANj8AdZzsJ4+JOYFPfHAwVuLfX17Gxz6RIINBZ4SI/Phg8AqRhoNbGJDt+AAo4gE
 r2FTXFUI7HQ/8KZrHqJ2P++5FJi8TtbRVgikmms+is0g1hGF1u8JK60lNRzkMO70XPf+uSlWlG9
 w+t2Sm/g/zRTVGUwkpbS/O9pOKAnjM+go20EHELiKsOBTlv95KUFLs21V+341gmXnHbTyel2EQ8
 bqoF1WqjAGsKMd5NFxvIfTLQfM8Vwo5BnadaqIZ9AUJWS3ct07YWaklTm5ZP7iUXgG08gKUyEhU
 +aKj0gnw4iiH4Y5v8rcIAroqWkkhTB89xVslNEkQPF+9rjyxOHQV+
X-Received: by 2002:a05:6102:809f:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-53d1c3d661cmr4304897137.9.1757430103178; 
 Tue, 09 Sep 2025 08:01:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbmFVS3O9rFOkq1qoy/EYq4X6azRKsts/lxojCWvOsI6IFbFnDvbit2/OPl1wUqGZICszRTA==
X-Received: by 2002:a05:6102:809f:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-53d1c3d661cmr4304813137.9.1757430102638; 
 Tue, 09 Sep 2025 08:01:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680cfe2496sm587402e87.61.2025.09.09.08.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 08:01:41 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:01:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Karmjit Mahil <karmjit.mahil@igalia.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] drm/msm/registers: Sync GPU registers from mesa
Message-ID: <2rlos7qjnawikqhotu27svqyo4yevpc25cugscc7tihxz6go73@rfas2xavrn2n>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-6-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-6-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c04158 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=rLiRm7ZfGlefp7lywOQA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-ORIG-GUID: HhIeC0zcJzmj8JPLhPr-uyMNXZUFEd6S
X-Proofpoint-GUID: HhIeC0zcJzmj8JPLhPr-uyMNXZUFEd6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX4vwFURvBo+qm
 tjv+/9cqItrwIkbDq4pVEyLKcaT9y6bzER+aOIwofxvaFPK7OQVhFeIbqlFYACAhWMSeNKjGTL0
 zuveArsS8um/c1U2ryjlTZh008KRh8qFA61jc9f1sia8l2y2Ovd+AmX5Z645xjK1v9RUOMwwTgJ
 UOpVThcfO6ZFhyv9KCOeILpu6lpbBLxL349QPOCpLQ0kVoRQW1P0+fJP5pEfCx3AGw7+uYJf+6R
 +z4EiEKJdomJ8B9wrx4wXtCShGrUQpANI5aT483iw6ymIB6XFCWRncc8gKvL/ooP1rcHHA7/Jpa
 IkH8ckhoCz/I+NVJDnN5T/uZidWlk+0tiW2WfPWow3yU0YicmYBdZ3jGHDuXcnfY1XZuXS5Q+P2
 mb3c8JpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On Mon, Sep 08, 2025 at 12:30:08PM -0700, Rob Clark wrote:
> In particular, to pull in a SP_READ_SEL_LOCATION bitfield size fix to
> fix a7xx GPU snapshot.
> 
> Sync from mesa commit 15ee3873aa4d ("freedreno/registers: Update GMU
> register xml").
> 
> Cc: Karmjit Mahil <karmjit.mahil@igalia.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   8 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   4 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 702 ++++++++++--------
>  .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
>  .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
>  6 files changed, 508 insertions(+), 475 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
